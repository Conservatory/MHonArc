<!-- ================================================================== -->
<!--	$Id: frames.mrc,v 1.10 2003/10/06 22:04:23 ehood Exp $
	Earl Hood <earl @ earlhood . com>
  -->
<!--	MHonArc Resource File						--
  --									--
  --	Description:							--
  --									--
  --	    This is an example of using HTML frames for an archive.	--
  --	    This resource file also illustrates how powerful the	--
  --	    customization features of MHonArc are while giving		--
  --	    explanations on the use of each resource.			--
  --									--
  --	    The document that defines the main frames is created	--
  --	    outside of mhonarc.  The following is a sample document	--
  --	    that can be used:						--
  --									--
  --	    <html>							--
  --	    <head>							--
  --	    <title>Mail Archive (by MHonArc)</title>			--
  --	    </head>							--
  --	    <frameset cols="275,*">					--
  --	    <frame src="threads.html" name="INDEX">			--
  --	    <frame src="start.html" name="MAIN">			--
  --	    </frameset>							--
  --	    </html>							--
  --									--
  --	    The frame names are important since they are used in	--
  --	    this file.  The default message in the MAIN frame is	--
  --	    start.html: a document containing information about the	--
  --	    the archive.  A bogus null document can be used to		--
  --	    have the MAIN frame come up blank.				--
  --									--
  --		NOTE: Netscape will not properly handle frame		--
  --		      linking if the SRC attribute is not defined	--
  --		      to a document.  Therefore, some document		--
  --		      should be referenced.				--
  --									--
  --	    The title of the archive is controlled by the MAIN-TITLE	--
  --	    resource variable.  This variable should be defined on	--
  --	    the command-line.  Example:					--
  --									--
  --	        -definevars "MAIN-TITLE='Sample Frame Archive'" ...	--
  --									--
<!-- ================================================================== -->

<!-- ================================================================== -->
<!-- 	Variable definitions						-->
<!-- ================================================================== -->
<!--
	User defined variables are defined by the DEFINEVAR element.
	The first line is the name of the variable and subsequent
	lines to the close tag are the value of the variable.

	User defined variables are extremely useful when the same
	layout information occurs in multiple places.  It also
	help centralize information that maybe likely to change.
	
	User defined variables can reference other variables.
  -->
<!-- ================================================================== -->

<!-- 	Variables for frame names
  -->
<DefineVar>
FRAME-MAIN
target="MAIN"
</DefineVar>

<DefineVar>
FRAME-IDX
target="INDEX"
</DefineVar>

<!--	Variable for navigational links.  This defines a table of
	buttons to link to previous and next messages and to thread
	and date indexes.
  -->
<DefineVar>
NAV-LINKS
<table cellpadding=0 cellspacing=0 border=1 width="100%">
<tbody>
<tr align="center">
<th colspan=3><strong>Thread Links</strong></th>
<th colspan=3><strong>Date Links</strong></th>
</tr>
<tr align="center">
<td>$BUTTON(TPREV)$</td>
<td>$BUTTON(TNEXT)$</td>
<td><a $FRAME-IDX$ href="$TIDXFNAME$#$MSGNUM$">Index</a></td>
<td>$BUTTON(PREV)$</td>
<td>$BUTTON(NEXT)$</td>
<td><a $FRAME-IDX$ href="$IDXFNAME$#$MSGNUM$">Index</a></td>
</tr>
</tbody>
</table>
</DefineVar>

<!--	Variable for table attributes for page links on index pages.
  -->
<DefineVar>
IDXPG-TBL-LINKS-ATTRS
width="100%" border=0 cellpadding=0 cellspacing=0
</DefineVar>

<!-- ================================================================== -->
<!-- 	Options			 					-->
<!-- ================================================================== -->

<!--	It is good to be explicit when possible since a default
	resource file, and/or environment variables, may be in affect.
  -->
<Main>
<Thread>
<Sort>
<NoReverse>
<NoTReverse>

<!--	Have mhonarc generate multipage indexes with a maximum of 50
	messages listed per page.  MULITPG requires IDXSIZE to be
	set to a finite value to be in effect.
  -->
<MultiPg>
<IdxSize>
50
</IdxSize>

<!--	Shut-off mhonarc's adding follow-up/ref links after message.
	This resource file defines other mechanisms for a reader
	to navigate the archive.
  -->
<NoFolRefs>

<!-- ================================================================== -->
<!-- 	Derived Files		 					-->
<!-- ================================================================== -->
<!--
	Derived files are defined by the DEFINEDERIVED element.
	Derived files are extra files that should be created with
	each message added to an archive.  The first line is the name
	of the file to create.  The filename may (should) contain
	variables to uniquely name it for each message.

	User defined derived files are automatically removed if
	the message they are associated with is removed.
  -->
