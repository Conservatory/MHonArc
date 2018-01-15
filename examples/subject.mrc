<!-- ================================================================== -->
<!--    $Id: subject.mrc,v 1.4 2003/10/06 22:04:23 ehood Exp $
        Earl Hood <earl @ earlhood . com>

	This resource file utilizes the subject grouping feature of
	MHonArc to format the main index.
  -->
<!-- ================================================================== -->

<!--	Specify subject sorting.
  -->
<SubSort>

<!--	SUBJECTBEGIN defines the markup to be printed when a new subject
	group is started.
  -->
<SubjectBegin>
<li><strong>$SUBJECTNA$</strong>
<ul>
</SubjectBegin>

<!--	SUBJECTEND defines the markup to be printed when a subject
	group ends.  We define it to close the <UL> opened by
	SUBJECTBEGIN.
  -->
<SubjectEnd>
</li></ul>
</SubjectEnd>

<!--	Define LITEMPLATE to display just author names.
  -->
<LiTemplate>
<li><a $A_ATTR$>$FROMNAME$</a></li>
</LiTemplate>
