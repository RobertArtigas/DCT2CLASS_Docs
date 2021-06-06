!BOF
!  
! [None]
!   1 : BASE class.
!   0 :   Getter/Setter methods.
!   0 :   Table I/O methods.
!   0 :   Class transfer methods.
!   1 :   Buffer transfer methods.
!   1 :   Noyantis PG Base class helpers.
!   1 : LIST class.
!   1 :   Noyantis RC List class helpers.
!   0 : Capesoft XML helpers.
!   0 : Capesoft JSON helpers.
!
! Source:       .\classes\temp\testClassesBaseClass.inc
! Table:        Classes
! Class:        testClassesBaseClass
! Purpose:      Create a CLASS from a TABLE definition.
! Creator:      The DCT to CLASS generator (Clarion).
! Date-Time:    2021/04/18 - 07:39:41AM
!
!Region Notices
! ================================================================================
! ================================================================================
!EndRegion Notices

!BANANA: %CreateGroupTypeGroupBase
gtCLAbase                                         GROUP,TYPE                                                           ! TESTING ADD DESCRIPTION
ClassNumber                                         LONG,NAME('ClassNumber | LONG | @P##-#####P | PROMPT(''Class Number:'')')
CourseNumber                                        LONG,NAME('CourseNumber | LONG | @N4 | PROMPT(''Course Number:'')')
TeacherNumber                                       LONG,NAME('TeacherNumber | LONG | @P###-##-####P | PROMPT(''Teacher Number:'')')
RoomNumber                                          LONG,NAME('RoomNumber | LONG | @N4 | PROMPT(''Room Number:'')')
ScheduledTime                                       STRING(20),NAME('ScheduledTime | STRING(20) | @S20 | PROMPT(''Scheduled Time:'')')
                                                  END                                                                  ! gtCLAbase

!---------------------------------------------------------------------------------
! Class specification
!---------------------------------------------------------------------------------
testClassesBaseClass                              CLASS(),TYPE,MODULE('testClassesBaseClass.clw'),LINK('testClassesBaseClass.clw'),THREAD
lThread                                           LONG(0)
bDebug                                            BOOL(FALSE)
oOwnerString                                      &StringTheory

!BANANA: %CreateGroupRecord
gCLArec                                           GROUP(gtCLAbase)                                                     ! TESTING ADD DESCRIPTION
                                                  END                                                                  ! gCLArec
!BANANA: %CreateGroupRecordHistory
gCLAhist                                          GROUP(gtCLAbase)                                                     ! TESTING ADD DESCRIPTION
                                                  END                                                                  ! gCLAhist
!BANANA: %CreateGroupRecordSave
gCLAsave                                          GROUP(gtCLAbase)                                                     ! TESTING ADD DESCRIPTION
                                                  END                                                                  ! gCLAsave

!BANANA: %BaseBufferProperties
gCLAbuff                                          GROUP(gtCLAbase)                                                     ! TESTING ADD DESCRIPTION
                                                  END                                                                  ! gCLAbuff

oPG                                               &PropertyGridClass

!---------------------------------------------------------------------------------
! Public methods
!---------------------------------------------------------------------------------

SetBasePG                                         PROCEDURE(PropertyGridClass pPG)
ItemPropertyBasePG                                PROCEDURE(STRING pID, LONG pProperty),STRING
ItemAcceptedBasePG                                PROCEDURE(STRING pID, STRING pValue, STRING pClarionValue)
ItemGetValueBasePG                                PROCEDURE(STRING pID),STRING
ItemSetValueBasePG                                PROCEDURE(STRING pID, STRING pValue)
DumpBasePG                                        PROCEDURE()
InPlaceButtonAcceptedBasePG                       PROCEDURE(STRING pID)
MoveDataToControlBasePG                           PROCEDURE()

Thread                                            PROCEDURE(),STRING
Construct                                         PROCEDURE()
Destruct                                          PROCEDURE()
Init                                              PROCEDURE(STRING pOwnerString)
DoDebug                                           PROCEDURE(BYTE pDebugOnOff)
Debug                                             PROCEDURE(STRING pMSG,BOOL pShow=FALSE)
Clean                                             PROCEDURE()
Dump                                              PROCEDURE()
IsFieldChanged                                    PROCEDURE(LONG pFieldNumber),LONG
IsRecordChanged                                   PROCEDURE(),LONG
CreatesPrime                                      PROCEDURE()

!BANANA: SET THE PROPOTYPES
BufferToProperties                                PROCEDURE(*gtCLAbase xBuffG)
BufferFromProperties                              PROCEDURE(*gtCLAbase xBuffG)

_SendSQL                                          PROCEDURE(STRING pSQL),LONG,PROC
_IsFieldTypeNumeric                               PROCEDURE(STRING pFieldType),BOOL

!---------------------------------------------------------------------------------
! Private and protected methods
!---------------------------------------------------------------------------------
                                                  END                                                                  ! testClassesBaseClass

!Region Equates
! ================================================================================
CPG_CLA_001_GENERIC                               EQUATE('button-select.ico')