<!-- ================================================================== -->

<!-- 	The following derived file is the main file the index pages
	will link to.  It defines the subframe definitions for the
	navigational links and the message data.
  -->
<DefineDerived>
frm$MSGNUM$.html
<html>
<head>
<title>Message View</title>
</head>
<frameset rows="60,*">
<frame src="nav$MSGNUM$.html" name="NAV"
       frameborder=1 scrolling=no marginheight=0 marginwidth=0>
<frame src="msg$MSGNUM$.html" name="MESSAGE"
       frameborder=0>
</frameset>
</html>
</DefineDerived>

<!-- 	The following derived file defines the navigational links
	for a message.  The links will be displayed in a frame
	above the converted message.
  -->
<DefineDerived>
nav$MSGNUM$.html
<html>
<head>
<title>Message Navigation</title>
</head>
<body>
$NAV-LINKS$
</body>
</html>
</DefineDerived>

<!-- ================================================================== -->
<!-- 	Thread index resources						-->
<!-- ================================================================== -->

<!--	The thread index is setup where a thread will have the subject
	in bold at the top of the thread and the names of the authors
	of the messages in the thread will be hyperlinked to the
	actual message.  Nested unordered lists are used to provide a
	visual cue of the depths of the thread.

	Unique messages are show in normal text.
  -->

<!--	Set the title of the thread index.
  -->
<TTitle chop>
$MAIN-TITLE$ (thread)
</TTitle>

<!--	Define the appearances of the prev/next page links.
  -->
<TNextPgLink chop>
<A HREF="$PG(TNEXT)$">&gt;&gt;</A>
</TNextPgLink>
<TNextPgLinkIA chop>
&gt;&gt;
</TNextPgLinkIA>

<TPrevPgLink chop>
<A HREF="$PG(TPREV)$">&lt;&lt;</A>
</TPrevPgLink>
<TPrevPgLinkIA chop>
&lt;&lt;
</TPrevPgLinkIA>

<!--	Before the thread list, we will have links to the date index,
	previous page, first page, last page, and next page.  THEAD
	is also responsible for beginning the message listing
	(analagous to LISTBEGIN for the main index).
  -->
<THead>
<ul>
<li><a href="$IDXFNAME$">Date Index</a></li>
</ul>
<hr>
<table $IDXPG-TBL-LINKS-ATTRS$>
<tbody>
<tr align="center">
<th colspan=4><small>Page $PAGENUM$ of $NUMOFPAGES$</small></th>
<tr>
<td align="left"><a href="$PG(TFIRST)$">&lt;&lt;&lt;&lt;</a>
<td align="right">$PGLINK(TPREV)$
<td align="left">$PGLINK(TNEXT)$
<td align="right"><a href="$PG(TLAST)$">&gt;&gt;&gt;&gt;</a>
</tbody>
</table>
<hr noshade size=1>
<small>
<ul>
</THead>

<!--	TFOOT terminates the message listing.  We also include
	page navigational links like in TFOOT for convenience.
  -->
<TFoot>
</ul>
</small>
<hr noshade size=1>
<table $IDXPG-TBL-LINKS-ATTRS$>
<tbody>
<tr>
<td align="left"><a href="$PG(TFIRST)$">&lt;&lt;&lt;&lt;</a>
<td align="right">$PGLINK(TPREV)$
<td align="left">$PGLINK(TNEXT)$
<td align="right"><a href="$PG(TLAST)$">&gt;&gt;&gt;&gt;</a>
<tr align="center">
<th colspan=4><small>Page $PAGENUM$ of $NUMOFPAGES$</small></th>
</tbody>
</table>
</TFoot>

<!--	TTOPBEGIN is the markup for the beginning of a thread, and the
	first message in a thread.
  -->
<TTopBegin>
<!-- Top of a thread -->
<li><a $A_NAME$><strong>$SUBJECTNA$</strong></a><br>
<a $FRAME-MAIN$ href="frm$MSGNUM$.html">$FROMNAME$</a>
</TTopBegin>

<!--	TTOPEND is the markup for closing a main thread.
  -->
<TTopEnd>
</li>
<!-- End of a thread -->
</TTopEnd>

<!--	TLITXT is the markup for a message *within* a thread
  -->
<TLiTxt>
<li><a $A_NAME$ $FRAME-MAIN$ href="frm$MSGNUM$.html">$FROMNAME$</a>
</TLiTxt>

<TLiEnd>
</li>
</TLiEnd>

