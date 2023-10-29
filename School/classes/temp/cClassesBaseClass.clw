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
! Source:       .\classes\temp\cClassesBaseClass.clw
! Table:        Classes
! Unique:       ClassNumber
! Class:        cClassesBaseClass
! Purpose:      Create a CLASS from a TABLE definition.
! Creator:      The DCT to CLASS generator (Clarion).
! Date-Time:    2022/02/24 - 09:16:51AM
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
  INCLUDE('cClassesBaseClass.inc'),ONCE

  INCLUDE('xFiles.inc'),ONCE                                                                                                                                                       ! Definitions

CLA_PREFIX_XML                                    EQUATE('CLA_')
CLA_SUFFIX_XML                                    EQUATE('.XML')

  INCLUDE('jFiles.inc'),ONCE                                                                                                                                                       ! Definitions

CLA_PREFIX_JSON                                   EQUATE('CLA_')
CLA_SUFFIX_JSON                                   EQUATE('.JSON')

  INCLUDE('NYSEquates.equ'),ONCE                                                                                                                                                   ! Common Equates
  INCLUDE('NYSCommon.inc'),ONCE                                                                                                                                                    ! Common Definitions
  INCLUDE('NYSCalendarPro.inc'),ONCE                                                                                                                                               ! Calendars
  INCLUDE('NYSChartPro.inc'),ONCE                                                                                                                                                  ! Charts
  INCLUDE('NYSCommandBars.inc'),ONCE                                                                                                                                               ! Command Bars
  INCLUDE('NYSDockingPane.inc'),ONCE                                                                                                                                               ! Docking Pane
  INCLUDE('NYSFlowGraph.inc'),ONCE                                                                                                                                                 ! Flow Graphs
  INCLUDE('NYSPropertyGrid.inc'),ONCE                                                                                                                                              ! Property Grid
  INCLUDE('NYSReportControl.inc'),ONCE                                                                                                                                             ! Reports
  INCLUDE('NYSShortcutBar.inc'),ONCE                                                                                                                                               ! Shortcut Bars
  INCLUDE('NYSSkinFramework.inc'),ONCE                                                                                                                                             ! Skin Framework
  INCLUDE('NYSSuiteControls.inc'),ONCE                                                                                                                                             ! Suite Controls
  INCLUDE('NYSSyntaxEdit.inc'),ONCE                                                                                                                                                ! Syntax Editor
  INCLUDE('NYSTaskPanel.inc'),ONCE                                                                                                                                                 ! Task Panel

CLA_GETSME_DATE                                   EQUATE('@D2B')
CLA_SHOWME_DATE                                   EQUATE('@D02B')
CLA_FORMAT_DATE                                   EQUATE('%m/%d/%Y')
CLA_BLANKS_DATE                                   EQUATE('__/__/____')
CLA_GETSME_TIME                                   EQUATE('@T4B')
CLA_SHOWME_TIME                                   EQUATE('@T04B')
CLA_FORMAT_TIME                                   EQUATE('%h:%m:%s')
CLA_BLANKS_TIME                                   EQUATE('__:__:__')
 
!---------------------------------------------------------------------------------
cClassesBaseClass.ClassNumber                     PROCEDURE()!,LONG
  CODE
  RETURN SELF.gCLArec.ClassNumber
cClassesBaseClass.ClassNumber                     PROCEDURE(LONG pClassNumber)
  CODE
  SELF.gCLArec.ClassNumber                        = pClassNumber  
  RETURN
!---------------------------------------------------------------------------------
cClassesBaseClass.CourseNumber                    PROCEDURE()!,LONG
  CODE
  RETURN SELF.gCLArec.CourseNumber
cClassesBaseClass.CourseNumber                    PROCEDURE(LONG pCourseNumber)
  CODE
  SELF.gCLArec.CourseNumber                       = pCourseNumber  
  RETURN
!---------------------------------------------------------------------------------
cClassesBaseClass.TeacherNumber                   PROCEDURE()!,LONG
  CODE
  RETURN SELF.gCLArec.TeacherNumber
cClassesBaseClass.TeacherNumber                   PROCEDURE(LONG pTeacherNumber)
  CODE
  SELF.gCLArec.TeacherNumber                      = pTeacherNumber  
  RETURN
!---------------------------------------------------------------------------------
cClassesBaseClass.RoomNumber                      PROCEDURE()!,LONG
  CODE
  RETURN SELF.gCLArec.RoomNumber
cClassesBaseClass.RoomNumber                      PROCEDURE(LONG pRoomNumber)
  CODE
  SELF.gCLArec.RoomNumber                         = pRoomNumber  
  RETURN
!---------------------------------------------------------------------------------
cClassesBaseClass.ScheduledTime                   PROCEDURE()!,STRING
  CODE
  RETURN SELF.gCLArec.ScheduledTime
cClassesBaseClass.ScheduledTime                   PROCEDURE(STRING pScheduledTime)
  CODE
  SELF.gCLArec.ScheduledTime                      = pScheduledTime  
  RETURN

!---------------------------------------------------------------------------------
cClassesBaseClass.InputXML                        PROCEDURE() !,STRING,PROC
sSavePath                                         STRING(FILE:MaxFilePath)
sSaveFile                                         STRING(FILE:MaxFileName)
  CODE
  sSavePath                                       = PATH()  
  sSaveFile                                       = CLA_PREFIX_XML & CLIP(SELF.gCLArec.ClassNumber) & CLA_SUFFIX_XML  

  IF FILEDIALOGA('Load XML file', sSaveFile, 'XML Files|*.XML|All Files|*.*', FILE:LongName + FILE:AddExtension)
    SELF.oXML.Start()
    SELF.oXML.Load(SELF.gCLArec, sSaveFile)        
    SELF.Dump()                                                                                                        ! Testing

    SELF.MoveDataToControlBasePG()
  ELSE
    CLEAR(sSaveFile)  
  END
  
  SETPATH(sSavePath)                             
  RETURN CLIP(sSaveFile)

