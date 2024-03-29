!BOF
!  
! [None]
!   1 : BASE class.
!   1 :   Getter/Setter methods.
!   1 :   Table I/O methods.
!   1 :   Class transfer methods.
!   1 :   Buffer transfer methods.
!   1 :   Noyantis PG Base class helpers.
!   1 : LIST class.
!   1 :   Noyantis RC List class helpers.
!   1 : Capesoft XML helpers.
!   1 : Capesoft JSON helpers.
!
! Source:       .\classes\temp\testClassesListClass.inc
! Table:        Classes
! Unique:       ClassNumber
! Class:        testClassesListClass
! Purpose:      Create a CLASS from a TABLE definition.
! Creator:      The DCT to CLASS generator (Clarion).
! Date-Time:    2021.10.30 - 01.13.22
!
!Region Notices
! ================================================================================
! ================================================================================
!EndRegion Notices

gtCLAlist                                         GROUP,TYPE                                                           ! Classes offered.
ClassNumber                                         LONG,NAME('ClassNumber | LONG | @P##-#####P | PROMPT(''Class Number:'')')
CourseNumber                                        LONG,NAME('CourseNumber | LONG | @N4 | PROMPT(''Course Number:'')')
TeacherNumber                                       LONG,NAME('TeacherNumber | LONG | @P###-##-####P | PROMPT(''Teacher Number:'')')
RoomNumber                                          LONG,NAME('RoomNumber | LONG | @N4 | PROMPT(''Room Number:'')')
ScheduledTime                                       STRING(20),NAME('ScheduledTime | STRING(20) | @S20 | PROMPT(''Scheduled Time:'')')
                                                  END                                                                  ! gtCLAlist
qtCLAlist                                         QUEUE(gtCLAlist),TYPE
                                                  END                                                                  ! qtCLAlist

gtCLAedit                                         GROUP,TYPE
ClassNumber                                         LONG,NAME('ClassNumber | LONG | @P##-#####P | PROMPT(''Class Number:'')')
ClassNumber_style                                   LONG                                                               ! 36L(2)|MY~Class #~@P##-#####P@#1#
CourseNumber                                        LONG,NAME('CourseNumber | LONG | @N4 | PROMPT(''Course Number:'')')
CourseNumber_style                                  LONG                                                               ! 40L(2)|MY~Course #~@n4@#3#
TeacherNumber                                       LONG,NAME('TeacherNumber | LONG | @P###-##-####P | PROMPT(''Teacher Number:'')')
TeacherNumber_style                                 LONG                                                               ! 44L(2)|MY~Teacher #~@p###-##-####p@#5#
RoomNumber                                          LONG,NAME('RoomNumber | LONG | @N4 | PROMPT(''Room Number:'')')
RoomNumber_style                                    LONG                                                               ! 32L(2)|MY~Room #~@n4@#7#
ScheduledTime                                       STRING(20),NAME('ScheduledTime | STRING(20) | @S20 | PROMPT(''Scheduled Time:'')')
ScheduledTime_style                                 LONG                                                               ! 80L(2)|MY~Scheduled Time~@s20@#9#
                                                  END                                                                  ! gtCLAedit
qtCLAedit                                         QUEUE(gtCLAedit),TYPE
                                                  END                                                                  ! qtCLAedit

!---------------------------------------------------------------------------------
! Class specification
!---------------------------------------------------------------------------------
testClassesListClass                              CLASS(),TYPE,MODULE('testClassesListClass.clw'),LINK('testClassesListClass.clw')
lThread                                           LONG(0)
bDebug                                            BOOL(FALSE)
oOwnerString                                      &StringTheory

ListQ                                             &qtCLAlist
EditQ                                             &qtCLAedit
EditFEQ                                           LONG(0)
EditStyle                                         LONG(0)
EditRowNow                                        LONG(0)                                                              ! Scroll current line

oBase                                             &testClassesBaseClass

oXML                                              &xFileXML

oJSON                                             &JSONClass

oRC                                               &ReportControlClass
bAllowFocusChange                                 BYTE(TRUE)

!---------------------------------------------------------------------------------
! Public methods
!---------------------------------------------------------------------------------
InputXML                                          PROCEDURE(),STRING,PROC
OutputXML                                         PROCEDURE(),STRING,PROC

InputJSON                                         PROCEDURE(),STRING,PROC
OutputJSON                                        PROCEDURE(),STRING,PROC