<!--	TSINGLETXT is the markup for a message not in a thread.  I.e.
	it does not start a thread or is part of a thread.
  -->
<TSingleTxt>
<li><a $A_NAME$>$SUBJECTNA$</a>,
<a $FRAME-MAIN$ href="frm$MSGNUM$.html">$FROMNAME$</a>
</li>
</TSingleTxt>

<!--	TSUBJECTBEG is any markup at the beginning of a sub-thread that
	is based on the subject of the message.
  -->
<TSubjectBeg>
<LI><font size="-1">Possible follow-ups</font></LI>
</TSubjectBeg>

<!--	TCONTBEGIN is used to show the continuation of a thread
	that has been split by a page boundary.  This resource
	is only meant to provide some informative cue for the
	reader.  Notice, no links are defined in the resource.
  -->
<TContBegin>
<LI><STRONG>$SUBJECTNA$</STRONG>, <EM>(continued)</EM>
</TContBegin>

<!--	TCONTEND closes off any markup opened by TCONTBEGIN
	(if required).
  -->
<TContEnd>
</LI>
</TContEnd>

<!--	TINDENTBEGIN is used to open a level indent in a
	thread listing.  It is used to restart a thread that
	has been split by a page boundary.
  -->
<TIndentBegin>
<UL>
</TIndentBegin>

<!--	TINDENTEND is used to close a level opened by TINDENTBEGIN.
  -->
<TIndentEnd>
</UL>
</TIndentEnd>

<!-- ================================================================== -->
<!-- 	Main index resources						-->
<!-- ================================================================== -->

<!--	The main index is the chronological index since we have
	specified the <SORT> element (which is the default).
  -->
<Title chop>
$MAIN-TITLE$ (date)
</Title>

<!--	NEXTPGLINK and NEXTPGLINKIA control how the link to the
	next index page is formatted.  NEXTPGLINKIA is used for
	the last page of the index.
  -->
<NextPgLink chop>
<A HREF="$PG(NEXT)$">&gt;&gt;</A>
</NextPgLink>
<NextPgLinkIA chop>
&gt;&gt;
</NextPgLinkIA>

<!--	PREVPGLINK and PREVPGLINKIA control how the link to the
	previous index page is formatted.  PREVPGLINKIA is used for
	the first page of the index.
  -->
<PrevPgLink chop>
<A HREF="$PG(PREV)$">&lt;&lt;</A>
</PrevPgLink>
<PrevPgLinkIA chop>
&lt;&lt;
</PrevPgLinkIA>

<!--	LISTBEGIN defines the markup for the start of the message
	listing.  Traditionally, the resource also defines links
	to any other indexes for the archive.  Here, we define
	the resource to link to the thread index, navigational
	links to next/prev/first/last pages, and the start of
	the unordered list for the message list.
  -->
<ListBegin>
<ul>
<li><a href="$TIDXFNAME$">Thread Index</a></li>
</ul>
<hr>
<table $IDXPG-TBL-LINKS-ATTRS$>
<tbody>
<tr align="center">
<th colspan=4><small>Page $PAGENUM$ of $NUMOFPAGES$</small></th>
<tr>
<td align="left"><a href="$PG(FIRST)$">&lt;&lt;&lt;&lt;</a>
<td align="right">$PGLINK(PREV)$
<td align="left">$PGLINK(NEXT)$
<td align="right"><a href="$PG(LAST)$">&gt;&gt;&gt;&gt;</a>
</tbody>
</table>
<hr noshade size=1>
<small>
<ul>
</ListBegin>

<!--	LISTEND defines the markup for the end of the message
	listing.
  -->
<ListEnd>
</ul>
</small>
<hr noshade size=1>
<table $IDXPG-TBL-LINKS-ATTRS$>
<tbody>
<tr>
<td align="left"><a href="$PG(FIRST)$">&lt;&lt;&lt;&lt;</a>
<td align="right">$PGLINK(PREV)$
<td align="left">$PGLINK(NEXT)$
<td align="right"><a href="$PG(LAST)$">&gt;&gt;&gt;&gt;</a>
<tr align="center">
<th colspan=4><small>Page $PAGENUM$ of $NUMOFPAGES$</small></th>
</tbody>
</table>
</ListEnd>

<!--	LITEMPLATE defines the markup for a message list entry
	for the main index.  Since the main index has a simple
	flat, linear listing, LITEMPLATE defines how all entries
	will look.

	Note how I include $A_NAME$ so links from a message to
	the index will have the index scrolled to where the
	message is listed.
  -->
<LiTemplate>
<li><a $FRAME-MAIN$ $A_NAME$
href="frm$MSGNUM$.html"><strong>$SUBJECTNA$</strong></a>
<ul><li>$FROMNAME$</li></ul>
</li>
</LiTemplate>

