##---------------------------------------------------------------------------##
##  File:
##	@(#) mhfile.pl 1.2 98/02/23 14:13:52
##  Author:
##      Earl Hood       ehood@medusa.acs.uci.edu
##  Description:
##      File routines for MHonArc
##---------------------------------------------------------------------------##
##    MHonArc -- Internet mail-to-HTML converter
##    Copyright (C) 1997-1998	Earl Hood, ehood@medusa.acs.uci.edu
##
##    This program is free software; you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation; either version 2 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program; if not, write to the Free Software
##    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
##    02111-1307, USA
##---------------------------------------------------------------------------##

##---------------------------------------------------------------------------##

sub file_open {
    local($file) = shift;
    local($handle) = 'FOPEN' . ++$_fo_cnt;
    local($gz) = $file =~ /\.gz$/;

    return $handle  if $gz && (open($handle, "$GzipExe -cd $file |"));
    return $handle  if open($handle, $file);
    return $handle  if open($handle, "$GzipExe -cd $file.gz |");
    die qq{ERROR: Failed to open "$file"\n};
}

sub file_create {
    local($file) = shift;
    local($gz) = shift;
    local($handle) = 'FCREAT' . ++$_fc_cnt;

    if ($gz) {
	$file .= ".gz"  unless $file =~ /\.gz$/;
	return $handle  if open($handle, "| $GzipExe > $file");
	die qq{ERROR: Failed to exec "| $GzipExe > $file"\n};
    }
    return $handle  if open($handle, "> $file");
    die qq{ERROR: Failed to create "$file"\n};
}

sub file_exists {
    (-e $_[0]) || (-e "$_[0].gz");
}

sub file_copy {
    local($src, $dst) = ($_[0], $_[1]);
    local($gz) = $src =~ /\.gz$/;

    if ($gz || (-e "$src.gz")) {
	$src .= ".gz"  unless $gz;
	$dst .= ".gz"  unless $dst =~ /\.gz$/;
    }
    &cp($src, $dst);
}

sub file_remove {
    local($file) = shift;

    unlink($file);
    unlink("$file.gz");
}

sub file_utime {
    local($atime) = shift;
    local($mtime) = shift;
    foreach (@_) {
	utime($atime, $mtime, $_, "$_.gz");
    }
}

##---------------------------------------------------------------------------##

sub dir_remove {
    local($file) = shift;

    if (-d $file) {
	local(@files) = ();

	if (!opendir(DIR, $file)) {
	    warn qq{Warning: Unable to open "$file"\n};
	    return 0;
	}
	@files = grep(!/^(\.|\..)$/i, readdir(DIR));
	closedir(DIR);
	foreach (@files) {
	    &dir_remove($file . $'DIRSEP . $_);
	}
	if (!rmdir($file)) {
	    warn qq{Warning: Unable to remove "$file": $!\n};
	    return 0;
	}

    } else {
	if (!unlink($file)) {
	    warn qq{Warning: Unable to delete "$file": $!\n};
	    return 0;
	}
    }
    1;
}

##---------------------------------------------------------------------------##
1;
