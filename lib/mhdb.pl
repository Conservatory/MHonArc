##---------------------------------------------------------------------------##
##  File:
##	@(#) mhdb.pl 1.10 97/05/13 11:00:54 @(#)
##  Author:
##      Earl Hood       ehood@medusa.acs.uci.edu
##  Description:
##      MHonArc library defining routines for outputing database.
##---------------------------------------------------------------------------##
##    MHonArc -- Internet mail-to-HTML converter
##    Copyright (C) 1995-1997	Earl Hood, ehood@medusa.acs.uci.edu
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
##    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
##---------------------------------------------------------------------------##

##---------------------------------------------------------------------------
##	output_db() spits out the state of mhonarc to a file.  This
##	(database) file contains information to update mail threading
##	when incremental adding is done.  The actual database file
##	is a Perl program defining all the internal data structures.  All
##	mhonarc does is 'require' it when updating.  This is
##	fast and avoids storing mail threading info in the HTML message
##	files -- which would require opening every file to perform
##	updates.
##
sub output_db {
    local($pathname) = shift;
    if (open(DB, "> $pathname")) {

	print DB "## MHonArcDB\n";
	&print_var(DB, 'DbVERSION', *VERSION);

	&print_assoc(DB, 'ContentType', *ContentType);
	&print_assoc(DB, 'CustomRcVars', *CustomRcVars);
	&print_assoc(DB, 'Date', *Date);
	&print_assoc(DB, 'Derived', *Derived);
	&print_assoc(DB, 'FieldODefs', *FieldODefs);
	&print_assoc(DB, 'FollowOld', *Follow);
	&print_assoc(DB, 'From', *From);
	&print_assoc(DB, 'HFieldsExc', *HFieldsExc);
	&print_assoc(DB, 'HeadFields', *HeadFields);
	&print_assoc(DB, 'HeadHeads', *HeadHeads);
	&print_assoc(DB, 'Icons', *Icons);
	&print_assoc(DB, 'IndexNum', *IndexNum);
	&print_assoc(DB, "main'MIMECharSetConverters",
			 *main'MIMECharSetConverters);
	&print_assoc(DB, "main'MIMEFilters", *main'MIMEFilters);
	&print_assoc(DB, "main'MIMEFiltersArgs", *main'MIMEFiltersArgs);
	&print_assoc(DB, 'MsgId', *MsgId);
	&print_assoc(DB, 'Refs', *Refs);
	&print_assoc(DB, 'Subject', *Subject);
	&print_assoc(DB, 'UDerivedFile', *UDerivedFile);
	&print_assoc(DB, 'Zone', *Zone);

	&print_array(DB, 'CharSetRequires', *CharSetRequires);
	&print_array(DB, 'FieldOrder', *FieldOrder);
	&print_array(DB, 'Months', *Months);
	&print_array(DB, 'months', *months);
	&print_array(DB, 'OtherIdxs', *OtherIdxs);
	&print_array(DB, 'PerlINC', *PerlINC);
	&print_array(DB, 'Requires', *Requires);
	&print_array(DB, 'TListOrder', *TListOrder);
	&print_array(DB, 'Weekdays', *Weekdays);
	&print_array(DB, 'weekdays', *weekdays);

	## I should use a hash for this stuff instead of
	## individual variables

	&print_var(DB, 'DOCURL', *DOCURL);
	&print_var(DB, 'DecodeHeads', *DecodeHeads);
	&print_var(DB, 'DoFolRefs', *DoFolRefs);
	&print_var(DB, 'ExpireDate', *ExpireDate);
	&print_var(DB, 'ExpireTime', *ExpireTime);
	&print_var(DB, 'FROM', *FROM);
	&print_var(DB, 'GMTDateFmt', *GMTDateFmt);
	&print_var(DB, 'IDXSIZE', *IDXSIZE);
	&print_var(DB, 'LocalDateFmt', *LocalDateFmt);
	&print_var(DB, 'MAILTOURL', *MAILTOURL);
	&print_var(DB, 'MAIN', *MAIN);
	&print_var(DB, 'MAXSIZE', *MAXSIZE);
	&print_var(DB, 'MHPATTERN', *MHPATTERN);
	&print_var(DB, 'MODTIME', *MODTIME);
	&print_var(DB, 'MSGFOOT', *MSGFOOT);
	&print_var(DB, 'MsgGMTDateFmt', *MsgGMTDateFmt);
	&print_var(DB, 'MSGHEAD', *MSGHEAD);
	&print_var(DB, 'MsgLocalDateFmt', *MsgLocalDateFmt);
	&print_var(DB, 'MULTIIDX', *MULTIIDX);
	&print_var(DB, 'NOMAILTO', *NOMAILTO);
	&print_var(DB, 'NONEWS', *NONEWS);
	&print_var(DB, 'NOSORT', *NOSORT);
	&print_var(DB, 'NOURL', *NOURL);
	&print_var(DB, 'NumOfMsgs', *NumOfMsgs);
	&print_var(DB, 'NumOfPages', *NumOfPages);
	&print_var(DB, 'THREAD', *THREAD);

	# Main index resources
	if ($MAIN) {
	    &print_var(DB, 'AUTHSORT', *AUTHSORT);
	    &print_var(DB, 'IDXNAME', *IDXNAME);
	    &print_var(DB, 'IDXPREFIX', *IDXPREFIX);
	    &print_var(DB, 'REVSORT', *REVSORT);
	    &print_var(DB, 'SUBSORT', *SUBSORT);
	    &print_var(DB, 'TITLE', *TITLE);

	    &print_var(DB, 'AUTHBEG', *AUTHBEG)
					unless $IsDefault{'AUTHBEG'};
	    &print_var(DB, 'AUTHEND', *AUTHEND)
					unless $IsDefault{'AUTHEND'};
	    &print_var(DB, 'DAYBEG', *DAYBEG)
					unless $IsDefault{'DAYBEG'};
	    &print_var(DB, 'DAYEND', *DAYEND)
					unless $IsDefault{'DAYEND'};
	    &print_var(DB, 'IDXLABEL', *IDXLABEL)
					unless $IsDefault{'IDXLABEL'};
	    &print_var(DB, 'IDXPGBEG', *IDXPGBEG)
					unless $IsDefault{'IDXPGBEG'};
	    &print_var(DB, 'IDXPGEND', *IDXPGEND)
					unless $IsDefault{'IDXPGEND'};
	    &print_var(DB, 'LIBEG', *LIBEG)
					unless $IsDefault{'LIBEG'};
	    &print_var(DB, 'LIEND', *LIEND)
					unless $IsDefault{'LIEND'};
	    &print_var(DB, 'LITMPL', *LITMPL)
					unless $IsDefault{'LITMPL'};
	    &print_var(DB, 'NEXTPGLINK', *NEXTPGLINK)
					unless $IsDefault{'NEXTPGLINK'};
	    &print_var(DB, 'NEXTPGLINKIA', *NEXTPGLINKIA)
					unless $IsDefault{'NEXTPGLINKIA'};
	    &print_var(DB, 'PREVPGLINK', *PREVPGLINK)
					unless $IsDefault{'PREVPGLINK'};
	    &print_var(DB, 'PREVPGLINKIA', *PREVPGLINKIA)
					unless $IsDefault{'PREVPGLINKIA'};
	    &print_var(DB, 'SUBJECTBEG', *SUBJECTBEG)
					unless $IsDefault{'SUBJECTBEG'};
	    &print_var(DB, 'SUBJECTEND', *SUBJECTEND)
					unless $IsDefault{'SUBJECTEND'};
	}

	# Thread index resources
	if ($THREAD) {
	    &print_var(DB, 'TIDXNAME', *TIDXNAME);
	    &print_var(DB, 'TIDXPREFIX', *TIDXPREFIX);
	    &print_var(DB, 'TLEVELS', *TLEVELS);
	    &print_var(DB, 'TREVERSE', *TREVERSE);
	    &print_var(DB, 'TTITLE', *TTITLE);

	    &print_var(DB, 'TCONTBEG', *TCONTBEG)
					unless $IsDefault{'TCONTBEG'};
	    &print_var(DB, 'TCONTEND', *TCONTEND)
					unless $IsDefault{'TCONTEND'};
	    &print_var(DB, 'TFOOT', *TFOOT)
					unless $IsDefault{'TFOOT'};
	    &print_var(DB, 'THEAD', *THEAD)
					unless $IsDefault{'THEAD'};
	    &print_var(DB, 'TIDXLABEL', *TIDXLABEL)
					unless $IsDefault{'TIDXLABEL'};
	    &print_var(DB, 'TIDXPGBEG', *TIDXPGBEG)
					unless $IsDefault{'TIDXPGBEG'};
	    &print_var(DB, 'TIDXPGEND', *TIDXPGEND)
					unless $IsDefault{'TIDXPGEND'};
	    &print_var(DB, 'TINDENTBEG', *TINDENTBEG)
					unless $IsDefault{'TINDENTBEG'};
	    &print_var(DB, 'TINDENTEND', *TINDENTEND)
					unless $IsDefault{'TINDENTEND'};
	    &print_var(DB, 'TLIEND', *TLIEND)
					unless $IsDefault{'TLIEND'};
	    &print_var(DB, 'TLINONE', *TLINONE)
					unless $IsDefault{'TLINONE'};
	    &print_var(DB, 'TLINONEEND', *TLINONEEND)
					unless $IsDefault{'TLINONEEND'};
	    &print_var(DB, 'TLITXT', *TLITXT)
					unless $IsDefault{'TLITXT'};
	    &print_var(DB, 'TNEXTPGLINK', *TNEXTPGLINK)
					unless $IsDefault{'TNEXTPGLINK'};
	    &print_var(DB, 'TNEXTPGLINKIA', *TNEXTPGLINKIA)
					unless $IsDefault{'TNEXTPGLINKIA'};
	    &print_var(DB, 'TPREVPGLINK', *TPREVPGLINK)
					unless $IsDefault{'TPREVPGLINK'};
	    &print_var(DB, 'TPREVPGLINKIA', *TPREVPGLINKIA)
					unless $IsDefault{'TPREVPGLINKIA'};
	    &print_var(DB, 'TSINGLETXT', *TSINGLETXT)
					unless $IsDefault{'TSINGLETXT'};
	    &print_var(DB, 'TSUBJECTBEG', *TSUBJECTBEG)
					unless $IsDefault{'TSUBJECTBEG'};
	    &print_var(DB, 'TSUBJECTEND', *TSUBJECTEND)
					unless $IsDefault{'TSUBJECTEND'};
	    &print_var(DB, 'TSUBLISTBEG', *TSUBLISTBEG)
					unless $IsDefault{'TSUBLISTBEG'};
	    &print_var(DB, 'TSUBLISTEND', *TSUBLISTEND)
					unless $IsDefault{'TSUBLISTEND'};
	    &print_var(DB, 'TTOPBEG', *TTOPBEG)
					unless $IsDefault{'TTOPBEG'};
	    &print_var(DB, 'TTOPEND', *TTOPEND)
					unless $IsDefault{'TTOPEND'};
	}

	&print_var(DB, 'BOTLINKS', *BOTLINKS)
	    				unless $IsDefault{'BOTLINKS'};
	&print_var(DB, 'FIELDSBEG', *FIELDSBEG)
	    				unless $IsDefault{'FIELDSBEG'};
	&print_var(DB, 'FIELDSEND', *FIELDSEND)
					unless $IsDefault{'FIELDSEND'};
	&print_var(DB, 'FLDBEG', *FLDBEG)
	    				unless $IsDefault{'FLDBEG'};
	&print_var(DB, 'FLDEND', *FLDEND)
	    				unless $IsDefault{'FLDEND'};
	&print_var(DB, 'HEADBODYSEP ', *HEADBODYSEP)
	    				unless $IsDefault{'HEADBODYSEP'};
	&print_var(DB, 'LABELBEG', *LABELBEG)
	    				unless $IsDefault{'LABELBEG'};
	&print_var(DB, 'LABELEND', *LABELEND)
	    				unless $IsDefault{'LABELEND'};
	&print_var(DB, 'MSGPGBEG', *MSGPGBEG)
	    				unless $IsDefault{'MSGPGBEG'};
	&print_var(DB, 'MSGPGEND', *MSGPGEND)
	    				unless $IsDefault{'MSGPGEND'};
	&print_var(DB, 'NEXTBUTTON', *NEXTBUTTON)
	    				unless $IsDefault{'NEXTBUTTON'};
	&print_var(DB, 'NEXTBUTTONIA', *NEXTBUTTONIA)
	    				unless $IsDefault{'NEXTBUTTONIA'};
	&print_var(DB, 'NEXTLINK', *NEXTLINK)
	    				unless $IsDefault{'NEXTLINK'};
	&print_var(DB, 'NEXTLINKIA', *NEXTLINKIA)
	    				unless $IsDefault{'NEXTLINKIA'};
	&print_var(DB, 'PREVBUTTON', *PREVBUTTON)
	    				unless $IsDefault{'PREVBUTTON'};
	&print_var(DB, 'PREVBUTTONIA', *PREVBUTTONIA)
	    				unless $IsDefault{'PREVBUTTONIA'};
	&print_var(DB, 'PREVLINK', *PREVLINK)
	    				unless $IsDefault{'PREVLINK'};
	&print_var(DB, 'PREVLINKIA', *PREVLINKIA)
	    				unless $IsDefault{'PREVLINKIA'};
	&print_var(DB, 'TNEXTBUTTON', *TNEXTBUTTON)
	    				unless $IsDefault{'TNEXTBUTTON'};
	&print_var(DB, 'TNEXTBUTTONIA', *TNEXTBUTTONIA)
	    				unless $IsDefault{'TNEXTBUTTONIA'};
	&print_var(DB, 'TNEXTLINK', *TNEXTLINK)
	    				unless $IsDefault{'TNEXTLINK'};
	&print_var(DB, 'TNEXTLINKIA', *TNEXTLINKIA)
	    				unless $IsDefault{'TNEXTLINKIA'};
	&print_var(DB, 'TOPLINKS', *TOPLINKS)
	    				unless $IsDefault{'TOPLINKS'};
	&print_var(DB, 'TPREVBUTTON', *TPREVBUTTON)
	    				unless $IsDefault{'TPREVBUTTON'};
	&print_var(DB, 'TPREVBUTTONIA', *TPREVBUTTONIA)
	    				unless $IsDefault{'TPREVBUTTONIA'};
	&print_var(DB, 'TPREVLINK', *TPREVLINK)
	    				unless $IsDefault{'TPREVLINK'};
	&print_var(DB, 'TPREVLINKIA', *TPREVLINKIA)
	    				unless $IsDefault{'TPREVLINKIA'};
	&print_var(DB, 'UMASK', *UMASK);

	print DB "1;\n";	# for require
    } else {
	warn "Warning: Unable to create database, $pathname\n";
    }
}
##---------------------------------------------------------------------------
sub print_assoc {
    local($handle, $name, *assoc) = @_;

    print $handle "%$name=(\n";
    foreach (keys %assoc) {
	print $handle qq{'}, &escape_str($_), qq{','},
		      &escape_str($assoc{$_}), qq{',\n};
    }
    print $handle ");\n";
}
##---------------------------------------------------------------------------
sub print_array {
    local($handle, $name, *array) = @_;

    print $handle "\@$name=(\n";
    foreach (@array) {
	print $handle qq{'}, &escape_str($_), qq{',\n};
    }
    print $handle ");\n";
}
##---------------------------------------------------------------------------
sub print_var {
    local($handle, $name, *var, $d) = @_;

    print $handle qq{\$$name='}, &escape_str($var), qq{'};
    print $handle qq{ unless defined(\$$name)}  if $d;
    print $handle qq{;\n};
}
##---------------------------------------------------------------------------
sub escape_str {
    local($str) = $_[0];

    $str =~ s/\\/\\\\/g;
    $str =~ s/'/\\'/g;
    $str;
}

##---------------------------------------------------------------------------##
1;