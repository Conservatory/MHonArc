##---------------------------------------------------------------------------##
##  File:
##      $Id: ISO8859_15.pm,v 1.1 2002/04/13 00:58:11 ehood Exp $
##  Author:
##      Earl Hood       earl@earlhood.com
##	Jan Kraeber	jmk@kraeber.de
##  Description:
##      Mappings for ISO-8859-15.
##---------------------------------------------------------------------------##
##    Copyright (C) 1997-2002	Earl Hood, earl@earlhood.com
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

###############################################################################
##	Mapping arrays for characters to entity references
###############################################################################

package MHonArc::CharEnt::ISO8859_15;

##---------------------------------------------------------------------------
##      ISO-8859-15: Latin-9
##---------------------------------------------------------------------------

+{
  #--------------------------------------------------------------------------
  # Hex Code	Entity Ref	# ISO external entity and description
  #--------------------------------------------------------------------------
    0xA1,	'iexcl',	# ISOnum : INVERTED EXCLAMATION MARK
    0xA2,	'cent',		# ISOnum : CENT SIGN
    0xA3,	'pound',	# ISOnum : POUND SIGN
    0xA4,	'euro',         # ISOlat9: EURO SIGN
    0xA5,	'yen',		# ISOnum : YEN SIGN
    0xA6,	'Scaron',	# ISOlat9: SCARON
    0xA7,	'sect',		# ISOnum : SECTION SIGN
    0xA8,	'scaron',	# ISOlat9: SCARON SMALL
    0xA9,	'copy',		# ISOnum : COPYRIGHT SIGN
    0xAA,	'ordf',		# ISOnum : FEMININE ORDINAL INDICATOR
    0xAB,	'laquo',	# ISOnum : LEFT-POINTING DOUBLE ANGLE
				#	   QUOTATION MARK
    0xAC,	'not',		# ISOnum : NOT SIGN
    0xAD,	'shy',		# ISOnum : SOFT HYPHEN
    0xAE,	'reg',		# ISOnum : REGISTERED SIGN
    0xAF,	'macr',		# ISOdia : OVERLINE (MACRON)
    0xB0,	'deg',		# ISOnum : DEGREE SIGN
    0xB1,	'plusmn',	# ISOnum : PLUS-MINUS SIGN
    0xB2,	'sup2',		# ISOnum : SUPERSCRIPT TWO
    0xB3,	'sup3',		# ISOnum : SUPERSCRIPT THREE
    0xB4,	'Zcaron',	# ISOlat9: ZCARON
    0xB5,	'micro',	# ISOnum : MICRO SIGN
    0xB6,	'para',		# ISOnum : PILCROW SIGN
    0xB7,	'middot',	# ISOnum : MIDDLE DOT
    0xB8,	'zcaron',	# ISOlat9: ZCARON SMALL
    0xB9,	'sup1',		# ISOnum : SUPERSCRIPT ONE
    0xBA,	'ordm',		# ISOnum : MASCULINE ORDINAL INDICATOR
    0xBB,	'raquo',	# ISOnum : RIGHT-POINTING DOUBLE ANGLE
				#	   QUOTATION MARK
    0xBC,	'OElig',	# ISOlat9: OELIG
    0xBD,	'oelig',	# ISOlat9: OELIG SMALL
    0xBE,	'Yuml',	        # ISOlat9: YUML
    0xBF,	'iquest',	# ISOnum : INVERTED QUESTION MARK
    0xC0,	'Agrave',	# ISOlat1: LATIN CAPITAL LETTER A WITH GRAVE
    0xC1,	'Aacute',	# ISOlat1: LATIN CAPITAL LETTER A WITH ACUTE
    0xC2,	'Acirc',	# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   CIRCUMFLEX
    0xC3,	'Atilde',	# ISOlat1: LATIN CAPITAL LETTER A WITH TILDE
    0xC4,	'Auml',		# ISOlat1: LATIN CAPITAL LETTER A WITH
				#	   DIAERESIS
    0xC5,	'Aring',	# ISOlat1: LATIN CAPITAL LETTER A WITH RING
				#	   ABOVE
    0xC6,	'AElig',	# ISOlat1: LATIN CAPITAL LETTER AE
    0xC7,	'Ccedil',	# ISOlat1: LATIN CAPITAL LETTER C WITH CEDILLA
    0xC8,	'Egrave',	# ISOlat1: LATIN CAPITAL LETTER E WITH GRAVE
    0xC9,	'Eacute',	# ISOlat1: LATIN CAPITAL LETTER E WITH ACUTE
    0xCA,	'Ecirc',	# ISOlat1: LATIN CAPITAL LETTER E WITH
				#	   CIRCUMFLEX
    0xCB,	'Euml',		# ISOlat1: LATIN CAPITAL LETTER E WITH
				#	   DIAERESIS
    0xCC,	'Igrave',	# ISOlat1: LATIN CAPITAL LETTER I WITH GRAVE
    0xCD,	'Iacute',	# ISOlat1: LATIN CAPITAL LETTER I WITH ACUTE
    0xCE,	'Icirc',	# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   CIRCUMFLEX
    0xCF,	'Iuml',		# ISOlat1: LATIN CAPITAL LETTER I WITH
				#	   DIAERESIS
    0xD0,	'ETH',		# ISOlat1: LATIN CAPITAL LETTER ETH (Icelandic)
    0xD1,	'Ntilde',	# ISOlat1: LATIN CAPITAL LETTER N WITH TILDE
    0xD2,	'Ograve',	# ISOlat1: LATIN CAPITAL LETTER O WITH GRAVE
    0xD3,	'Oacute',	# ISOlat1: LATIN CAPITAL LETTER O WITH ACUTE
    0xD4,	'Ocirc',	# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   CIRCUMFLEX
    0xD5,	'Otilde',	# ISOlat1: LATIN CAPITAL LETTER O WITH TILDE
    0xD6,	'Ouml',		# ISOlat1: LATIN CAPITAL LETTER O WITH
				#	   DIAERESIS
    0xD7,	'times',	# ISOnum : MULTIPLICATION SIGN
    0xD8,	'Oslash',	# ISOlat1: LATIN CAPITAL LETTER O WITH STROKE
    0xD9,	'Ugrave',	# ISOlat1: LATIN CAPITAL LETTER U WITH GRAVE
    0xDA,	'Uacute',	# ISOlat1: LATIN CAPITAL LETTER U WITH ACUTE
    0xDB,	'Ucirc',	# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   CIRCUMFLEX
    0xDC,	'Uuml',		# ISOlat1: LATIN CAPITAL LETTER U WITH
				#	   DIAERESIS
    0xDD,	'Yacute',	# ISOlat1: LATIN CAPITAL LETTER Y WITH ACUTE
    0xDE,	'THORN',	# ISOlat1: LATIN CAPITAL LETTER THORN
				#	   (Icelandic)
    0xDF,	'szlig',	# ISOlat1: LATIN SMALL LETTER SHARP S (German)
    0xE0,	'agrave',	# ISOlat1: LATIN SMALL LETTER A WITH GRAVE
    0xE1,	'aacute',	# ISOlat1: LATIN SMALL LETTER A WITH ACUTE
    0xE2,	'acirc',	# ISOlat1: LATIN SMALL LETTER A WITH CIRCUMFLEX
    0xE3,	'atilde',	# ISOlat1: LATIN SMALL LETTER A WITH TILDE
    0xE4,	'auml',		# ISOlat1: LATIN SMALL LETTER A WITH DIAERESIS
    0xE5,	'aring',	# ISOlat1: LATIN SMALL LETTER A WITH RING ABOVE
    0xE6,	'aelig',	# ISOlat1: LATIN SMALL LETTER AE
    0xE7,	'ccedil',	# ISOlat1: LATIN SMALL LETTER C WITH CEDILLA
    0xE8,	'egrave',	# ISOlat1: LATIN SMALL LETTER E WITH GRAVE
    0xE9,	'eacute',	# ISOlat1: LATIN SMALL LETTER E WITH ACUTE
    0xEA,	'ecirc',	# ISOlat1: LATIN SMALL LETTER E WITH CIRCUMFLEX
    0xEB,	'euml',		# ISOlat1: LATIN SMALL LETTER E WITH DIAERESIS
    0xEC,	'igrave',	# ISOlat1: LATIN SMALL LETTER I WITH GRAVE
    0xED,	'iacute',	# ISOlat1: LATIN SMALL LETTER I WITH ACUTE
    0xEE,	'icirc',	# ISOlat1: LATIN SMALL LETTER I WITH CIRCUMFLEX
    0xEF,	'iuml',		# ISOlat1: LATIN SMALL LETTER I WITH DIAERESIS
    0xF0,	'eth',		# ISOlat1: LATIN SMALL LETTER ETH (Icelandic)
    0xF1,	'ntilde',	# ISOlat1: LATIN SMALL LETTER N WITH TILDE
    0xF2,	'ograve',	# ISOlat1: LATIN SMALL LETTER O WITH GRAVE
    0xF3,	'oacute',	# ISOlat1: LATIN SMALL LETTER O WITH ACUTE
    0xF4,	'ocirc',	# ISOlat1: LATIN SMALL LETTER O WITH CIRCUMFLEX
    0xF5,	'otilde',	# ISOlat1: LATIN SMALL LETTER O WITH TILDE
    0xF6,	'ouml',		# ISOlat1: LATIN SMALL LETTER O WITH DIAERESIS
    0xF7,	'divide',	# ISOnum : DIVISION SIGN
    0xF8,	'oslash',	# ISOlat1: LATIN SMALL LETTER O WITH STROKE
    0xF9,	'ugrave',	# ISOlat1: LATIN SMALL LETTER U WITH GRAVE
    0xFA,	'uacute',	# ISOlat1: LATIN SMALL LETTER U WITH ACUTE
    0xFB,	'ucirc',	# ISOlat1: LATIN SMALL LETTER U WITH CIRCUMFLEX
    0xFC,	'uuml',		# ISOlat1: LATIN SMALL LETTER U WITH DIAERESIS
    0xFD,	'yacute',	# ISOlat1: LATIN SMALL LETTER Y WITH ACUTE
    0xFE,	'thorn',	# ISOlat1: LATIN SMALL LETTER THORN
				#	   (Icelandic)
    0xFF,	'yuml',		# ISOlat1: LATIN SMALL LETTER Y WITH DIAERESIS
};