!---------------------------------------------------------------------
cClassesBaseClass.OutputXML                       PROCEDURE() !,STRING,PROC
sSavePath                                         STRING(FILE:MaxFilePath)
sSaveFile                                         STRING(FILE:MaxFileName)
  CODE
  sSavePath                                       = PATH()  
  sSaveFile                                       = CLA_PREFIX_XML & CLIP(SELF.gCLArec.ClassNumber) & CLA_SUFFIX_XML  

  IF FILEDIALOGA('Save XML file', sSaveFile, 'XML Files|*.XML|All Files|*.*', FILE:Save + FILE:LongName + FILE:AddExtension)
    SELF.Dump()                                                                                                        ! Testing
    SELF.oXML.Start()
    SELF.oXML.Save(SELF.gCLArec, sSaveFile)        
  ELSE
    CLEAR(sSaveFile)  
  END
  
  SETPATH(sSavePath)                             
  RETURN CLIP(sSaveFile)

!---------------------------------------------------------------------------------
cClassesBaseClass.InputJSON                       PROCEDURE() !,STRING,PROC
sSavePath                                         STRING(FILE:MaxFilePath)
sSaveFile                                         STRING(FILE:MaxFileName)
  CODE
  sSavePath                                       = PATH()  
  sSaveFile                                       = CLA_PREFIX_JSON & CLIP(SELF.gCLArec.ClassNumber) & CLA_SUFFIX_JSON  

  IF FILEDIALOGA('Load JSON file', sSaveFile, 'JSON Files|*.JSON|All Files|*.*', FILE:LongName + FILE:AddExtension)
    SELF.oJSON.Start()
    SELF.oJSON.Load(SELF.gCLArec, sSaveFile)       
    SELF.Dump()                                                                                                        ! Testing

    SELF.MoveDataToControlBasePG()
  ELSE
    CLEAR(sSaveFile)  
  END
  
  SETPATH(sSavePath)                             
  RETURN CLIP(sSaveFile)

!---------------------------------------------------------------------
cClassesBaseClass.OutputJSON                      PROCEDURE() !,STRING,PROC
sSavePath                                         STRING(FILE:MaxFilePath)
sSaveFile                                         STRING(FILE:MaxFileName)
  CODE
  sSavePath                                       = PATH()  
  sSaveFile                                       = CLA_PREFIX_JSON & CLIP(SELF.gCLArec.ClassNumber) & CLA_SUFFIX_JSON  

  IF FILEDIALOGA('Save JSON file', sSaveFile, 'JSON Files|*.JSON|All Files|*.*', FILE:Save + FILE:LongName + FILE:AddExtension)
    SELF.Dump()                                                                                                        ! Testing
    SELF.oJSON.Start()
    SELF.oJSON.Save(SELF.gCLArec, sSaveFile)       
  ELSE
    CLEAR(sSaveFile)  
  END
  
  SETPATH(sSavePath)                             
  RETURN CLIP(sSaveFile)

!---------------------------------------------------------------------------------
cClassesBaseClass.SetBasePG                       PROCEDURE(PropertyGridClass pPG)
PropertyGrid_Ctrl                                 CSTRING(21)
PropertyGrid_Result                               BYTE
  CODE
  SELF.Debug(SELF.Thread() & ' ENTRY: cClassesBaseClass.SetBasePG(<39>...<39>)')

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

                                                    SELF.oPG.RefreshContents(TRUE)

  SELF.Debug(SELF.Thread() & ' EXITS: cClassesBaseClass.SetBasePG(<39>...<39>)')
  RETURN

!---------------------------------------------------------------------
cClassesBaseClass.ItemPropertyBasePG              PROCEDURE(STRING pID, LONG pProperty) !,STRING
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
cClassesBaseClass.ItemAcceptedBasePG              PROCEDURE(STRING pID, STRING pValue, STRING pClarionValue)
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
  SELF.Debug(SELF.Thread() & ' ENTRY: cClassesBaseClass.ItemAcceptedBasePG("' & CLIP(pID) & '","' & CLIP(pValue) & '","' & CLIP(pClarionValue) & ')')
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

  SELF.Debug(SELF.Thread() & ' EXITS: cClassesBaseClass.ItemAcceptedBasePG("' & CLIP(pID) & '","' & CLIP(pValue) & '","' & CLIP(pClarionValue) & '")')
  RETURN

!---------------------------------------------------------------------
! Get the value directly from the PG control. Return the value.
cClassesBaseClass.ItemGetValueBasePG              PROCEDURE(STRING pID) !,STRING
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
cClassesBaseClass.ItemSetValueBasePG              PROCEDURE(STRING pID, STRING pValue)
sValue                                            STRING(255)
  CODE
  !SELF.Debug('ItemSetValueBasePG: piD="' & CLIP(pID) & '", pValue="' & CLIP(pValue) & '"', FALSE)

  sValue                                          = SELF.ItemGetValueBasePG(pID)  

  !SELF.Debug('ItemSetValueBasePG: piD="' & CLIP(pID) & '", sValue="' & CLIP(sValue) & '"', FALSE)
  SELF.oPG.SetItemValue(pID, sValue)
  RETURN

!---------------------------------------------------------------------
cClassesBaseClass.DumpBasePG                      PROCEDURE()
  CODE
  IF ~SELF.bDebug THEN RETURN END
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.DumpBasePG(00_01_ClassNumber=<39>' & CLIP(SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_01_CLASSNUMBER)) & '<39>)')
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.DumpBasePG(00_02_CourseNumber=<39>' & CLIP(SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_02_COURSENUMBER)) & '<39>)')
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.DumpBasePG(00_03_TeacherNumber=<39>' & CLIP(SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_03_TEACHERNUMBER)) & '<39>)')
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.DumpBasePG(00_04_RoomNumber=<39>' & CLIP(SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_04_ROOMNUMBER)) & '<39>)')
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.DumpBasePG(00_05_ScheduledTime=<39>' & CLIP(SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_05_SCHEDULEDTIME)) & '<39>)')
  RETURN