<!-- ================================================================== -->
<!-- 	Message Page Resources						-->
<!-- ================================================================== -->

<!--	Have the main subject header centered.
  -->
<SubjectHeader>
<h2 align="center">$SUBJECTNA$</h2>
<hr>
</SubjectHeader>

<!--	Mail header formatting.  The default header formatting is
	overridden to use a table for formatting.
  -->

<!-- Exclude some fields from messages heads -->
<Excs>
subject
xref
</Excs>

<!-- Fields labels will be in HTML strong elements -->
<LabelStyles override>
-default-:strong
</LabelStyles>

<!-- Field values will be in normal text -->
<FieldStyles override>
-default-:
</FieldStyles>

<!-- Open table markup for message header -->
<FieldsBeg>
<table width="100%">
<tbody>
</FieldsBeg>

<!-- Each label starts a new row in the table -->
<LabelBeg>
<tr>
<td align="right" valign="top">
</LabelBeg>

<!-- Close table cell for field label -->
<LabelEnd>
</td>
</LabelEnd>

<!-- Field value starts a new table cell -->
<FldBeg>
<td align="left">
</FldBeg>

<!-- Close value table cell and row -->
<FldEnd>
</td>
</tr>
</FldEnd>

<!-- Close table body and table -->
<FieldsEnd>
</tbody>
</table>
</FieldsEnd>

<!--	Define markup between mail message header and body.
  -->
<HeadBodySep>
<hr noshade size=1>
</HeadBodySep>

<!--	Define message-id link markup.  We redefine it so the message-id
	links will link to the appropriate message frame document.  Note,
	this applies to message data.  Therefore, once a message-id
	is converted to a link, the format of the link cannot be changed.
	Any changes to MSGIDLINK will only affect newly create links.
  -->
<MsgIdLink>
<A $FRAME-MAIN$ HREF="frm$MSGNUM$.html">$MSGID$</A>
</MsgIdLink>

<!--	Define MSGFOOT to contain a partial thread listing.  Set
	TSLICE to have current message as the start of the listing.
	Redefine TSLICEBEG and TSLICEEND to suit our needs.  The
	thread formating resources used for the thread index are
	also apply to a thread slice listing.
  -->
<MsgFoot>
Partial thread listing:
$TSLICE$
</MsgFoot>

<TSlice>
0:4
</TSlice>
<TSliceBeg>
<ul>
</TSliceBeg>
<TSliceEnd>
</ul>
</TSliceEnd>

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -->
<!-- 	Message navigation resources					-->

<!--	We define TOPLINKS and BOTLINKS as blank since derived files
	with frames will provide navigational links.
	Note: A newline is needed else mhonarc will use the default
	      values if the elements are null.
  -->
<TopLinks>

</TopLinks>

<BotLinks>

</BotLinks>

<!--	We define next/previous links to point to frame documents
	created through the definederived feature.  Since (T)NEXTBUTTON,
	(T)NEXTBUTTONIA, (T)PREVBUTTON, and (T)PREVBUTTONIA actually set
	their corresponding resource variables, these values are
	actually utilized in the derived navigational files.
  -->
<TNextButton chop>
<a $FRAME-MAIN$ href="frm$MSGNUM(TNEXT)$.html">Next</a>
</TNextButton>

<TNextButtonIA chop>
Next
</TNextButtonIA>

<TPrevButton chop>
<a $FRAME-MAIN$ href="frm$MSGNUM(TPREV)$.html">Prev</a>
</TPrevButton>

<TPrevButtonIA chop>
Prev
</TPrevButtonIA>

<NextButton chop>
<a $FRAME-MAIN$ href="frm$MSGNUM(NEXT)$.html">Next</a>
</NextButton>

<NextButtonIA chop>
Next
</NextButtonIA>

<PrevButton chop>
<a $FRAME-MAIN$ href="frm$MSGNUM(PREV)$.html">Prev</a>
</PrevButton>

<PrevButtonIA chop>
Prev
</PrevButtonIA>

<!-- ================================================================== -->
<!--	MIME Resources							-->
<!-- ================================================================== -->

<!--	Define some options to text/plain filter.
  -->
<MimeArgs>
text/plain:quote maxwidth=78
</MimeArgs>

<!--	Have iso-8859-1 data stored in binary form since Web browsers
	use iso-8859-1 natively.  I.e.  Do not keep iso-8859-1 encoded
	or escaped with SGML entities.
  -->
<DecodeHeads>
<CharsetConverters>
iso-8859-1:-decode-
</CharsetConverters>
