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
! Source:       .\classes\temp\testClassesBaseClass.clw
! Table:        Classes
! Class:        testClassesBaseClass
! Purpose:      Create a CLASS from a TABLE definition.
! Creator:      The DCT to CLASS generator (Clarion).
! Date-Time:    2021/04/18 - 07:39:41AM
!
  MEMBER()

!Region Notices
! ================================================================================
! ================================================================================
!EndRegion Notices

  MAP
    MODULE('Win32') 
  _ODS_(*CSTRING),PASCAL,RAW,NAME('OutputDebugStringA')
    END 
  END

  !INCLUDE('???_HARD2SOFT.EQU'),ONCE
  INCLUDE('Errors.CLW'),ONCE
  INCLUDE('Equates.CLW'),ONCE
  INCLUDE('DynFile.INC'),ONCE
  INCLUDE('StringTheory.INC'),ONCE
  INCLUDE('testClassesBaseClass.inc'),ONCE

  INCLUDE('NYSEquates.equ'),ONCE                  ! Common Equates
  INCLUDE('NYSCommon.inc'),ONCE                   ! Common Definitions
  INCLUDE('NYSCalendarPro.inc'),ONCE              ! Calendars
  INCLUDE('NYSChartPro.inc'),ONCE                 ! Charts
  INCLUDE('NYSCommandBars.inc'),ONCE              ! Command Bars
  INCLUDE('NYSDockingPane.inc'),ONCE              ! Docking Pane
  INCLUDE('NYSFlowGraph.inc'),ONCE                ! Flow Graphs
  INCLUDE('NYSPropertyGrid.inc'),ONCE             ! Property Grid
  INCLUDE('NYSReportControl.inc'),ONCE            ! Reports
  INCLUDE('NYSShortcutBar.inc'),ONCE              ! Shortcut Bars
  INCLUDE('NYSSkinFramework.inc'),ONCE            ! Skin Framework
  INCLUDE('NYSSuiteControls.inc'),ONCE            ! Suite Controls
  INCLUDE('NYSSyntaxEdit.inc'),ONCE               ! Syntax Editor
  INCLUDE('NYSTaskPanel.inc'),ONCE                ! Task Pannel

CLA_GETSME_DATE                                   EQUATE('@D2B')
CLA_SHOWME_DATE                                   EQUATE('@D02B')
CLA_FORMAT_DATE                                   EQUATE('%m/%d/%Y')
CLA_BLANKS_DATE                                   EQUATE('__/__/____')
CLA_GETSME_TIME                                   EQUATE('@T4B')
CLA_SHOWME_TIME                                   EQUATE('@T04B')
CLA_FORMAT_TIME                                   EQUATE('%h:%m:%s')
CLA_BLANKS_TIME                                   EQUATE('__:__:__')
 

!---------------------------------------------------------------------------------
testClassesBaseClass.SetBasePG                    PROCEDURE(PropertyGridClass pPG)
PropertyGrid_Ctrl                                 CSTRING(21)
PropertyGrid_Result                               BYTE
  CODE
  SELF.Debug(SELF.Thread() & ' ENTRY: testClassesBaseClass.SetBasePG(<39>...<39>)')

  SELF.oPG                                        &= pPG