!---------------------------------------------------------------------
cClassesBaseClass.InPlaceButtonAcceptedBasePG     PROCEDURE(STRING pID)
sGUID                                             STRING(16)
sDescr                                            STRING(255)
sValue                                            STRING(255)
  CODE
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.InPlaceButtonAcceptedBasePG(<39>' & CLIP(pID) & '<39>)', TRUE)
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
cClassesBaseClass.MoveDataToControlBasePG         PROCEDURE()
  CODE
  SELF.ItemSetValueBasePG(CPG_CLA_FLD_00_01_CLASSNUMBER,               SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_01_CLASSNUMBER))
  SELF.ItemSetValueBasePG(CPG_CLA_FLD_00_02_COURSENUMBER,              SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_02_COURSENUMBER))
  SELF.ItemSetValueBasePG(CPG_CLA_FLD_00_03_TEACHERNUMBER,             SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_03_TEACHERNUMBER))
  SELF.ItemSetValueBasePG(CPG_CLA_FLD_00_04_ROOMNUMBER,                SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_04_ROOMNUMBER))
  SELF.ItemSetValueBasePG(CPG_CLA_FLD_00_05_SCHEDULEDTIME,             SELF.ItemGetValueBasePG(CPG_CLA_FLD_00_05_SCHEDULEDTIME))
  RETURN

!---------------------------------------------------------------------------------
cClassesBaseClass.Thread                          PROCEDURE()
  CODE
  RETURN '![T' & SELF.lThread & ']:CLASS'
    
!---------------------------------------------------------------------------------
cClassesBaseClass.Construct                       PROCEDURE()
  CODE
  SELF.lThread                                     = THREAD()
  SELF.bDebug                                      = TRUE
  SELF.oOwnerString                               &= NEW(StringTheory)
  SELF.Clean()

  SELF.oXML                                       &= NEW(xFileXML)

  SELF.oJSON                                      &= NEW(JSONClass)

  SELF.oPG                                        &= NULL
  RETURN

!---------------------------------------------------------------------------------
cClassesBaseClass.Destruct                        PROCEDURE()
  CODE
  DISPOSE(SELF.oOwnerString)
  SELF.oOwnerString                               &= NULL

  DISPOSE(SELF.oXML)
  SELF.oXML                                       &= NULL

  DISPOSE(SELF.oJSON)
  SELF.oJSON                                      &= NULL

  SELF.oPG                                        &= NULL
  RETURN

!---------------------------------------------------------------------------------
cClassesBaseClass.Init                            PROCEDURE(STRING pOwnerString)
  CODE
  SELF.oOwnerString.SetValue(CLIP(pOwnerString))
  RETURN

!---------------------------------------------------------------------------------
cClassesBaseClass.DoDebug                         PROCEDURE(BYTE pDebugOnOff)
  CODE
  SELF.bDebug = pDebugOnOff
  RETURN

!---------------------------------------------------------------------------------
cClassesBaseClass.Debug                           PROCEDURE(STRING pMSG, BOOL pShow)
szMSG  &CSTRING
  CODE
  IF pShow = TRUE THEN
    MESSAGE(pMSG, 'CLASS: cClassesBaseClass.Debug')
  END
  IF ~SELF.bDebug THEN RETURN END
  szMSG &= NEW CSTRING( SIZE(pMSG) + 3 )   ! 3 = LEN(<13,10>)
  szMSG  =                   pMSG & '<13,10>'
  _ODS_(szMSG)
  DISPOSE(szMSG)
  RETURN

!---------------------------------------------------------------------------------
cClassesBaseClass.Clean                           PROCEDURE()
  CODE
  CLEAR(SELF.gCLArec.ClassNumber)
  CLEAR(SELF.gCLArec.CourseNumber)
  CLEAR(SELF.gCLArec.TeacherNumber)
  CLEAR(SELF.gCLArec.RoomNumber)
  CLEAR(SELF.gCLArec.ScheduledTime)
  RETURN