SetEditRC                                         PROCEDURE(ReportControlClass pRC)
SetColumnPropertiesRC                             PROCEDURE(STRING pID, STRING pCaption, LONG pWidth, STRING pTooltip)
SetAmountPropertiesRC                             PROCEDURE(STRING pID, STRING pCaption, LONG pWidth, STRING pTooltip)
SetCommonPropertiesRC                             PROCEDURE(STRING pID, STRING pCaption, LONG pWidth, STRING pTooltip)
SetDataLoadRC                                     PROCEDURE()
ClearsRowsRC                                      PROCEDURE()
RowAddRC                                          PROCEDURE(STRING pRowID)
RowUpdateRC                                       PROCEDURE(STRING pRowID)
RowUpdatingRC                                     PROCEDURE(STRING pRowID, STRING pColumnID, STRING pOldValue)
RowUpdatedRC                                      PROCEDURE(STRING pRowID, STRING pColumnID, STRING pNewValue)
CellUpdateItem                                    PROCEDURE(STRING pRowID, STRING pColumnID, STRING pNewValue)
CellUpdateItemRC                                  PROCEDURE(STRING pRowID, STRING pColumnID, STRING pNewValue)
CellUpdateRC                                      PROCEDURE(STRING pRowID)
CalcRowItem                                       PROCEDURE(STRING pRowID)
CalcRowEdit                                       PROCEDURE()
EditRowCellFormat                                 PROCEDURE(STRING pRowID, STRING pColumnID, STRING pNewValue, STRING pFormatOCX, STRING pFormatCaption, BYTE pOption=0)

CLA_ClearAllKeys                                  PROCEDURE()
CLA_Set_KeyClassNumber                            PROCEDURE()                                                          ! 
CLA_Set_KeyCourseNumber                           PROCEDURE()                                                          ! 
CLA_Set_KeyTeacherNumber                          PROCEDURE()                                                          ! 
CLA_ShowColumns                                   PROCEDURE()

Thread                                            PROCEDURE(),STRING
Construct                                         PROCEDURE()
Destruct                                          PROCEDURE()
Init                                              PROCEDURE(STRING pOwnerString)
DoDebug                                           PROCEDURE(BYTE pDebugOnOff)
Debug                                             PROCEDURE(STRING pMSG,BOOL pShow=FALSE)
DumpEditItem                                      PROCEDURE()
DumpEditList                                      PROCEDURE()

SetBaseClass                                      PROCEDURE(testClassesBaseClass pBaseClass)
SetEditFEQ                                        PROCEDURE(LONG pEditFEQ)
SetEditStyle                                      PROCEDURE(LONG pEditStyle)
ScrollEvent                                       PROCEDURE(LONG pScrollEvent, LONG pScrollValue)
ScrollToRel                                       PROCEDURE(LONG pRowDelta)
ScrollToFix                                       PROCEDURE(LONG pRowNew)

Clears                                            PROCEDURE()
Loads                                             PROCEDURE(),LONG,PROC
Saves                                             PROCEDURE(),LONG,PROC
BaseToEdit                                        PROCEDURE()
EditToBase                                        PROCEDURE()
EditToList                                        PROCEDURE()
ListToEdit                                        PROCEDURE()

LoadEditItem                                      PROCEDURE(*gtCLAedit pEdit)
LoadEditItemStyle                                 PROCEDURE(*gtCLAedit pEdit, LONG pEditStyle)

SetEditFormat                                     PROCEDURE(LONG pEditFEQ)

!---------------------------------------------------------------------------------
! Private and protected methods
!---------------------------------------------------------------------------------
                                                  END                                                                  ! testClassesListClass

!  
! [None]
!   1 : BASE class.
!   1 :   Getter/Setter methods.
!   1 :   Table I/O methods.
!   1 :   Class transfer methods.
!   1 :   Buffer transfer methods.
!   1 :   Noyantis PG Base class helpers.
!   1 : LIST class.
!   1 :   Noyantis RC List class helpers.
!   1 : Capesoft XML helpers.
!   1 : Capesoft JSON helpers.
!
!    Ending Date-Time: 2021/10/30 - 01:13:07AM
! Beginning Date-Time: 2021/10/30 - 01:13:07AM
!     Processing Time: 0 hundreths of a second (1 seconds)
!
!EOF