! Noyantis: Generate the METHODS for the Property Grid
                                                    SELF.oPG.SetDefaultDateFormat(CLA_FORMAT_DATE, CLA_BLANKS_DATE)
                                                    SELF.oPG.SetDefaultTimeFormat(CLA_FORMAT_TIME, CLA_BLANKS_TIME)

                                                    SELF.oPG.CreateCategories()

  PropertyGrid_Ctrl                               = SELF.oPG.AddCategory(CPG_CLA_CAT_TAB_00_GENERAL,CPG_CLA_CAT_DSC_00_GENERAL)  
  PropertyGrid_Result                             = SELF.oPG.SetCategoryCollection(CPG_CLA_CAT_TAB_00_GENERAL,'',FALSE)
  PropertyGrid_Result                             = SELF.oPG.SetCategoryProperty(CPG_CLA_CAT_TAB_00_GENERAL,'Expandable',TRUE)
                                                    SELF.oPG.SetCategoryExpanded(CPG_CLA_CAT_TAB_00_GENERAL,TRUE)
  PropertyGrid_Result                             = SELF.oPG.SetCategoryVisible(CPG_CLA_CAT_TAB_00_GENERAL,TRUE)

                                                    SELF.oPG.CreateItems()
                                                    SELF.oPG.CreateInPlaceButtons()
                                                    SELF.oPG.CreateVerbs()

  ! NOTE: Field 'ClassNumber' has validation 'NONZERO'
  PropertyGrid_Ctrl                               = SELF.oPG.AddItem(CPG_CLA_CAT_TAB_00_GENERAL,CPG_CLA_FLD_PROMPT_CLASSNUMBER,CPG_CLA_FLD_00_01_CLASSNUMBER,xtpGridItemString,'Normal',CPG_CLA_FLD_DEF_CLASSNUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetItemProperty(CPG_CLA_FLD_00_01_CLASSNUMBER,'EditStyle',xtpGridEditStyleLeft)
  PropertyGrid_Result                             = SELF.oPG.SetItemVisible(CPG_CLA_FLD_00_01_CLASSNUMBER,TRUE)
  PropertyGrid_Result                             = SELF.oPG.SetItemEnabled(CPG_CLA_FLD_00_01_CLASSNUMBER,TRUE) 
  PropertyGrid_Result                             = SELF.oPG.SetCtrlDescription(CPG_CLA_FLD_00_01_CLASSNUMBER,CPG_CLA_FLD_MSG_CLASSNUMBER)  
  PropertyGrid_Result                             = SELF.oPG.SetCtrlToolTip(CPG_CLA_FLD_00_01_CLASSNUMBER,CPG_CLA_FLD_TIP_CLASSNUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetItemRequired(CPG_CLA_FLD_00_01_CLASSNUMBER,TRUE)

  ! NOTE: Field 'CourseNumber' has validation 'INFILE'
  PropertyGrid_Ctrl                               = SELF.oPG.AddItem(CPG_CLA_CAT_TAB_00_GENERAL,CPG_CLA_FLD_PROMPT_COURSENUMBER,CPG_CLA_FLD_00_02_COURSENUMBER,xtpGridItemString,'Normal',CPG_CLA_FLD_DEF_COURSENUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetItemProperty(CPG_CLA_FLD_00_02_COURSENUMBER,'EditStyle',xtpGridEditStyleLeft)
  PropertyGrid_Result                             = SELF.oPG.SetItemVisible(CPG_CLA_FLD_00_02_COURSENUMBER,TRUE)
  PropertyGrid_Result                             = SELF.oPG.SetItemEnabled(CPG_CLA_FLD_00_02_COURSENUMBER,TRUE) 
  PropertyGrid_Result                             = SELF.oPG.SetCtrlDescription(CPG_CLA_FLD_00_02_COURSENUMBER,CPG_CLA_FLD_MSG_COURSENUMBER)  
  PropertyGrid_Result                             = SELF.oPG.SetCtrlToolTip(CPG_CLA_FLD_00_02_COURSENUMBER,CPG_CLA_FLD_TIP_COURSENUMBER)
  PropertyGrid_Ctrl                               = SELF.oPG.AddItemInPlaceButton(CPG_CLA_FLD_00_02_COURSENUMBER,CPG_CLA_BTN_INP_02_COURSENUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonIcon(CPG_CLA_BTN_INP_02_COURSENUMBER,CPG_CLA_001_GENERIC,0,0)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_02_COURSENUMBER,'Enabled',TRUE)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_02_COURSENUMBER,'Caption',CPG_CLA_BTN_CAP_02_COURSENUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_02_COURSENUMBER,'Tooltip',CPG_CLA_BTN_TIP_02_COURSENUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_02_COURSENUMBER,'Alignment',xtpGridEditStyleRight)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_02_COURSENUMBER,'Hyperlink',FALSE)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_02_COURSENUMBER,'ShowAlways',TRUE)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_02_COURSENUMBER,'TabStop',TRUE)

  ! NOTE: Field 'TeacherNumber' has validation 'INFILE'
  PropertyGrid_Ctrl                               = SELF.oPG.AddItem(CPG_CLA_CAT_TAB_00_GENERAL,CPG_CLA_FLD_PROMPT_TEACHERNUMBER,CPG_CLA_FLD_00_03_TEACHERNUMBER,xtpGridItemString,'Normal',CPG_CLA_FLD_DEF_TEACHERNUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetItemProperty(CPG_CLA_FLD_00_03_TEACHERNUMBER,'EditStyle',xtpGridEditStyleLeft)
  PropertyGrid_Result                             = SELF.oPG.SetItemVisible(CPG_CLA_FLD_00_03_TEACHERNUMBER,TRUE)
  PropertyGrid_Result                             = SELF.oPG.SetItemEnabled(CPG_CLA_FLD_00_03_TEACHERNUMBER,TRUE) 
  PropertyGrid_Result                             = SELF.oPG.SetCtrlDescription(CPG_CLA_FLD_00_03_TEACHERNUMBER,CPG_CLA_FLD_MSG_TEACHERNUMBER)  
  PropertyGrid_Result                             = SELF.oPG.SetCtrlToolTip(CPG_CLA_FLD_00_03_TEACHERNUMBER,CPG_CLA_FLD_TIP_TEACHERNUMBER)
  PropertyGrid_Ctrl                               = SELF.oPG.AddItemInPlaceButton(CPG_CLA_FLD_00_03_TEACHERNUMBER,CPG_CLA_BTN_INP_03_TEACHERNUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonIcon(CPG_CLA_BTN_INP_03_TEACHERNUMBER,CPG_CLA_001_GENERIC,0,0)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_03_TEACHERNUMBER,'Enabled',TRUE)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_03_TEACHERNUMBER,'Caption',CPG_CLA_BTN_CAP_03_TEACHERNUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_03_TEACHERNUMBER,'Tooltip',CPG_CLA_BTN_TIP_03_TEACHERNUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_03_TEACHERNUMBER,'Alignment',xtpGridEditStyleRight)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_03_TEACHERNUMBER,'Hyperlink',FALSE)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_03_TEACHERNUMBER,'ShowAlways',TRUE)
  PropertyGrid_Result                             = SELF.oPG.SetInPlaceButtonProperty(CPG_CLA_BTN_INP_03_TEACHERNUMBER,'TabStop',TRUE)

  ! NOTE: Field 'RoomNumber' has validation 'NONZERO'
  PropertyGrid_Ctrl                               = SELF.oPG.AddItem(CPG_CLA_CAT_TAB_00_GENERAL,CPG_CLA_FLD_PROMPT_ROOMNUMBER,CPG_CLA_FLD_00_04_ROOMNUMBER,xtpGridItemString,'Normal',CPG_CLA_FLD_DEF_ROOMNUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetItemProperty(CPG_CLA_FLD_00_04_ROOMNUMBER,'EditStyle',xtpGridEditStyleLeft)
  PropertyGrid_Result                             = SELF.oPG.SetItemVisible(CPG_CLA_FLD_00_04_ROOMNUMBER,TRUE)
  PropertyGrid_Result                             = SELF.oPG.SetItemEnabled(CPG_CLA_FLD_00_04_ROOMNUMBER,TRUE) 
  PropertyGrid_Result                             = SELF.oPG.SetCtrlDescription(CPG_CLA_FLD_00_04_ROOMNUMBER,CPG_CLA_FLD_MSG_ROOMNUMBER)  
  PropertyGrid_Result                             = SELF.oPG.SetCtrlToolTip(CPG_CLA_FLD_00_04_ROOMNUMBER,CPG_CLA_FLD_TIP_ROOMNUMBER)
  PropertyGrid_Result                             = SELF.oPG.SetItemRequired(CPG_CLA_FLD_00_04_ROOMNUMBER,TRUE)

  ! NOTE: Field 'ScheduledTime' has validation 'NONZERO'
  PropertyGrid_Ctrl                               = SELF.oPG.AddItem(CPG_CLA_CAT_TAB_00_GENERAL,CPG_CLA_FLD_PROMPT_SCHEDULEDTIME,CPG_CLA_FLD_00_05_SCHEDULEDTIME,xtpGridItemString,'Normal',CPG_CLA_FLD_DEF_SCHEDULEDTIME)
  PropertyGrid_Result                             = SELF.oPG.SetItemProperty(CPG_CLA_FLD_00_05_SCHEDULEDTIME,'EditStyle',xtpGridEditStyleLeft)
  PropertyGrid_Result                             = SELF.oPG.SetItemVisible(CPG_CLA_FLD_00_05_SCHEDULEDTIME,TRUE)
  PropertyGrid_Result                             = SELF.oPG.SetItemEnabled(CPG_CLA_FLD_00_05_SCHEDULEDTIME,TRUE) 
  PropertyGrid_Result                             = SELF.oPG.SetCtrlDescription(CPG_CLA_FLD_00_05_SCHEDULEDTIME,CPG_CLA_FLD_MSG_SCHEDULEDTIME)  
  PropertyGrid_Result                             = SELF.oPG.SetCtrlToolTip(CPG_CLA_FLD_00_05_SCHEDULEDTIME,CPG_CLA_FLD_TIP_SCHEDULEDTIME)
  PropertyGrid_Result                             = SELF.oPG.SetItemRequired(CPG_CLA_FLD_00_05_SCHEDULEDTIME,TRUE)

                                                    SELF.oPG.SetSplitterPos('0.36')

  SELF.Debug(SELF.Thread() & ' EXITS: testClassesBaseClass.SetBasePG(<39>...<39>)')
  RETURN

!---------------------------------------------------------------------
testClassesBaseClass.ItemPropertyBasePG           PROCEDURE(STRING pID, LONG pProperty) !,STRING
ST                                                StringTheory
nItemNumber                                       LONG(0)
nFieldNumber                                      LONG(0)
sFieldName                                        STRING(255)
sFieldTemp                                        STRING(255)
sFieldWhom                                        STRING(255)
sFieldType                                        STRING(20)
sFieldFormat                                      STRING(20)
sFieldPrompt                                      STRING(255)
  CODE

  ST.Setvalue(pID)                               
  ST.Split('_',,,,TRUE,TRUE)                     
  nItemNumber                                     = ST.GetLine(1)  
  nFieldNumber                                    = ST.GetLine(2)  
  sFieldName                                      = ST.GetLine(3)  

  sFieldTemp                                      = WHO(SELF.gCLArec, nFieldNumber)  
  ST.Setvalue(sFieldTemp)                        
  ST.Split('|',,,,TRUE,TRUE)                     
  sFieldWhom                                      = ST.GetLine(1)  
  sFieldType                                      = ST.GetLine(2)  
  sFieldFormat                                    = ST.GetLine(3)  
  sFieldPrompt                                    = ST.GetLine(4)  

  ST.Setvalue(sFieldPrompt)                      
  sFieldPrompt                                    = ST.Between('(''',''')')  

  CASE(pProperty)
    OF 1; RETURN CLIP(nItemNumber)
    OF 2; RETURN CLIP(nFieldNumber)
    OF 3; RETURN CLIP(sFieldName)
    OF 4; RETURN CLIP(sFieldWhom)
    OF 5; RETURN CLIP(sFieldType)
    OF 6; RETURN CLIP(sFieldFormat)
    OF 7; RETURN CLIP(sFieldPrompt)
  END
  RETURN ''

!---------------------------------------------------------------------
! Get the data from the PG control and Set the data in the group area.
testClassesBaseClass.ItemAcceptedBasePG           PROCEDURE(STRING pID, STRING pValue, STRING pClarionValue)
nItemNumber                                       LONG(0)
nFieldNumber                                      LONG(0)
sFieldName                                        CSTRING(255)
sFieldWhom                                        CSTRING(255)
sFieldType                                        CSTRING(21)
sFieldFormat                                      CSTRING(21)
sFieldPrompt                                      CSTRING(255)
recValue                                          CSTRING(255)
DataAny                                           ANY
  CODE
  SELF.Debug(SELF.Thread() & ' ENTRY: testClassesBaseClass.ItemAcceptedBasePG("' & CLIP(pID) & '","' & CLIP(pValue) & '","' & CLIP(pClarionValue) & ')')
  !SELF.Debug('piD="' & CLIP(pID) & '", pValue="' & CLIP(pValue) & '", pClarion="' & CLIP(pClarionValue) & '"', FALSE)
  nItemNumber                                     = SELF.ItemPropertyBasePG(pID, 1)  
  nFieldNumber                                    = SELF.ItemPropertyBasePG(pID, 2)  
  sFieldName                                      = SELF.ItemPropertyBasePG(pID, 3)  
  sFieldWhom                                      = SELF.ItemPropertyBasePG(pID, 4)  
  sFieldType                                      = SELF.ItemPropertyBasePG(pID, 5)  
  sFieldFormat                                    = SELF.ItemPropertyBasePG(pID, 6)  
  sFieldPrompt                                    = SELF.ItemPropertyBasePG(pID, 7)
  !SELF.Debug('piD="' & CLIP(pID) & '", sFieldName="' & CLIP(sFieldName) & '", sFieldWhom="' & CLIP(sFieldWhom) & '"', FALSE)

  recValue                                        = pValue

  CASE(sFieldWhom)
  OF  ('')
    recValue                                      = UPPER(recValue)
  END 

  CASE(CLIP(sFieldType))
  OF  ('DATE')
    recValue                                      = DEFORMAT(pValue,CLA_GETSME_DATE)
  OF  ('TIME')
    recValue                                      = DEFORMAT(pValue,CLA_GETSME_TIME)
  ELSE
    recValue                                      = DEFORMAT(pValue,sFieldFormat)
  END


  DataAny                                         &= WHAT(SELF.gCLArec, nFieldNumber)  
  DataAny                                         = recValue  

  SELF.Dump()
  SELF.DumpBasePG()

  SELF.Debug(SELF.Thread() & ' EXITS: testClassesBaseClass.ItemAcceptedBasePG("' & CLIP(pID) & '","' & CLIP(pValue) & '","' & CLIP(pClarionValue) & ')')
  RETURN

!---------------------------------------------------------------------
! Get the value directly from the PG control. Return the value.
testClassesBaseClass.ItemGetValueBasePG           PROCEDURE(STRING pID) !,STRING
nItemNumber                                       LONG(0)
nFieldNumber                                      LONG(0)
sFieldName                                        STRING(255)
sFieldWhom                                        STRING(255)
sFieldType                                        STRING(20)
sFieldFormat                                      STRING(20)
sFieldPrompt                                      STRING(255)
recValue                                          STRING(255)
sValue                                            STRING(255)
DataAny                                           ANY
  CODE
  !SELF.Debug('ItemGetValueBasePG: piD="' & CLIP(pID) & '"', FALSE)
  nItemNumber                                     = SELF.ItemPropertyBasePG(pID, 1)  
  nFieldNumber                                    = SELF.ItemPropertyBasePG(pID, 2)  
  sFieldName                                      = SELF.ItemPropertyBasePG(pID, 3)  
  sFieldWhom                                      = SELF.ItemPropertyBasePG(pID, 4)  
  sFieldType                                      = SELF.ItemPropertyBasePG(pID, 5)  
  sFieldFormat                                    = SELF.ItemPropertyBasePG(pID, 6)  
  sFieldPrompt                                    = SELF.ItemPropertyBasePG(pID, 7)
  !SELF.Debug('ItemGetValueBasePG: piD="' & CLIP(pID) & '", sFieldName="' & CLIP(sFieldName) & '", sFieldWhom="' & CLIP(sFieldWhom) & '"', FALSE)

  DataAny                                         &= WHAT(SELF.gCLArec, nFieldNumber)  
  recValue                                        = DataAny  

  sValue                                          = recValue  

  CASE(sFieldWhom)
  OF  ('')
    sValue                                        = UPPER(sValue)
  END 

  CASE(CLIP(sFieldType))
  OF  ('DATE')
    sValue                                        = FORMAT(recValue,CLA_SHOWME_DATE)
  OF  ('TIME')
    sValue                                        = FORMAT(recValue,CLA_SHOWME_TIME)
  ELSE
    sValue                                        = LEFT(FORMAT(recValue,sFieldFormat))
  END


  !SELF.Debug('ItemGetValueBasePG: piD="' & CLIP(pID) & '", sFieldFormat="' & CLIP(sFieldFormat) & '", recValue="' & CLIP(recValue) & '"', FALSE)
  !SELF.Debug('ItemGetValueBasePG: piD="' & CLIP(pID) & '", sValue="' & CLIP(sValue) & '"', FALSE)
  RETURN sValue

!---------------------------------------------------------------------
! Set the value passed directly into the PG control.
testClassesBaseClass.ItemSetValueBasePG           PROCEDURE(STRING pID, STRING pValue)
sValue                                            STRING(255)
  CODE
  !SELF.Debug('ItemSetValueBasePG: piD="' & CLIP(pID) & '", pValue="' & CLIP(pValue) & '"', FALSE)

  sValue                                          = SELF.ItemGetValueBasePG(pID)  

  !SELF.Debug('ItemSetValueBasePG: piD="' & CLIP(pID) & '", sValue="' & CLIP(sValue) & '"', FALSE)
  SELF.oPG.SetItemValue(pID, sValue)
  RETURN

!---------------------------------------------------------------------
testClassesBaseClass.DumpBasePG                   PROCEDURE()
  CODE
  IF ~SELF.bDebug THEN RETURN END
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.DumpBasePG(00_01_ClassNumber=<39>' & CLIP(SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_01_CLASSNUMBER)) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.DumpBasePG(00_02_CourseNumber=<39>' & CLIP(SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_02_COURSENUMBER)) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.DumpBasePG(00_03_TeacherNumber=<39>' & CLIP(SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_03_TEACHERNUMBER)) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.DumpBasePG(00_04_RoomNumber=<39>' & CLIP(SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_04_ROOMNUMBER)) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.DumpBasePG(00_05_ScheduledTime=<39>' & CLIP(SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_05_SCHEDULEDTIME)) & '<39>)')
  RETURN

!---------------------------------------------------------------------
testClassesBaseClass.InPlaceButtonAcceptedBasePG  PROCEDURE(STRING pID)
sGUID                                             STRING(16)
sDescr                                            STRING(255)
sValue                                            STRING(255)
  CODE
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.InPlaceButtonAcceptedBasePG(<39>' & CLIP(pID) & '<39>)', TRUE)
  !----------------------------------------------------------------------------------!
  ! RA.2020.03.20.FRI: Selection cannot be implemented from inside the class without !
  ! some type of connection to another class or service. Leave class self-contained. !
  ! Put the lookups and selections outside the class and use the setters and getters !
  ! to update the values inside of the class. Cannot generate the world in one day.  !
  !----------------------------------------------------------------------------------!
  CASE(pID)
  OF(CPG_CLA_BTN_INP_02_COURSENUMBER)                                                                                  ! [Courses] 
  OF(CPG_CLA_BTN_INP_03_TEACHERNUMBER)                                                                                 ! [Teachers] 
  END
  RETURN

!---------------------------------------------------------------------
testClassesBaseClass.MoveDataToControlBasePG      PROCEDURE()
  CODE
  SELF.ItemSetValueBasePG(CPG_CLA_FLD_00_01_CLASSNUMBER,               SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_01_CLASSNUMBER))
  SELF.ItemSetValueBasePG(CPG_CLA_FLD_00_02_COURSENUMBER,              SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_02_COURSENUMBER))
  SELF.ItemSetValueBasePG(CPG_CLA_FLD_00_03_TEACHERNUMBER,             SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_03_TEACHERNUMBER))
  SELF.ItemSetValueBasePG(CPG_CLA_FLD_00_04_ROOMNUMBER,                SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_04_ROOMNUMBER))
  SELF.ItemSetValueBasePG(CPG_CLA_FLD_00_05_SCHEDULEDTIME,             SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_05_SCHEDULEDTIME))
  RETURN

!---------------------------------------------------------------------------------
testClassesBaseClass.Thread                       PROCEDURE()
  CODE
  RETURN '![T' & SELF.lThread & ']:CLASS'
    
!---------------------------------------------------------------------------------
testClassesBaseClass.Construct                    PROCEDURE()
  CODE
  SELF.lThread                                     = THREAD()
  SELF.bDebug                                      = TRUE
  SELF.oOwnerString                               &= NEW(StringTheory)
  SELF.Clean()

  SELF.oPG                                        &= NULL
  RETURN

!---------------------------------------------------------------------------------
testClassesBaseClass.Destruct                     PROCEDURE()
  CODE
  DISPOSE(SELF.oOwnerString)
  SELF.oOwnerString                               &= NULL

  SELF.oPG                                        &= NULL
  RETURN

!---------------------------------------------------------------------------------
testClassesBaseClass.Init                         PROCEDURE(STRING pOwnerString)
  CODE
  SELF.oOwnerString.SetValue(CLIP(pOwnerString))
  RETURN

!---------------------------------------------------------------------------------
testClassesBaseClass.DoDebug                      PROCEDURE(BYTE pDebugOnOff)
  CODE
  SELF.bDebug = pDebugOnOff
  RETURN

!---------------------------------------------------------------------------------
testClassesBaseClass.Debug                        PROCEDURE(STRING pMSG, BOOL pShow)
szMSG  &CSTRING
  CODE
  IF pShow = TRUE THEN
    MESSAGE(pMSG, 'CLASS: testClassesBaseClass.Debug')
  END
  IF ~SELF.bDebug THEN RETURN END
  szMSG &= NEW CSTRING( SIZE(pMSG) + 3 )   ! 3 = LEN(<13,10>)
  szMSG  =                   pMSG & '<13,10>'
  _ODS_(szMSG)
  DISPOSE(szMSG)
  RETURN

!---------------------------------------------------------------------------------
testClassesBaseClass.Clean                        PROCEDURE()
  CODE
  CLEAR(SELF.gCLArec.ClassNumber)
  CLEAR(SELF.gCLArec.CourseNumber)
  CLEAR(SELF.gCLArec.TeacherNumber)
  CLEAR(SELF.gCLArec.RoomNumber)
  CLEAR(SELF.gCLArec.ScheduledTime)
  RETURN

!---------------------------------------------------------------------------------
testClassesBaseClass.Dump                         PROCEDURE()
  CODE
  IF ~SELF.bDebug THEN RETURN END
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.Dump([01] ClassNumber=<39>' & CLIP(SELF.gCLArec.ClassNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.Dump([02] CourseNumber=<39>' & CLIP(SELF.gCLArec.CourseNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.Dump([03] TeacherNumber=<39>' & CLIP(SELF.gCLArec.TeacherNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.Dump([04] RoomNumber=<39>' & CLIP(SELF.gCLArec.RoomNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.Dump([05] ScheduledTime=<39>' & CLIP(SELF.gCLArec.ScheduledTime) & '<39>)')
  RETURN

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
testClassesBaseClass.IsFieldChanged               PROCEDURE(LONG pFieldNumber) !,LONG
lReturn                                           LONG(0)
DataAnyRec                                        ANY
sValueRec                                         STRING(255)
DataAnyHist                                       ANY
sValueHist                                        STRING(255)
  CODE
  DataAnyRec                                      &= WHAT(SELF.gCLArec, pFieldNumber)  
  sValueRec                                        = DataAnyRec  
  DataAnyHist                                     &= WHAT(SELF.gCLAhist, pFieldNumber)  
  sValueHist                                       = DataAnyHist 
  lReturn                                          = CHOOSE(sValueRec <> sValueHist) 
  IF (lReturn AND TRUE) THEN 
    SELF.Debug(SELF.Thread() & ' testClassesBaseClass.IsFieldChanged(' & FORMAT(pFieldNumber, @N03) & ') BEFORE: HST="' & CLIP(sValueHist) & '"' , FALSE)
    SELF.Debug(SELF.Thread() & ' testClassesBaseClass.IsFieldChanged(' & FORMAT(pFieldNumber, @N03) & ')  AFTER: REC="' & CLIP(sValueRec) & '"' , FALSE)
  END
  IF (FALSE)
    SELF.Debug(SELF.Thread() & ' testClassesBaseClass.IsFieldChanged(' & FORMAT(pFieldNumber, @N03) & ') lReturn=[ ' & lReturn & ' ]' , FALSE)
  END
  RETURN lReturn

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
testClassesBaseClass.IsRecordChanged              PROCEDURE() !,LONG
nFieldNumber                                      LONG(0)
lReturn                                           LONG(0)
  CODE
  LOOP nFieldNumber = 1 TO 5
    lReturn                                       += SELF.IsFieldChanged(nFieldNumber) 
  END
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass.IsRecordChanged(): lReturn=[ ' & lReturn & ' ]: FIELD CHANGES COUNT' , FALSE)
  RETURN lReturn

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
testClassesBaseClass.CreatesPrime                 PROCEDURE()
  CODE
  !-------------------------------------------------------------------------------------------------! 
  ! Field primming for the 'Creates' record process gets built from the dictionary's initial value. !
  !-------------------------------------------------------------------------------------------------! 
  SELF.gCLArec.ClassNumber                        = CPG_CLA_FLD_DEF_CLASSNUMBER
  SELF.gCLArec.CourseNumber                       = CPG_CLA_FLD_DEF_COURSENUMBER
  SELF.gCLArec.TeacherNumber                      = CPG_CLA_FLD_DEF_TEACHERNUMBER
  SELF.gCLArec.RoomNumber                         = CPG_CLA_FLD_DEF_ROOMNUMBER
  SELF.gCLArec.ScheduledTime                      = CPG_CLA_FLD_DEF_SCHEDULEDTIME
  RETURN


!BANANA: Generate the Methods
!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
testClassesBaseClass.BufferToProperties           PROCEDURE(*gtCLAbase xBuffG)
  CODE
  SELF.Debug(SELF.Thread() & ' ENTRY: testClassesBaseClass.BufferToProperties(<39>...<39>)')

  !SELF.gCLAbuff                                  = xBuffG
  SELF.gCLArec                                    = xBuffG

  SELF.MoveDataToControlBasePG()                 

  SELF.Dump()                                    
  SELF.DumpBasePG()                              

  SELF.Debug(SELF.Thread() & ' EXITS: testClassesBaseClass.BufferToProperties(<39>...<39>)')
  RETURN

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
testClassesBaseClass.BufferFromProperties         PROCEDURE(*gtCLAbase xBuffG)
  CODE
  SELF.Debug(SELF.Thread() & ' ENTRY: testClassesBaseClass.BufferFromProperties(<39>...<39>)')

  !xBuffG                                         = SELF.gCLAbuff
  xBuffG                                          = SELF.gCLArec

  SELF.Dump()                                    
  SELF.DumpBasePG()                              

  SELF.Debug(SELF.Thread() & ' EXITS: testClassesBaseClass.BufferFromProperties(<39>...<39>)')
  RETURN

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
testClassesBaseClass._SendSQL                     PROCEDURE(STRING pSQL) !,LONG,PROC
HaveError                                         LONG(0)
SQLFile                                           &DynFile
TheFile                                           &File
lQuery                                            StringTheory
Result                                            LONG(FALSE)
  CODE
  COMPILE('!***CLASS***',CDEBUG_Classes)
  !SETCLIPBOARD(CLIP(pSQL)) 
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass._SendSQL lQuery=[<13,10>' & CLIP(pSQL) & '<13,10>]: GET CLIPBOARD!', FALSE)
  !***CLASS***
  Result                                          = FALSE

  !--------------------------------------------------------------------------------------!
  ! IMPORTANT: Replace 'zz01' below with your temporary working table for this database. !
  ! The line below does a select to make sure things are good, then does a {PROP:SQL}.   !
  !--------------------------------------------------------------------------------------!
  lQuery.SetValue('SELECT * FROM define.zz01')      
  SELF.Debug(SELF.Thread() & ' testClassesBaseClass._SendSQL lQuery=[ "' & lQuery.GetValue() & '" ]', FALSE)

  SQLFile &= NEW(DynFile)
  SQLFile.SetDriver('ODBC')
  SQLFile.SetOwner(SELF.oOwnerString.GetValue())

  HaveError = SQLFile.CreateFromSQL(lQuery.GetValue())
  IF HaveError THEN
    SELF.Debug(SELF.Thread() & ':ERROR testClassesBaseClass._SendSQL HaveError(' & HaveError & ') [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , TRUE)
    IF HaveError = FileSystemErr THEN                                                                                  ! 90: File System Error
      SELF.Debug(SELF.Thread() & ':ERROR testClassesBaseClass._SendSQL [ ' & FILEERRORCODE() & ' ]: ' & FILEERROR() & '' , TRUE)
    END
  ELSE
    TheFile           &= SQLFile.GetFileRef()
    TheFile{PROP:SQL}  = pSQL
    HaveError          = ERRORCODE()
    IF HaveError THEN 
      SELF.Debug(SELF.Thread() & ':ERROR testClassesBaseClass._SendSQL [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , TRUE)
      IF HaveError = FileSystemErr THEN                                                                                ! 90: File System Error
        SELF.Debug(SELF.Thread() & ':ERROR testClassesBaseClass._SendSQL [ ' & FILEERRORCODE() & ' ]: ' & FILEERROR() & '' , TRUE)
      END
      Result = FALSE
    ELSE
      Result = TRUE
    END!IF
  END!IF
  DISPOSE(SQLFile)
  RETURN Result

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
testClassesBaseClass._IsFieldTypeNumeric          PROCEDURE(STRING pFieldType) !,BYTE
  CODE
  IF(INSTRING('STRING',pFieldType,1,1)>0)
    RETURN FALSE
  END
  CASE(pFieldType)
  OF  ('MEMO')
  OROF('BLOB')
    RETURN FALSE
  END
  RETURN TRUE

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