!---------------------------------------------------------------------------------
cClassesBaseClass.Dump                            PROCEDURE()
  CODE
  IF ~SELF.bDebug THEN RETURN END
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.Dump([01] ClassNumber=<39>' & CLIP(SELF.gCLArec.ClassNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.Dump([02] CourseNumber=<39>' & CLIP(SELF.gCLArec.CourseNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.Dump([03] TeacherNumber=<39>' & CLIP(SELF.gCLArec.TeacherNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.Dump([04] RoomNumber=<39>' & CLIP(SELF.gCLArec.RoomNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.Dump([05] ScheduledTime=<39>' & CLIP(SELF.gCLArec.ScheduledTime) & '<39>)')
  RETURN

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.IsFieldChanged                  PROCEDURE(LONG pFieldNumber) !,LONG
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
    SELF.Debug(SELF.Thread() & ' cClassesBaseClass.IsFieldChanged(' & FORMAT(pFieldNumber, @N03) & ') BEFORE: HST="' & CLIP(sValueHist) & '"' , FALSE)
    SELF.Debug(SELF.Thread() & ' cClassesBaseClass.IsFieldChanged(' & FORMAT(pFieldNumber, @N03) & ')  AFTER: REC="' & CLIP(sValueRec) & '"' , FALSE)
  END
  IF (FALSE)
    SELF.Debug(SELF.Thread() & ' cClassesBaseClass.IsFieldChanged(' & FORMAT(pFieldNumber, @N03) & ') lReturn=[ ' & lReturn & ' ]' , FALSE)
  END
  RETURN lReturn

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.IsRecordChanged                 PROCEDURE() !,LONG
nFieldNumber                                      LONG(0)
lReturn                                           LONG(0)
  CODE
  LOOP nFieldNumber = 1 TO 5
    lReturn                                       += SELF.IsFieldChanged(nFieldNumber) 
  END
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.IsRecordChanged(): lReturn=[ ' & lReturn & ' ]: FIELD CHANGES COUNT' , FALSE)
  RETURN lReturn

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.CreatesPrime                    PROCEDURE()
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

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
! Table Field Count:                              5
! Fields Processed:                               5
!---------------------------------------------------------------------------------
cClassesBaseClass.Creates                         PROCEDURE(STRING pClassNumber)
ST                                                StringTheory
HaveError                                         LONG(0)
SQLFile                                           &DynFile
TheFile                                           &File
lQuery                                            StringTheory
lFields                                           StringTheory
lValues                                           StringTheory
nFieldNumber                                      LONG(0)
sFieldTemp                                        STRING(255)
sFieldWhom                                        STRING(255)
sFieldType                                        STRING(20)
sValue                                            STRING(255)
DataAny                                           ANY
  CODE

  !------------------------------------------------------------------------------------!
  ! The following is an example of how to build an insert statement from the initial   !
  ! values in the dictionary. The requirement is that you have your dictionary setup   !
  ! properly. If the values are not right, the code below will not look correct.       !
  !------------------------------------------------------------------------------------!
  ! NOTE: This will not work for VIEWs with multiple JOINed tables.                    !
  !------------------------------------------------------------------------------------!
  ! lQuery.SetValue('INSERT INTO CLASSES.TPS (')
  ! lQuery.Append  (' ClassNumber, CourseNumber, TeacherNumber, RoomNumber, ScheduledTime')
  ! lQuery.Append  (' ) VALUES (')
  ! lQuery.Append  (' 0, 0, 0, 0, ''''')
  ! lQuery.Append  (' )')

  SELF.Clean()
  SELF.CreatesPrime()

  SELF.gCLArec.ClassNumber                         = pClassNumber  

  lFields.SetValue('')
  lValues.SetValue('')
  LOOP nFieldNumber = 1 TO 5
    sFieldTemp                                     = WHO(SELF.gCLArec, nFieldNumber)
    ST.Setvalue(sFieldTemp)                      
    ST.Split('|',,,,TRUE,TRUE)                   
    sFieldWhom                                     = ST.GetLine(1)  
    sFieldType                                     = ST.GetLine(2)  

    DataAny                                       &= WHAT(SELF.gCLArec, nFieldNumber)  
    sValue                                         = DataAny  
    
    IF (FALSE) THEN
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sFieldTemp) & '"' , FALSE)
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sFieldWhom) & '"' , FALSE)
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sFieldType) & '"' , FALSE)
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sValue) & '"' , FALSE)
    END
    
    CASE(UPPER(CLIP(sFieldWhom)))
    OF  ('ENCRYPTIONVERSION')
    OROF('STS')
    OROF('SERVERTIMESTAMP')
    OROF('DTS')
    OROF('DELETETIMESTAMP')
    OROF('DELETEDTIMESTAMP')
      CYCLE
    END!CASE
    
    IF(nFieldNumber > 1)
      lFields.Append  (' , ')
      lValues.Append  (' , ')
    ELSE
      lFields.Append  (' ')
      lValues.Append  (' ')
    END
    
        lFields.Append  (CLIP(sFieldWhom))
    CASE(UPPER(CLIP(sFieldWhom)))
    OF  ('TS')
    OROF('TIMESTAMP')
    OROF('STS')
    OROF('SERVERTIMESTAMP')
    OROF('DTS')
    OROF('DELETETIMESTAMP')
    OROF('DELETEDTIMESTAMP')
        lValues.Append  ('define.ryb_sf_getelapsedtimeutc()')
    OF  ('DATE_UPDATE')
        lValues.Append  ('current_date')                                                                               ! POSTGRESQL
    OF  ('TIME_UPDATE')
        lValues.Append  ('current_time')                                                                               ! POSTGRESQL
    OF  ('USER_UPDATE')
        lValues.Append  ('current_user')                                                                               ! POSTGRESQL
    OF  ('ACTIVE_FLAG')
        lValues.Append  ('''A''')
    ELSE
      IF SELF._IsFieldTypeNumeric(sFieldType) THEN
        lValues.Append  (CLIP(sValue))
      ELSE
        lValues.Append  ('''' & CLIP(sValue) & '''')
      END
    END
    
  END

  If (FALSE)
    SELF.Debug(SELF.Thread() & ' lFields=[' & lFields.GetValue() & ']' , FALSE)
    SELF.Debug(SELF.Thread() & ' lValues=[' & lValues.GetValue() & ']' , FALSE)
  END

  lQuery.SetValue('INSERT INTO CLASSES.TPS (')
  lQuery.Append  (lFields.GetValue())  
  lQuery.Append  (' ) VALUES (')
  lQuery.Append  (lValues.GetValue())  
  lQuery.Append  (' )')

  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.Creates lQuery=<39>' & lQuery.GetValue() & '<39>' , FALSE)

  SELF._SendSQL(lQuery.GetValue())                                                                                     ! Creates table record as 'A'ctive
  SELF.Reads(pClassNumber)                                                                                             ! Read and display new values
  RETURN 

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
! Table Field Count:                              5
! Fields Processed:                               5
!---------------------------------------------------------------------------------
cClassesBaseClass.CreatesCopy                     PROCEDURE(STRING pClassNumber)
ST                                                StringTheory
HaveError                                         LONG(0)
SQLFile                                           &DynFile
TheFile                                           &File
lQuery                                            StringTheory
lFields                                           StringTheory
lValues                                           StringTheory
nFieldNumber                                      LONG(0)
sFieldTemp                                        STRING(255)
sFieldWhom                                        STRING(255)
sFieldType                                        STRING(20)
sValue                                            STRING(255)
DataAny                                           ANY
  CODE

  !------------------------------------------------------------------------------------!
  ! The following is an example of how to build an insert statement from the initial   !
  ! values in the dictionary. The requirement is that you have your dictionary setup   !
  ! properly. If the values are not right, the code below will not look correct.       !
  !------------------------------------------------------------------------------------!
  ! NOTE: This will not work for VIEWs with multiple JOINed tables.                    !
  !------------------------------------------------------------------------------------!
  ! lQuery.SetValue('INSERT INTO CLASSES.TPS (')
  ! lQuery.Append  (' ClassNumber, CourseNumber, TeacherNumber, RoomNumber, ScheduledTime')
  ! lQuery.Append  (' ) VALUES (')
  ! lQuery.Append  (' 0, 0, 0, 0, ''''')
  ! lQuery.Append  (' )')

  SELF.gCLArec.ClassNumber                         = pClassNumber  

  lFields.SetValue('')
  lValues.SetValue('')
  LOOP nFieldNumber = 1 TO 5
    sFieldTemp                                     = WHO(SELF.gCLArec, nFieldNumber)
    ST.Setvalue(sFieldTemp)                      
    ST.Split('|',,,,TRUE,TRUE)                   
    sFieldWhom                                     = ST.GetLine(1)  
    sFieldType                                     = ST.GetLine(2)  

    DataAny                                       &= WHAT(SELF.gCLArec, nFieldNumber)  
    sValue                                         = DataAny  
    
    IF (FALSE) THEN
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sFieldTemp) & '"' , FALSE)
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sFieldWhom) & '"' , FALSE)
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sFieldType) & '"' , FALSE)
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sValue) & '"' , FALSE)
    END
    
    CASE(UPPER(CLIP(sFieldWhom)))
    OF  ('ENCRYPTIONVERSION')
    OROF('STS')
    OROF('SERVERTIMESTAMP')
    OROF('DTS')
    OROF('DELETETIMESTAMP')
    OROF('DELETEDTIMESTAMP')
      CYCLE
    END!CASE
    
    IF(nFieldNumber > 1)
      lFields.Append  (' , ')
      lValues.Append  (' , ')
    ELSE
      lFields.Append  (' ')
      lValues.Append  (' ')
    END
    
        lFields.Append  (CLIP(sFieldWhom))
    CASE(UPPER(CLIP(sFieldWhom)))
    OF  ('TS')
    OROF('TIMESTAMP')
    OROF('STS')
    OROF('SERVERTIMESTAMP')
    OROF('DTS')
    OROF('DELETETIMESTAMP')
    OROF('DELETEDTIMESTAMP')
        lValues.Append  ('define.ryb_sf_getelapsedtimeutc()')
    OF  ('DATE_UPDATE')
        lValues.Append  ('current_date')                                                                               ! POSTGRESQL
    OF  ('TIME_UPDATE')
        lValues.Append  ('current_time')                                                                               ! POSTGRESQL
    OF  ('USER_UPDATE')
        lValues.Append  ('current_user')                                                                               ! POSTGRESQL
    OF  ('ACTIVE_FLAG')
        lValues.Append  ('''A''')
    ELSE
      IF SELF._IsFieldTypeNumeric(sFieldType) THEN
        lValues.Append  (CLIP(sValue))
      ELSE
        lValues.Append  ('''' & CLIP(sValue) & '''')
      END
    END
    
  END

  If (FALSE)
    SELF.Debug(SELF.Thread() & ' lFields=[' & lFields.GetValue() & ']' , FALSE)
    SELF.Debug(SELF.Thread() & ' lValues=[' & lValues.GetValue() & ']' , FALSE)
  END

  lQuery.SetValue('INSERT INTO CLASSES.TPS (')
  lQuery.Append  (lFields.GetValue())  
  lQuery.Append  (' ) VALUES (')
  lQuery.Append  (lValues.GetValue())  
  lQuery.Append  (' )')

  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.CreatesCopy lQuery=<39>' & lQuery.GetValue() & '<39>' , FALSE)

  SELF._SendSQL(lQuery.GetValue())                                                                                     ! Creates table record as 'A'ctive
  SELF.Reads(pClassNumber)                                                                                             ! Read and display new values
  RETURN 

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.Reads                           PROCEDURE(STRING pClassNumber, BYTE pDoHistory, BYTE pDoSave)!,LONG,PROC
Result                                            LONG(TRUE)
HaveError                                         LONG(0)
SQLFile                                           &DynFile
TheFile                                           &File
lQuery                                            StringTheory
  CODE
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.Reads(<39>' & CLIP(pClassNumber) & '<39>)')

  ! IMPORTANT  Replace '*' below with just the fields you need. Recall joining tables for efficiency.
  ! REMINDERS: Avoid moving lots of data around specially if you are using a remote data source.
  !            AFTER TESTING: Make sure you comment out the !SETCLIPBOARD(...)
  !            AFTER TESTING: Set the SELF.Debug('...',TRUE) to SELF.Debug('...',FALSE)
  !
  ! NOTE:      Found 5 fields [FROM: 'CLASSES.TPS']
  ! lQuery.SetValue('SELECT') 
  ! lQuery.Append  (' Classes.ClassNumber, Classes.CourseNumber, Classes.TeacherNumber, Classes.RoomNumber, Classes.ScheduledTime')
  ! lQuery.Append  (' FROM CLASSES.TPS')
  ! lQuery.Append  (' WHERE ClassNumber = ' & pClassNumber & '')
  !
  lQuery.SetValue('SELECT Classes.* FROM CLASSES.TPS WHERE ClassNumber = ' & pClassNumber & '')
  !SETCLIPBOARD(lQuery.GetValue())
  SELF.Debug(SELF.Thread() & ':lQuery=( "' & lQuery.GetValue() & '" )' , FALSE)

  SQLFile &= NEW(DynFile)
  SQLFile.SetDriver('ODBC')
  SQLFile.SetOwner(SELF.oOwnerString.GetValue())

  HaveError = SQLFile.CreateFromSQL(lQuery.GetValue())
  IF HaveError THEN
    SELF.Debug(SELF.Thread() & ':ERROR cClassesBaseClass.Reads HaveError(' & HaveError & ') [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , TRUE)
    IF HaveError = FileSystemErr THEN                                                                                  ! 90: File System Error
      SELF.Debug(SELF.Thread() & ':ERROR cClassesBaseClass.Reads [ ' & FILEERRORCODE() & ' ]: ' & FILEERROR() & '' , TRUE)
    END
  ELSE
    TheFile &= SQLFile.GetFileRef()
    NEXT(TheFile)
    IF ERRORCODE() = BadRecErr THEN                                                                                    ! 33: Record Not Available
    ELSIF ERRORCODE() > 0 THEN 
      SELF.Debug(SELF.Thread() & ':ERROR cClassesBaseClass.Reads [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , TRUE)
    ELSE
      SELF.gCLArec.ClassNumber                               = SQLFile.GetField('ClassNumber')
      SELF.gCLArec.CourseNumber                              = SQLFile.GetField('CourseNumber')
      SELF.gCLArec.TeacherNumber                             = SQLFile.GetField('TeacherNumber')
      SELF.gCLArec.RoomNumber                                = SQLFile.GetField('RoomNumber')
      SELF.gCLArec.ScheduledTime                             = SQLFile.GetField('ScheduledTime')

      !SELF.Dump()                                                                                                     ! TESTING!!!

      IF (pDoHistory) 
        SELF.gCLAhist                             :=: SELF.gCLArec
      END
      IF (pDoSave) 
        SELF.gCLAsave                             :=: SELF.gCLArec
      END

      SELF.MoveDataToControlBasePG()

      SELF.Debug(SELF.Thread() & ':READ cClassesBaseClass.Reads [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , FALSE)
    END
  END! IF
  DISPOSE(SQLFile)
  RETURN Result

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.ReadsHistory                    PROCEDURE(STRING pClassNumber, BYTE pDoSave)!,LONG,PROC
Result                                            LONG(TRUE)
HaveError                                         LONG(0)
SQLFile                                           &DynFile
TheFile                                           &File
lQuery                                            StringTheory
  CODE
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.ReadsHistory(<39>' & CLIP(pClassNumber) & '<39>)')

  ! IMPORTANT  Replace '*' below with just the fields you need. Recall joining tables for efficiency.
  ! REMINDERS: Avoid moving lots of data around specially if you are using a remote data source.
  !            AFTER TESTING: Make sure you comment out the !SETCLIPBOARD(...)
  !            AFTER TESTING: Set the SELF.Debug('...',TRUE) to SELF.Debug('...',FALSE)
  !
  ! NOTE:      Found 5 fields [FROM: 'CLASSES.TPS']
  ! lQuery.SetValue('SELECT') 
  ! lQuery.Append  (' Classes.ClassNumber, Classes.CourseNumber, Classes.TeacherNumber, Classes.RoomNumber, Classes.ScheduledTime')
  ! lQuery.Append  (' FROM CLASSES.TPS')
  ! lQuery.Append  (' WHERE ClassNumber = ' & pClassNumber & '')
  !
  lQuery.SetValue('SELECT Classes.* FROM CLASSES.TPS WHERE ClassNumber = ' & pClassNumber & '')
  !SETCLIPBOARD(lQuery.GetValue())
  SELF.Debug(SELF.Thread() & ':lQuery=( "' & lQuery.GetValue() & '" )' , FALSE)

  SQLFile &= NEW(DynFile)
  SQLFile.SetDriver('ODBC')
  SQLFile.SetOwner(SELF.oOwnerString.GetValue())

  HaveError = SQLFile.CreateFromSQL(lQuery.GetValue())
  IF HaveError THEN
    SELF.Debug(SELF.Thread() & ':ERROR cClassesBaseClass.ReadsHistory HaveError(' & HaveError & ') [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , TRUE)
    IF HaveError = FileSystemErr THEN                                                                                  ! 90: File System Error
      SELF.Debug(SELF.Thread() & ':ERROR cClassesBaseClass.ReadsHistory [ ' & FILEERRORCODE() & ' ]: ' & FILEERROR() & '' , TRUE)
    END
  ELSE
    TheFile &= SQLFile.GetFileRef()
    NEXT(TheFile)
    IF ERRORCODE() = BadRecErr THEN                                                                                    ! 33: Record Not Available
    ELSIF ERRORCODE() > 0 THEN 
      SELF.Debug(SELF.Thread() & ':ERROR cClassesBaseClass.ReadsHistory [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , TRUE)
    ELSE
      SELF.gCLAhist.ClassNumber                              = SQLFile.GetField('ClassNumber')
      SELF.gCLAhist.CourseNumber                             = SQLFile.GetField('CourseNumber')
      SELF.gCLAhist.TeacherNumber                            = SQLFile.GetField('TeacherNumber')
      SELF.gCLAhist.RoomNumber                               = SQLFile.GetField('RoomNumber')
      SELF.gCLAhist.ScheduledTime                            = SQLFile.GetField('ScheduledTime')

      IF (pDoSave) 
        SELF.gCLAsave                             :=: SELF.gCLAhist
      END

      SELF.Debug(SELF.Thread() & ':READ cClassesBaseClass.ReadsHistory [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , FALSE)
    END
  END! IF
  DISPOSE(SQLFile)
  RETURN Result

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.Updates                         PROCEDURE(STRING pClassNumber)
Result                                            LONG(TRUE)
lFieldsChanged                                    LONG(0)
  CODE
  CLEAR(SELF.gCLAhist)
  Result                                          = SELF.ReadsHistory(pClassNumber)
  lFieldsChanged                                  = SELF.IsRecordChanged()  
  IF (lFieldsChanged)
    SELF.UpdatesDo(pClassNumber)
  ELSE
    SELF.Debug(SELF.Thread() & ' cClassesBaseClass.Updates lFieldsChanged=[ ' & lFieldsChanged & ' ]: NO UPDATES! Nothing has changed.' , FALSE)
  END
  RETURN

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.UpdatesDo                       PROCEDURE(STRING pClassNumber)
ST                                                StringTheory
HaveError                                         LONG(0)
SQLFile                                           &DynFile
TheFile                                           &File
lQuery                                            StringTheory
nFieldNumber                                      LONG(0)
sFieldTemp                                        STRING(255)
sFieldWhom                                        STRING(255)
sFieldType                                        STRING(20)
sValue                                            STRING(255)
DataAny                                           ANY
  CODE

  !------------------------------------------------------------------------------------!
  ! The following is an example of how to build an update statement from the initial   !
  ! values in the dictionary. The requirement is that you have your dictionary setup   !
  ! properly. If the values are not right, the code below will not look correct.       !
  !------------------------------------------------------------------------------------!
  ! NOTE: This will not work for VIEWs with multiple JOINed tables.                    !
  !------------------------------------------------------------------------------------!
  ! lQuery.SetValue('UPDATE CLASSES.TPS')
  ! lQuery.Append  (' SET ClassNumber = 0, CourseNumber = 0, TeacherNumber = 0, RoomNumber = 0, ScheduledTime = ''''')
  ! lQuery.Append  (' WHERE ClassNumber = ' & pClassNumber & '')

  SELF.gCLArec.ClassNumber                         = pClassNumber  

  LOOP nFieldNumber = 1 TO 5
    sFieldTemp                                     = WHO(SELF.gCLArec, nFieldNumber)  
    ST.Setvalue(sFieldTemp)                      
    ST.Split('|',,,,TRUE,TRUE)                   
    sFieldWhom                                     = ST.GetLine(1)  
    sFieldType                                     = ST.GetLine(2)  
    DataAny                                       &= WHAT(SELF.gCLArec, nFieldNumber)  
    sValue                                         = DataAny  
    
    IF (FALSE) THEN
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sFieldTemp) & '"' , FALSE)
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sFieldWhom) & '"' , FALSE)
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sFieldType) & '"' , FALSE)
      SELF.Debug(SELF.Thread() & ' [ ' & FORMAT(nFieldNumber,@N02) & ' ]="' & CLIP(sValue) & '"' , FALSE)
    END
    
    CASE(UPPER(CLIP(sFieldWhom)))
    OF  ('ENCRYPTIONVERSION')
    OROF('STS')
    OROF('SERVERTIMESTAMP')
    OROF('GUID')
      CYCLE
    END!CASE
    
    CASE(UPPER(CLIP(sFieldWhom)))
    OF  ('TS')
    OROF('TIMESTAMP')
          IF(nFieldNumber > 1) THEN lQuery.Append (' , ') ELSE lQuery.Append (' SET ') END
          lQuery.Append  (CLIP(sFieldWhom) & ' = ')
          lQuery.Append  ('define.ryb_sf_getelapsedtimeutc()')
    OF  ('DTS')
    OROF('DELETETIMESTAMP')
    OROF('DELETEDTIMESTAMP')
          IF(nFieldNumber > 1) THEN lQuery.Append (' , ') ELSE lQuery.Append (' SET ') END
          lQuery.Append  (CLIP(sFieldWhom) & ' = ')
          lQuery.Append  ('0')
    OF  ('DATE_UPDATE')
          IF(nFieldNumber > 1) THEN lQuery.Append (' , ') ELSE lQuery.Append (' SET ') END
          lQuery.Append  (CLIP(sFieldWhom) & ' = ')
          lQuery.Append  ('current_date')                                                                              ! POSTGRESQL
    OF  ('TIME_UPDATE')
          IF(nFieldNumber > 1) THEN lQuery.Append (' , ') ELSE lQuery.Append (' SET ') END
          lQuery.Append  (CLIP(sFieldWhom) & ' = ')
          lQuery.Append  ('current_time')                                                                              ! POSTGRESQL
    OF  ('USER_UPDATE')
          IF(nFieldNumber > 1) THEN lQuery.Append (' , ') ELSE lQuery.Append (' SET ') END
          lQuery.Append  (CLIP(sFieldWhom) & ' = ')
          lQuery.Append  ('current_user')                                                                              ! POSTGRESQL
    ELSE
      IF SELF.IsFieldChanged(nFieldNumber) THEN
          !SELF.Debug(SELF.Thread() & ' cClassesBaseClass.UpdatesDo sFieldWhom="' & CLIP(sFieldWhom) & '" CHANGED' , FALSE)
          IF(nFieldNumber > 1) THEN lQuery.Append (' , ') ELSE lQuery.Append (' SET ') END
          lQuery.Append  (CLIP(sFieldWhom) & ' = ')
        IF SELF._IsFieldTypeNumeric(sFieldType) THEN
          lQuery.Append  (CLIP(sValue))
        ELSE
          lQuery.Append  ('''' & CLIP(sValue) & '''')
        END
      ELSE
          !SELF.Debug(SELF.Thread() & ' cClassesBaseClass.UpdatesDo sFieldWhom="' & CLIP(sFieldWhom) & '" SAME' , FALSE)
      END
    END
    
  END
          lQuery.Append  (' WHERE ClassNumber = ' & pClassNumber & '')

  !SELF.Dump()                                                                                                         ! Testing
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.UpdatesDo lQuery=<39>' & lQuery.GetValue() & '<39>' , FALSE)

  SELF._SendSQL(lQuery.GetValue())                                                                                     ! Update table record as 'A'ctive
  SELF.Reads(pClassNumber)                                                                                             ! Read and display new values
  RETURN

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.Deletes                         PROCEDURE(STRING pClassNumber)
HaveError                                         LONG(0)
SQLFile                                           &DynFile
TheFile                                           &File
lQuery                                            StringTheory
  CODE

  !------------------------------------------------------------------------------------!
  ! While this is an example of deleting a table record, we might not want to do this. !
  ! A possible better choice is to update the record, and just mark it as deleted.     !
  ! This other choice is implemented below. Your requirements and mileage may vary.    !
  !------------------------------------------------------------------------------------!
  ! NOTE: This will not work for VIEWs with multiple JOINed tables.                    !
  !------------------------------------------------------------------------------------!
  ! lQuery.SetValue('DELETE CLASSES.TPS')
  ! lQuery.Append  (' WHERE ClassNumber = ' & pClassNumber & '')

  !------------------------------------------------------------------------------------!
  ! We have implemented here an update of the table record, marking it as deleted.     !
  !------------------------------------------------------------------------------------!
  ! lQuery.SetValue('UPDATE CLASSES.TPS')
  ! lQuery.Append  (' SET ')
  ! lQuery.Append  (' WHERE ClassNumber = ' & pClassNumber & '')

  SELF.Debug(SELF.Thread() & ' cClassesBaseClass.Deletes lQuery=<39>' & lQuery.GetValue() & '<39>' , FALSE)

  SELF._SendSQL(lQuery.GetValue())                                                                                     ! Update table record as 'D'eleted
  SELF.Reads(pClassNumber)                                                                                             ! Read and display new values
  RETURN

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.SetsTransferClass               PROCEDURE(cClassesBaseClass pTransfer)                               ! Change class reference
!---------------------------------------------------------------------------------
  CODE
  SELF.oTransfer                                  &= pTransfer
  RETURN

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.ReadTransferClass               PROCEDURE()
!---------------------------------------------------------------------------------
  CODE
  SELF.gCLArec.ClassNumber                        = SELF.oTransfer.gCLArec.ClassNumber
  SELF.gCLArec.CourseNumber                       = SELF.oTransfer.gCLArec.CourseNumber
  SELF.gCLArec.TeacherNumber                      = SELF.oTransfer.gCLArec.TeacherNumber
  SELF.gCLArec.RoomNumber                         = SELF.oTransfer.gCLArec.RoomNumber
  SELF.gCLArec.ScheduledTime                      = SELF.oTransfer.gCLArec.ScheduledTime
  RETURN
  
!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.SaveTransferClass               PROCEDURE()
!---------------------------------------------------------------------------------
  CODE
  SELF.oTransfer.gCLArec.ClassNumber              = SELF.gCLArec.ClassNumber
  SELF.oTransfer.gCLArec.CourseNumber             = SELF.gCLArec.CourseNumber
  SELF.oTransfer.gCLArec.TeacherNumber            = SELF.gCLArec.TeacherNumber
  SELF.oTransfer.gCLArec.RoomNumber               = SELF.gCLArec.RoomNumber
  SELF.oTransfer.gCLArec.ScheduledTime            = SELF.gCLArec.ScheduledTime
  RETURN

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.BufferToProperties              PROCEDURE(*gtCLAbase xBuffG)
  CODE
  SELF.Debug(SELF.Thread() & ' ENTRY: cClassesBaseClass.BufferToProperties(<39>...<39>)')

  SELF.gCLArec                                    = xBuffG

  SELF.MoveDataToControlBasePG()                 

  IF (FALSE)                                                                                                           ! TESTING!!!
    SELF.Dump()                                  
    SELF.DumpBasePG()                            
  END

  SELF.Debug(SELF.Thread() & ' EXITS: cClassesBaseClass.BufferToProperties(<39>...<39>)')
  RETURN

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass.BufferFromProperties            PROCEDURE(*gtCLAbase xBuffG)
  CODE
  SELF.Debug(SELF.Thread() & ' ENTRY: cClassesBaseClass.BufferFromProperties(<39>...<39>)')

  xBuffG                                          = SELF.gCLArec

  IF (FALSE)                                                                                                           ! TESTING!!!
    SELF.Dump()                                  
    SELF.DumpBasePG()                            
  END

  SELF.Debug(SELF.Thread() & ' EXITS: cClassesBaseClass.BufferFromProperties(<39>...<39>)')
  RETURN

!---------------------------------------------------------------------------------
! File:                                           Classes
! FileName:                                       'CLASSES.TPS'
!---------------------------------------------------------------------------------
cClassesBaseClass._SendSQL                        PROCEDURE(STRING pSQL) !,LONG,PROC
HaveError                                         LONG(0)
SQLFile                                           &DynFile
TheFile                                           &File
lQuery                                            StringTheory
Result                                            LONG(FALSE)
  CODE
  COMPILE('!***CLASS***',CDEBUG_Classes)
  !SETCLIPBOARD(CLIP(pSQL)) 
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass._SendSQL lQuery=[<13,10>' & CLIP(pSQL) & '<13,10>]: GET CLIPBOARD!', FALSE)
  !***CLASS***
  Result                                          = FALSE

  !--------------------------------------------------------------------------------------!
  ! IMPORTANT: Replace 'zz01' below with your temporary working table for this database. !
  ! The line below does a select to make sure things are good, then does a {PROP:SQL}.   !
  !--------------------------------------------------------------------------------------!
  lQuery.SetValue('SELECT * FROM define.zz01')      
  SELF.Debug(SELF.Thread() & ' cClassesBaseClass._SendSQL lQuery=[ "' & lQuery.GetValue() & '" ]', FALSE)

  SQLFile &= NEW(DynFile)
  SQLFile.SetDriver('ODBC')
  SQLFile.SetOwner(SELF.oOwnerString.GetValue())

  HaveError = SQLFile.CreateFromSQL(lQuery.GetValue())
  IF HaveError THEN
    SELF.Debug(SELF.Thread() & ':ERROR cClassesBaseClass._SendSQL HaveError(' & HaveError & ') [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , TRUE)
    IF HaveError = FileSystemErr THEN                                                                                  ! 90: File System Error
      SELF.Debug(SELF.Thread() & ':ERROR cClassesBaseClass._SendSQL [ ' & FILEERRORCODE() & ' ]: ' & FILEERROR() & '' , TRUE)
    END
  ELSE
    TheFile           &= SQLFile.GetFileRef()
    TheFile{PROP:SQL}  = pSQL
    HaveError          = ERRORCODE()
    IF HaveError THEN 
      SELF.Debug(SELF.Thread() & ':ERROR cClassesBaseClass._SendSQL [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , TRUE)
      IF HaveError = FileSystemErr THEN                                                                                ! 90: File System Error
        SELF.Debug(SELF.Thread() & ':ERROR cClassesBaseClass._SendSQL [ ' & FILEERRORCODE() & ' ]: ' & FILEERROR() & '' , TRUE)
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
cClassesBaseClass._IsFieldTypeNumeric             PROCEDURE(STRING pFieldType) !,BYTE
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
!    Ending Date-Time: 2022/02/24 - 09:16:06AM
! Beginning Date-Time: 2022/02/24 - 09:16:06AM
!     Processing Time: 0 hundreths of a second (1 seconds)
!
!EOF