CPG_CLA_CAT_TAB_00_GENERAL                        EQUATE('00_General')
CPG_CLA_CAT_DSC_00_GENERAL                        EQUATE('General')

CPG_CLA_FLD_00_01_CLASSNUMBER                     EQUATE('00_01_ClassNumber')
CPG_CLA_FLD_00_02_COURSENUMBER                    EQUATE('00_02_CourseNumber')
CPG_CLA_FLD_00_03_TEACHERNUMBER                   EQUATE('00_03_TeacherNumber')
CPG_CLA_FLD_00_04_ROOMNUMBER                      EQUATE('00_04_RoomNumber')
CPG_CLA_FLD_00_05_SCHEDULEDTIME                   EQUATE('00_05_ScheduledTime')

CPG_CLA_BTN_INP_02_COURSENUMBER                   EQUATE('00_02_CourseNumber_btn')
CPG_CLA_BTN_CAP_02_COURSENUMBER                   EQUATE('Courses')
CPG_CLA_BTN_TIP_02_COURSENUMBER                   EQUATE('Select Courses')
CPG_CLA_BTN_INP_03_TEACHERNUMBER                  EQUATE('00_03_TeacherNumber_btn')
CPG_CLA_BTN_CAP_03_TEACHERNUMBER                  EQUATE('Teachers')
CPG_CLA_BTN_TIP_03_TEACHERNUMBER                  EQUATE('Select Teachers')

CPG_CLA_FLD_PROMPT_CLASSNUMBER                    EQUATE('Class Number:')
CPG_CLA_FLD_COLUMN_CLASSNUMBER                    EQUATE('Class Number')
CPG_CLA_FLD_DSC_CLASSNUMBER                       EQUATE('')
CPG_CLA_FLD_MSG_CLASSNUMBER                       EQUATE('Class Number.')
CPG_CLA_FLD_TIP_CLASSNUMBER                       EQUATE('Class Number.')
CPG_CLA_FLD_DEF_CLASSNUMBER                       EQUATE('0')
CPG_CLA_FLD_PROMPT_COURSENUMBER                   EQUATE('Course Number:')
CPG_CLA_FLD_COLUMN_COURSENUMBER                   EQUATE('Course Number')
CPG_CLA_FLD_DSC_COURSENUMBER                      EQUATE('')
CPG_CLA_FLD_MSG_COURSENUMBER                      EQUATE('Course Number.')
CPG_CLA_FLD_TIP_COURSENUMBER                      EQUATE('Course Number.')
CPG_CLA_FLD_DEF_COURSENUMBER                      EQUATE('0')
CPG_CLA_FLD_PROMPT_TEACHERNUMBER                  EQUATE('Teacher Number:')
CPG_CLA_FLD_COLUMN_TEACHERNUMBER                  EQUATE('Teacher Number')
CPG_CLA_FLD_DSC_TEACHERNUMBER                     EQUATE('')
CPG_CLA_FLD_MSG_TEACHERNUMBER                     EQUATE('Teacher Number.')
CPG_CLA_FLD_TIP_TEACHERNUMBER                     EQUATE('Teacher Number.')
CPG_CLA_FLD_DEF_TEACHERNUMBER                     EQUATE('0')
CPG_CLA_FLD_PROMPT_ROOMNUMBER                     EQUATE('Room Number:')
CPG_CLA_FLD_COLUMN_ROOMNUMBER                     EQUATE('Room Number')
CPG_CLA_FLD_DSC_ROOMNUMBER                        EQUATE('')
CPG_CLA_FLD_MSG_ROOMNUMBER                        EQUATE('Room Number.')
CPG_CLA_FLD_TIP_ROOMNUMBER                        EQUATE('Room Number.')
CPG_CLA_FLD_DEF_ROOMNUMBER                        EQUATE('0')
CPG_CLA_FLD_PROMPT_SCHEDULEDTIME                  EQUATE('Scheduled Time:')
CPG_CLA_FLD_COLUMN_SCHEDULEDTIME                  EQUATE('Scheduled Time')
CPG_CLA_FLD_DSC_SCHEDULEDTIME                     EQUATE('')
CPG_CLA_FLD_MSG_SCHEDULEDTIME                     EQUATE('Scheduled Time.')
CPG_CLA_FLD_TIP_SCHEDULEDTIME                     EQUATE('Scheduled Time.')
CPG_CLA_FLD_DEF_SCHEDULEDTIME                     EQUATE('')
! ================================================================================
!EndRegion Equates

!  
! [None]
!   1 : BASE class.
!   0 :   Getter/Setter methods.
!   0 :   Table I/O methods.
!   0 :   Class transfer methods.
!   1 :   Buffer transfer methods.
!   1 :   Noyantis PG Base class helpers.
!   1 : LIST class.
!   1 :   Noyantis RC List class helpers.
!   0 : Capesoft XML helpers.
!   0 : Capesoft JSON helpers.
!
!    Ending Date-Time: 2021/04/18 - 07:39:14AM
! Beginning Date-Time: 2021/04/18 - 07:39:14AM
!     Processing Time: 0 hundreths of a second (1 seconds)
!
!EOF
