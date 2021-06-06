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
! Source:       .\classes\temp\testClassesListClass.clw
! Table:        Classes
! Class:        testClassesListClass
! Purpose:      Create a CLASS from a TABLE definition.
! Creator:      The DCT to CLASS generator (Clarion).
! Date-Time:    2021.04.18 - 07.39.41
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
  INCLUDE('Errors.CLW')
  INCLUDE('DynFile.INC'),ONCE
  INCLUDE('StringTheory.INC'),ONCE
  INCLUDE('testClassesBaseClass.inc'),ONCE
  INCLUDE('testClassesListClass.inc'),ONCE

  INCLUDE('NYSEquates.equ'),ONCE                                                                                       ! Common Equates
  INCLUDE('NYSCommon.inc'),ONCE                                                                                        ! Common Definitions
  INCLUDE('NYSCalendarPro.inc'),ONCE                                                                                   ! Calendars
  INCLUDE('NYSChartPro.inc'),ONCE                                                                                      ! Charts
  INCLUDE('NYSCommandBars.inc'),ONCE                                                                                   ! Command Bars
  INCLUDE('NYSDockingPane.inc'),ONCE                                                                                   ! Docking Pane
  INCLUDE('NYSFlowGraph.inc'),ONCE                                                                                     ! Flow Graphs
  INCLUDE('NYSPropertyGrid.inc'),ONCE                                                                                  ! Property Grid
  INCLUDE('NYSReportControl.inc'),ONCE                                                                                 ! Reports
  INCLUDE('NYSShortcutBar.inc'),ONCE                                                                                   ! Shortcut Bars
  INCLUDE('NYSSkinFramework.inc'),ONCE                                                                                 ! Skin Framework
  INCLUDE('NYSSuiteControls.inc'),ONCE                                                                                 ! Suite Controls
  INCLUDE('NYSSyntaxEdit.inc'),ONCE                                                                                    ! Syntax Editor
  INCLUDE('NYSTaskPanel.inc'),ONCE                                                                                     ! Task Pannel

CLA_GETSME_DATE                                   EQUATE('@D2B')
CLA_SHOWME_DATE                                   EQUATE('@D02B')
CLA_FORMAT_DATE                                   EQUATE('%m/%d/%Y')
CLA_BLANKS_DATE                                   EQUATE('__/__/____')
CLA_GETSME_TIME                                   EQUATE('@T4B')
CLA_SHOWME_TIME                                   EQUATE('@T04B')
CLA_FORMAT_TIME                                   EQUATE('%h:%m:%s')
CLA_BLANKS_TIME                                   EQUATE('__:__:__')

!---------------------------------------------------------------------------------
testClassesListClass.SetEditRC                    PROCEDURE(ReportControlClass pRC)
ReportControl_Ctrl                                CSTRING(21)
ReportControl_Result                              BYTE
  CODE
  SELF.oRC                                        &= pRC

! Noyantis: Generate the METHODS for the Report Control


  ReportControl_Ctrl                              = SELF.oRC.AddColumn                                ('01_ClassNumber','Class Number',91,1,1,1,1)
  ReportControl_Ctrl                              = SELF.oRC.AddColumn                                ('02_CourseNumber','Course Number',98,1,1,1,2)
  ReportControl_Ctrl                              = SELF.oRC.AddColumn                                ('03_TeacherNumber','Teacher Number',105,1,1,1,3)
  ReportControl_Ctrl                              = SELF.oRC.AddColumn                                ('04_RoomNumber','Room Number',84,1,1,1,4)
  ReportControl_Ctrl                              = SELF.oRC.AddColumn                                ('05_ScheduledTime','Scheduled Time',200,1,1,1,5)

  SELF.oRC.CreateColumns()

! NOTE: Field 'ClassNumber' has validation 'NONZERO'
                                                    SELF.SetAmountPropertiesRC                        ('01_ClassNumber','Class Number',91,CPG_CLA_FLD_TIP_SCHEDULEDTIME)
                                                    SELF.oRC.ColumnEditStyle                          ('01_ClassNumber',xtpEditStyleRight + xtpEditStyleMultiline)
                                                    SELF.oRC.SetColumnHeaderAlignment                 ('01_ClassNumber',xtpAlignmentRight)
                                                    SELF.oRC.SetColumnAlignment                       ('01_ClassNumber',xtpAlignmentRight)
                                                    SELF.oRC.SetColumnDetectMouseClick                ('01_ClassNumber',1)
                                                    SELF.oRC.SetColumnEditable                        ('01_ClassNumber',1)

! NOTE: Field 'CourseNumber' has validation 'INFILE'
                                                    SELF.SetAmountPropertiesRC                        ('02_CourseNumber','Course Number',98,CPG_CLA_FLD_TIP_SCHEDULEDTIME)
                                                    SELF.oRC.ColumnEditStyle                          ('02_CourseNumber',xtpEditStyleRight + xtpEditStyleMultiline)
                                                    SELF.oRC.SetColumnHeaderAlignment                 ('02_CourseNumber',xtpAlignmentRight)
                                                    SELF.oRC.SetColumnAlignment                       ('02_CourseNumber',xtpAlignmentRight)
                                                    SELF.oRC.SetColumnDetectMouseClick                ('02_CourseNumber',1)
                                                    SELF.oRC.SetColumnEditable                        ('02_CourseNumber',1)

! NOTE: Field 'TeacherNumber' has validation 'INFILE'
                                                    SELF.SetAmountPropertiesRC                        ('03_TeacherNumber','Teacher Number',105,CPG_CLA_FLD_TIP_SCHEDULEDTIME)
                                                    SELF.oRC.ColumnEditStyle                          ('03_TeacherNumber',xtpEditStyleRight + xtpEditStyleMultiline)
                                                    SELF.oRC.SetColumnHeaderAlignment                 ('03_TeacherNumber',xtpAlignmentRight)
                                                    SELF.oRC.SetColumnAlignment                       ('03_TeacherNumber',xtpAlignmentRight)
                                                    SELF.oRC.SetColumnDetectMouseClick                ('03_TeacherNumber',1)
                                                    SELF.oRC.SetColumnEditable                        ('03_TeacherNumber',1)

! NOTE: Field 'RoomNumber' has validation 'NONZERO'
                                                    SELF.SetAmountPropertiesRC                        ('04_RoomNumber','Room Number',84,CPG_CLA_FLD_TIP_SCHEDULEDTIME)
                                                    SELF.oRC.ColumnEditStyle                          ('04_RoomNumber',xtpEditStyleRight + xtpEditStyleMultiline)
                                                    SELF.oRC.SetColumnAlignment                       ('04_RoomNumber',xtpAlignmentLeft)
                                                    SELF.oRC.SetColumnHeaderAlignment                 ('04_RoomNumber',xtpAlignmentLeft)
                                                    SELF.oRC.SetColumnDetectMouseClick                ('04_RoomNumber',1)
                                                    SELF.oRC.SetColumnEditable                        ('04_RoomNumber',1)

! NOTE: Field 'ScheduledTime' has validation 'NONZERO'
                                                    SELF.SetColumnPropertiesRC                        ('05_ScheduledTime','Scheduled Time',200,CPG_CLA_FLD_TIP_SCHEDULEDTIME)
                                                    SELF.oRC.ColumnEditStyle                          ('05_ScheduledTime',xtpEditStyleLeft + xtpEditStyleMultiline)
                                                    SELF.oRC.SetColumnAlignment                       ('05_ScheduledTime',xtpAlignmentLeft)
                                                    SELF.oRC.SetColumnHeaderAlignment                 ('05_ScheduledTime',xtpAlignmentLeft)
                                                    SELF.oRC.SetColumnDetectMouseClick                ('05_ScheduledTime',1)
                                                    SELF.oRC.SetColumnEditable                        ('05_ScheduledTime',1)

  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.SetColumnPropertiesRC        PROCEDURE(STRING pID, STRING pCaption, LONG pWidth, STRING pTooltip)
  CODE
  !SELF.Debug('ENTER: testClassesListClass.SetColumnPropertiesRC(<39>' & CLIP(pID) & '<39>)', FALSE)
  SELF.Debug('SETUP: Column: LEFT:::: "' & CLIP(pID) & '"')
  SELF.SetCommonPropertiesRC(pID, pCaption, pWidth, pTooltip)

  SELF.oRC.ColumnEditStyle(pID                    ,xtpEditStyleLeft + xtpEditStyleMultiline) 
  SELF.oRC.SetColumnAlignment(pID                 ,xtpAlignmentLeft) 
  SELF.oRC.SetColumnHeaderAlignment(pID           ,xtpAlignmentLeft) 
  !SELF.Debug('EXITS: testClassesListClass.SetColumnPropertiesRC(<39>' & CLIP(pID) & '<39>)', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.SetAmountPropertiesRC        PROCEDURE(STRING pID, STRING pCaption, LONG pWidth, STRING pTooltip)
  CODE
  !SELF.Debug('ENTER: testClassesListClass.SetAmountPropertiesRC(<39>' & CLIP(pID) & '<39>)', FALSE)
  SELF.Debug('SETUP: Amount: RIGHT: "' & CLIP(pID) & '"')
  SELF.SetCommonPropertiesRC(pID, pCaption, pWidth, pTooltip)

  SELF.oRC.ColumnEditStyle(pID                    ,xtpEditStyleRight + xtpEditStyleMultiline) 
  SELF.oRC.SetColumnAlignment(pID                 ,xtpAlignmentRight) 
  SELF.oRC.SetColumnHeaderAlignment(pID           ,xtpAlignmentRight) 
  !SELF.Debug('EXITS: testClassesListClass.SetAmountPropertiesRC(<39>' & CLIP(pID) & '<39>)', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.SetCommonPropertiesRC        PROCEDURE(STRING pID, STRING pCaption, LONG pWidth, STRING pTooltip)
  CODE
  !SELF.Debug('ENTER: testClassesListClass.SetCommonPropertiesRC(<39>' & CLIP(pID) & '<39>)', FALSE)
  SELF.oRC.SetColumnCaption(pID                   ,pCaption) 
  SELF.oRC.SetColumnMinimumWidth(pID              ,pWidth) 
  SELF.oRC.SetColumnTooltip(pID                   ,pTooltip) 
  SELF.oRC.SetColumnAutoSize(pID                  ,0) 
  SELF.oRC.SetColumnBestFitMode(pID               ,0) 
  SELF.oRC.SetColumnCalcGrandTotal(pID            ,0) 
  SELF.oRC.SetColumnCalcGroupTotals(pID           ,0) 
  SELF.oRC.SetColumnDrag(pID                      ,1) 

  !-------------------------------------------------------!
  ! REMINDER NOTE:                                        !
  ! On the Report Control template: Clarion menu actions. !
  ! On the tab: Options | Rows | EIP                      !
  ! Set: ON: Allow row editing, ON: Edit on double click. !
  !-------------------------------------------------------!
  SELF.oRC.SetColumnDetectMouseClick(pID          ,0) 
  SELF.oRC.SetColumnEditable(pID                  ,0) 

  SELF.oRC.SetColumnExpandable(pID                ,FALSE, 0) 
  SELF.oRC.SetColumnFieldSelector(pID             ,1) 
  SELF.oRC.SetColumnFilterable(pID                ,1) 
  SELF.oRC.SetColumnFooterFont(pID                ,'Segoe UI', '10', 0, 0, 0, 0) 
  SELF.oRC.SetColumnGroupable(pID                 ,1) 
  SELF.oRC.SetColumnIcon(pID                      ,'', 0, 0) 
  SELF.oRC.SetColumnInLineFilter(pID              ,1) 
  SELF.oRC.SetColumnInLineSearch(pID              ,1) 
  SELF.oRC.SetColumnRemove(pID                    ,0) 
  SELF.oRC.SetColumnResizable(pID                 ,1) 
  SELF.oRC.SetColumnSortable(pID                  ,1) 
  SELF.oRC.SetColumnSortGrouped(pID               ,1) 
  SELF.oRC.SetColumnTree(pID                      ,0) 
  !SELF.Debug('EXITS: testClassesListClass.SetCommonPropertiesRC(<39>' & CLIP(pID) & '<39>)', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.ClearsRowsRC                 PROCEDURE()
  CODE
  SELF.Debug(SELF.Thread() & ' ENTER: testClassesListClass.ClearsRowsRC()')
  LOOP I# = RECORDS(SELF.EditQ) TO 1 BY -1
    GET(SELF.EditQ, I#)
    SELF.Debug(SELF.Thread() & ' testClassesListClass.ClearsRowsRC ======================================== [ ' & FORMAT(I#,@N03) & ' ]' , FALSE)
    SELF.oRC.DeleteRow(CLIP(SELF.EditQ.guid))
    SELF.Debug(SELF.Thread() & ' testClassesListClass.ClearsRowsRC ======================================== [ ' & FORMAT(I#,@N03) & ' ]' , FALSE)
    DELETE(SELF.EditQ)
  END!ENDLOOP
  SELF.oRC.RefreshContents(TRUE)
  SELF.Debug(SELF.Thread() & ' EXITS: testClassesListClass.ClearsRowsRC()', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.SetDataLoadRC                PROCEDURE()
ReportControl_Ctrl                                CSTRING(21)
ReportControl_Result                              BYTE
  CODE
  SELF.Debug(SELF.Thread() & ' ENTER: testClassesListClass.SetDataLoadRC()')
  LOOP I# = 1 TO RECORDS(SELF.EditQ)
    GET(SELF.EditQ, I#)
    SELF.Debug(SELF.Thread() & ' testClassesListClass.SetDataLoadRC ======================================== [ ' & FORMAT(I#,@N03) & ' ]' , FALSE)
    SELF.RowAddRC(CLIP(SELF.EditQ.guid))
    SELF.Debug(SELF.Thread() & ' testClassesListClass.SetDataLoadRC ======================================== [ ' & FORMAT(I#,@N03) & ' ]' , FALSE)
  END!ENDLOOP
  SELF.Debug(SELF.Thread() & ' EXITS: testClassesListClass.SetDataLoadRC()', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.RowAddRC                     PROCEDURE(STRING pRowID)
ReportControl_Ctrl                                CSTRING(21)
ReportControl_Result                              BYTE
  CODE
  SELF.Debug(SELF.Thread() & ' ENTER: testClassesListClass.RowAddRC(<39>' & CLIP(pRowID) & '<39>)')
  ReportControl_Ctrl                              = SELF.oRC.AddRow(pRowID, TRUE) 
                                                    SELF.RowUpdateRC(pRowID) 
  SELF.Debug(SELF.Thread() & ' EXITS: testClassesListClass.RowAddRC(<39>' & CLIP(pRowID) & '<39>)', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.RowUpdateRC                  PROCEDURE(STRING pRowID)
ReportControl_Ctrl                                CSTRING(21)
ReportControl_Result                              BYTE
  CODE
!!!  SELF.Debug('ENTER: testClassesListClass.RowUpdateRC(<39>' & CLIP(pRowID) & '<39>)', FALSE)
  ReportControl_Result                            = SELF.oRC.SetRowCellValue  ( pRowID, '01_ClassNumber'                        , CLIP(SELF.EditQ.ClassNumber) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellCaption( pRowID, '01_ClassNumber'                        , CLIP(LEFT(FORMAT(SELF.EditQ.ClassNumber,@P##-#####P))) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellValue  ( pRowID, '02_CourseNumber'                       , CLIP(SELF.EditQ.CourseNumber) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellCaption( pRowID, '02_CourseNumber'                       , CLIP(LEFT(FORMAT(SELF.EditQ.CourseNumber,@n4))) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellValue  ( pRowID, '03_TeacherNumber'                      , CLIP(SELF.EditQ.TeacherNumber) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellCaption( pRowID, '03_TeacherNumber'                      , CLIP(LEFT(FORMAT(SELF.EditQ.TeacherNumber,@p###-##-####p))) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellValue  ( pRowID, '04_RoomNumber'                         , CLIP(SELF.EditQ.RoomNumber) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellCaption( pRowID, '04_RoomNumber'                         , CLIP(LEFT(FORMAT(SELF.EditQ.RoomNumber,@n4))) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellValue  ( pRowID, '05_ScheduledTime'                      , CLIP(SELF.EditQ.ScheduledTime) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellCaption( pRowID, '05_ScheduledTime'                      , CLIP(LEFT(FORMAT(SELF.EditQ.ScheduledTime,@s20))) ) 
!!!  SELF.Debug('EXITS: testClassesListClass.RowUpdateRC(<39>' & CLIP(pRowID) & '<39>)', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.RowUpdatingRC                PROCEDURE(STRING pRowID, STRING pColumnID, STRING pOldValue)
ReportControl_Ctrl                                CSTRING(21)
ReportControl_Result                              BYTE
  CODE
  SELF.Debug('ENTER: testClassesListClass.RowUpdatingRC(<39>' & CLIP(pRowID) & '<39>,<39>' & CLIP(pColumnID) & '<39>,<39>' & CLIP(pOldValue) & '<39>)', FALSE)

  SELF.Debug('EXITS: testClassesListClass.RowUpdatingRC(<39>' & CLIP(pRowID) & '<39>,<39>' & CLIP(pColumnID) & '<39>,<39>' & CLIP(pOldValue) & '<39>)', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.RowUpdatedRC                 PROCEDURE(STRING pRowID, STRING pColumnID, STRING pNewValue)
RowFound                                          BYTE(FALSE)
  CODE
  SELF.Debug('ENTER: testClassesListClass.RowUpdatedRC(<39>' & CLIP(pRowID) & '<39>,<39>' & CLIP(pColumnID) & '<39>,<39>' & CLIP(pNewValue) & '<39>)', FALSE)

  RowFound                                        = FALSE  
  LOOP I# = 1  TO RECORDS(SELF.EditQ)
    GET(SELF.EditQ, I#)
    SELF.Debug('testClassesListClass.RowUpdatedRC: CHECK: I#=[ ' & I# & ' ], CLIP(SELF.EditQ.guid)="' & CLIP(SELF.EditQ.guid) & '", CLIP(pRowID)="' & CLIP(pRowID) & '"')
    IF ( CLIP(SELF.EditQ.guid) = CLIP(pRowID) ) THEN
      RowFound                                    = TRUE        
      SELF.Debug('testClassesListClass.RowUpdatedRC: FOUND: I#=[ ' & I# & ' ], CLIP(pRowID)="' & CLIP(pRowID) & '"')
      BREAK 
    END 
  END!LOOP

  IF (RowFound = TRUE) THEN
    SELF.CellUpdateItem   (pRowID, pColumnID, pNewValue)                                                               ! Change specific cell
    SELF.CalcRowItem      (pRowID)                                                                                     ! Do calculations
    SELF.CellUpdateItemRC (pRowID, pColumnID, pNewValue)                                                               ! Display specific cell
    SELF.CellUpdateRC     (pRowID)                                                                                     ! Display complete row

    SELF.Debug(SELF.Thread() & ' testClassesListClass.RowUpdatedRC ======================================== [ ' & FORMAT(I#,@N03) & ' ]' , FALSE)
    SELF.DumpEditItem()
    SELF.Debug(SELF.Thread() & ' testClassesListClass.RowUpdatedRC ======================================== [ ' & FORMAT(I#,@N03) & ' ]' , FALSE)
  END

  SELF.Debug('EXITS: testClassesListClass.RowUpdatedRC(<39>' & CLIP(pRowID) & '<39>,<39>' & CLIP(pColumnID) & '<39>,<39>' & CLIP(pNewValue) & '<39>)', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.CellUpdateItem               PROCEDURE(STRING pRowID, STRING pColumnID, STRING pNewValue)
ReportControl_Ctrl                                CSTRING(21)
ReportControl_Result                              BYTE
  CODE
  SELF.Debug('ENTER: testClassesListClass.CellUpdateItem(<39>' & CLIP(pRowID) & '<39>,<39>' & CLIP(pColumnID) & '<39>,<39>' & CLIP(pNewValue) & '<39>)', FALSE)

  CASE(pColumnID)
  OF  ('01_ClassNumber')                          ; SELF.EditQ.ClassNumber                        = pNewValue 
  OF  ('02_CourseNumber')                         ; SELF.EditQ.CourseNumber                       = pNewValue 
  OF  ('03_TeacherNumber')                        ; SELF.EditQ.TeacherNumber                      = pNewValue 
  OF  ('04_RoomNumber')                           ; SELF.EditQ.RoomNumber                         = pNewValue 
  OF  ('05_ScheduledTime')                        ; SELF.EditQ.ScheduledTime                      = pNewValue 
  END!CASE

  SELF.Debug('EXITS: testClassesListClass.CellUpdateItem(<39>' & CLIP(pRowID) & '<39>,<39>' & CLIP(pColumnID) & '<39>,<39>' & CLIP(pNewValue) & '<39>)', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.CellUpdateItemRC             PROCEDURE(STRING pRowID, STRING pColumnID, STRING pNewValue)
ReportControl_Ctrl                                CSTRING(21)
ReportControl_Result                              BYTE
  CODE
  SELF.Debug('ENTER: testClassesListClass.CellUpdateItemRC(<39>' & CLIP(pRowID) & '<39>,<39>' & CLIP(pColumnID) & '<39>,<39>' & CLIP(pNewValue) & '<39>)', FALSE)

  CASE(pColumnID)
  OF  ('01_ClassNumber')                          ; SELF.EditRowCellFormat(pRowID,pColumnID,pNewValue,'"%s"','@P##-#####P')     
  OF  ('02_CourseNumber')                         ; SELF.EditRowCellFormat(pRowID,pColumnID,pNewValue,'"%s"','@n4')             
  OF  ('03_TeacherNumber')                        ; SELF.EditRowCellFormat(pRowID,pColumnID,pNewValue,'"%s"','@p###-##-####p')  
  OF  ('04_RoomNumber')                           ; SELF.EditRowCellFormat(pRowID,pColumnID,pNewValue,'"%s"','@n4')             
  OF  ('05_ScheduledTime')                        ; SELF.EditRowCellFormat(pRowID,pColumnID,pNewValue,'"%s"','@s20')            
  END!CASE

  SELF.Debug('EXITS: testClassesListClass.CellUpdateItemRC(<39>' & CLIP(pRowID) & '<39>,<39>' & CLIP(pColumnID) & '<39>,<39>' & CLIP(pNewValue) & '<39>)', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.CellUpdateRC                 PROCEDURE(STRING pRowID)
ReportControl_Ctrl                                CSTRING(21)
ReportControl_Result                              BYTE
  CODE
  SELF.Debug('ENTER: testClassesListClass.CellUpdateRC(<39>' & CLIP(pRowID) & '<39>)', FALSE)

  ReportControl_Result                            = SELF.oRC.SetRowCellValue  ( pRowID, '01_ClassNumber'                        , CLIP(SELF.EditQ.ClassNumber) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellCaption( pRowID, '01_ClassNumber'                        , CLIP(LEFT(FORMAT(SELF.EditQ.ClassNumber,@P##-#####P))) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellValue  ( pRowID, '02_CourseNumber'                       , CLIP(SELF.EditQ.CourseNumber) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellCaption( pRowID, '02_CourseNumber'                       , CLIP(LEFT(FORMAT(SELF.EditQ.CourseNumber,@n4))) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellValue  ( pRowID, '03_TeacherNumber'                      , CLIP(SELF.EditQ.TeacherNumber) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellCaption( pRowID, '03_TeacherNumber'                      , CLIP(LEFT(FORMAT(SELF.EditQ.TeacherNumber,@p###-##-####p))) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellValue  ( pRowID, '04_RoomNumber'                         , CLIP(SELF.EditQ.RoomNumber) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellCaption( pRowID, '04_RoomNumber'                         , CLIP(LEFT(FORMAT(SELF.EditQ.RoomNumber,@n4))) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellValue  ( pRowID, '05_ScheduledTime'                      , CLIP(SELF.EditQ.ScheduledTime) ) 
  ReportControl_Result                            = SELF.oRC.SetRowCellCaption( pRowID, '05_ScheduledTime'                      , CLIP(LEFT(FORMAT(SELF.EditQ.ScheduledTime,@s20))) ) 

  SELF.Debug('EXITS: testClassesListClass.CellUpdateRC(<39>' & CLIP(pRowID) & '<39>)', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.CalcRowItem                  PROCEDURE(STRING pRowID)
  CODE
  SELF.Debug('ENTER: testClassesListClass.CalcRowItem(' & CLIP(pRowID)  & ')', FALSE)
  !---------------------------------------------------------------------------------------------------------!
  ! REMINDER NOTE:                                                                                          !
  ! Every time you change a row cell value, you have to change the value in the underlying table structure. !
  ! If you have row calculations, you will have to calculate and display the new values at the row level.   !
  !---------------------------------------------------------------------------------------------------------!
  SELF.Debug('EXITS: testClassesListClass.CalcRowItem(' & CLIP(pRowID)  & ')', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.CalcRowEdit                  PROCEDURE()
  CODE
  SELF.Debug('ENTER: testClassesListClass.CalcRowEdit()', FALSE)
  LOOP I# = 1  TO RECORDS(SELF.EditQ)
    GET(SELF.EditQ, I#)
    SELF.CalcRowItem(CLIP(SELF.EditQ.guid))
  END!LOOP
  SELF.Debug('EXITS: testClassesListClass.CalcRowEdit()', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.EditRowCellFormat            PROCEDURE(STRING pRowID, STRING pColumnID, STRING pNewValue, STRING pFormatOCX, STRING pFormatCaption, BYTE pOption)
FormatClarion                                     CSTRING(21)
  CODE
  FormatClarion                                   = CLIP(LEFT(FORMAT(pNewValue,pFormatCaption)))                               
  SELF.Debug('EDITS: testClassesListClass.EditRowCellFormat(''' & CLIP(pRowID) & ''',''' & CLIP(pColumnID) & ''',''' & CLIP(pNewValue)& ''',''' & CLIP(pFormatOCX) & ''',''' & CLIP(pFormatCaption) & ''', [ ' & pOption & ' ]):: EDITS="' & FormatClarion & '"', FALSE)

                  SELF.oRC.SetRowCellFormat (CLIP(pRowID), CLIP(pColumnID), CLIP(pFormatOCX)) 
                  SELF.oRC.SetRowCellValue  (CLIP(pRowID), CLIP(pColumnID), CLIP(pNewValue))                 
  CASE(pOption)
  OF   0        ; SELF.oRC.SetRowCellValue  (CLIP(pRowID), CLIP(pColumnID), FormatClarion) 
  OF   1        ; SELF.oRC.SetRowCellCaption(CLIP(pRowID), CLIP(pColumnID), CLIP(LEFT(FORMAT(pNewValue,pFormatCaption))))
  END

  SELF.Debug('EDITS: testClassesListClass.EditRowCellFormat(...):: SELF.oRC.GetRowCellValue(): EDITS=''' & CLIP(SELF.oRC.GetRowCellValue(CLIP(pRowID),CLIP(pColumnID))) & '''', FALSE)
  SELF.Debug('EDITS: testClassesListClass.EditRowCellFormat(...):: SELF.oRC.GetRowCellCaption(): EDITS=''' & CLIP(SELF.oRC.GetRowCellCaption(CLIP(pRowID),CLIP(pColumnID))) & '''', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.Thread                       PROCEDURE()
  CODE
  RETURN '![T' & SELF.lThread & ']:CLASS'
    
!---------------------------------------------------------------------------------
testClassesListClass.Construct                    PROCEDURE()
  CODE
  SELF.bDebug                                      = TRUE
  SELF.lThread                                     = THREAD()
  SELF.oOwnerString                               &= NEW(StringTheory)

  SELF.EditFEQ                                     = 0
  SELF.EditStyle                                   = 0
  SELF.ListQ                                      &= NEW(qtCLAlist)
  FREE(SELF.ListQ)
  SELF.EditQ                                      &= NEW(qtCLAedit)
  FREE(SELF.EditQ)
  SELF.oBase                                      &= NULL
  SELF.oBase                                      &= NEW(testClassesBaseClass)

  SELF.oRC                                        &= NULL
  SELF.bAllowFocusChange                           = TRUE
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.Destruct                     PROCEDURE()
  CODE
  DISPOSE(SELF.oOwnerString)
  SELF.oOwnerString                               &= NULL
  SELF.EditFEQ                                     = 0
  SELF.EditStyle                                   = 0
  FREE(SELF.ListQ)
  DISPOSE(SELF.ListQ)
  SELF.ListQ                                      &= NULL
  FREE(SELF.EditQ)
  DISPOSE(SELF.EditQ)
  SELF.EditQ                                      &= NULL
  DISPOSE(SELF.oBase)
  SELF.oBase                                      &= NULL

  SELF.oRC                                        &= NULL
  SELF.bAllowFocusChange                           = TRUE
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.Init                         PROCEDURE(STRING pOwnerString)
  CODE
  SELF.oOwnerString.SetValue(pOwnerString)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.DoDebug                      PROCEDURE(BYTE pDebugOnOff)
  CODE
  SELF.bDebug = pDebugOnOff
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.Debug                        PROCEDURE(STRING pMSG, BOOL pShow)
szMSG  &CSTRING
  CODE
  IF pShow = TRUE THEN
    MESSAGE(pMSG, 'CLASS: testClassesListClass.Debug')
  END
  IF ~SELF.bDebug THEN RETURN END
  szMSG &= NEW CSTRING( SIZE(pMSG) + 3 )   ! 3 = LEN(<13,10,0>)
  szMSG  =                   pMSG & '<13,10><0>'
  _ODS_(szMSG)
  DISPOSE(szMSG)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.DumpEditItem                 PROCEDURE()
  CODE
  IF ~SELF.bDebug THEN RETURN END
  SELF.Debug(SELF.Thread() & ' testClassesListClass.DumpEditItem([01] ClassNumber=<39>' & CLIP(SELF.EditQ.ClassNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesListClass.DumpEditItem([02] CourseNumber=<39>' & CLIP(SELF.EditQ.CourseNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesListClass.DumpEditItem([03] TeacherNumber=<39>' & CLIP(SELF.EditQ.TeacherNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesListClass.DumpEditItem([04] RoomNumber=<39>' & CLIP(SELF.EditQ.RoomNumber) & '<39>)')
  SELF.Debug(SELF.Thread() & ' testClassesListClass.DumpEditItem([05] ScheduledTime=<39>' & CLIP(SELF.EditQ.ScheduledTime) & '<39>)')
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.DumpEditList                 PROCEDURE()
  CODE
  IF ~SELF.bDebug THEN RETURN END
  LOOP I# = 1 TO RECORDS(SELF.EditQ)
    SELF.Debug(SELF.Thread() & ' testClassesListClass.DumpEditList ======================================== [ ' & FORMAT(I#,@N03) & ' ]' , FALSE)
    SELF.DumpEditItem()
    SELF.Debug(SELF.Thread() & ' testClassesListClass.DumpEditList ======================================== [ ' & FORMAT(I#,@N03) & ' ]' , FALSE)
  END!LOOP
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.SetBaseClass                 PROCEDURE(testClassesBaseClass pBaseClass)
  CODE
  IF (SELF.oBase &= NULL) THEN
    SELF.oBase                                    &= pBaseClass
    SELF.Debug('SELF.oBase=[ ' & ADDRESS(SELF.oBase) & ' ]: pBaseClass=[ ' & ADDRESS(pBaseClass) & ' ]', FALSE)
  ELSE
    SELF.Debug('testClassesListClass.SetBaseClass(): SELF.oBase=[ ' & ADDRESS(SELF.oBase) & ' ] already initialized.', TRUE)
  END
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.SetEditFEQ                   PROCEDURE(LONG pEditFEQ)
  CODE
  SELF.EditFEQ                                    = pEditFEQ
  SELF.Debug('SELF.EditFEQ=[ ' & SELF.EditFEQ & ' ]: pEditFEQ=[ ' & pEditFEQ & ' ]', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.SetEditStyle                 PROCEDURE(LONG pEditStyle)
  CODE
  SELF.EditStyle                                  = pEditStyle
  SELF.Debug('SELF.EditStyle=[ ' & SELF.EditStyle & ' ]: pEditStyle=[ ' & pEditStyle & ' ]', FALSE)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.Clears                       PROCEDURE()
  CODE
  SELF.Debug(SELF.Thread() & ' ENTER: testClassesListClass.Clears()')
 IF (TRUE)
  ! This has to be put in the NYS side 
  SELF.ClearsRowsRC()
 END
  FREE(SELF.EditQ)
  SELF.Debug(SELF.Thread() & ' EXITS: testClassesListClass.Clears()')
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.Loads                        PROCEDURE()!,LONG,PROC
Result                                            LONG(TRUE)
HaveError                                         LONG(0)
SQLFile                                           &DynFile
TheFile                                           &File
lQuery                                            StringTheory
  CODE
  SELF.Debug(SELF.Thread() & ' testClassesListClass.Loads()')

  ! IMPORTANT  Replace '*' below with just the fields you need. Recall joining tables for efficiency.
  ! REMINDERS: Avoid moving lots of data around specially if you are using a remote data source.
  !            AFTER TESTING: Make sure you comment out the !SETCLIPBOARD(...)
  !            AFTER TESTING: Set the SELF.Debug('...',TRUE) to SELF.Debug('...',FALSE)
  !
  ! NOTE:      Found 5 fields [FROM: 'CLASSES.TPS']
  ! lQuery.SetValue('SELECT') 
  ! lQuery.Append  (' Classes.ClassNumber, Classes.CourseNumber, Classes.TeacherNumber, Classes.RoomNumber, Classes.ScheduledTime')
  ! lQuery.Append  (' FROM CLASSES.TPS')
  ! lQuery.Append  (' WHERE guid = <39>' & CLIP(pEditStyle) & '<39>')
  !
  !lQuery.SetValue('SELECT Classes.* FROM CLASSES.TPS WHERE guid = <39>' & CLIP(pEditStyle) & '<39>')
  lQuery.SetValue('SELECT Classes.* FROM CLASSES.TPS')
  !SETCLIPBOARD(lQuery.GetValue())
  SELF.Debug(SELF.Thread() & ':lQuery=( "' & lQuery.GetValue() & '" )' , FALSE)

  SQLFile &= NEW(DynFile)
  SQLFile.SetDriver('ODBC')
  SQLFile.SetOwner(SELF.oOwnerString.GetValue())

  HaveError = SQLFile.CreateFromSQL(lQuery.GetValue())
  IF HaveError THEN
    SELF.Debug(SELF.Thread() & ':ERROR testClassesListClass.Loads HaveError(' & HaveError & ') [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , TRUE)
    IF HaveError = FileSystemErr THEN                                                                                  ! 90: File System Error
      SELF.Debug(SELF.Thread() & ':ERROR testClassesListClass.Loads [ ' & FILEERRORCODE() & ' ]: ' & FILEERROR() & '' , TRUE)
    END
  ELSE
    TheFile &= SQLFile.GetFileRef()
    LOOP 
      NEXT(TheFile)
      IF ERRORCODE() = BadRecErr THEN                                                                                  ! 33: Record Not Available
        BREAK
      ELSIF ERRORCODE() > 0 THEN 
        SELF.Debug(SELF.Thread() & ':ERROR testClassesListClass.Loads [ ' & ERRORCODE() & ' ]: ' & ERROR() & '' , TRUE)
        BREAK
      ELSE
        CLEAR(SELF.EditQ)
        SELF.EditQ.ClassNumber                            = SQLFile.GetField('ClassNumber')
        SELF.EditQ.CourseNumber                           = SQLFile.GetField('CourseNumber')
        SELF.EditQ.TeacherNumber                          = SQLFile.GetField('TeacherNumber')
        SELF.EditQ.RoomNumber                             = SQLFile.GetField('RoomNumber')
        SELF.EditQ.ScheduledTime                          = SQLFile.GetField('ScheduledTime')
        ADD(SELF.EditQ)
        IF (TRUE) THEN
          SELF.Debug(SELF.Thread() & ':LOADS testClassesListClass.Loads ======================================== [ ' & FORMAT(RECORDS(SELF.EditQ),@N03) & ' ]' , FALSE)
          SELF.DumpEditItem()
          SELF.Debug(SELF.Thread() & ':LOADS testClassesListClass.Loads ======================================== [ ' & FORMAT(RECORDS(SELF.EditQ),@N03) & ' ]' , FALSE)
        END
      END!ELSE
    END!LOOP
    ! How many records read into the queue.
    SELF.Debug(SELF.Thread() & ':LOADS testClassesListClass.Loads [ ' & RECORDS(SELF.EditQ) & ' ]: Total Records' , FALSE)
    SELF.Debug(SELF.Thread() & ':LOADS testClassesListClass.Loads [ ' & RECORDS(SELF.EditQ) & ' ]: Total Records' , TRUE)
  END! IF HaveError
  DISPOSE(SQLFile)
  RETURN Result

!---------------------------------------------------------------------------------
testClassesListClass.Saves                        PROCEDURE()!,LONG,PROC
Result                                            LONG(TRUE)
  CODE
  SELF.Debug(SELF.Thread() & ' ENTER: testClassesListClass.Saves()')

  SELF.Debug(SELF.Thread() & ' EXITS: testClassesListClass.Saves()')
  RETURN Result

!---------------------------------------------------------------------------------
testClassesListClass.BaseToEdit                   PROCEDURE()
  CODE
  SELF.Debug(SELF.Thread() & ' ENTER: testClassesListClass.BaseToEdit()')
  SELF.EditQ :=: SELF.oBase.gCLArec
  SELF.Debug(SELF.Thread() & ' EXITS: testClassesListClass.BaseToEdit()')
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.EditToBase                   PROCEDURE()
  CODE
  SELF.Debug(SELF.Thread() & ' ENTER: testClassesListClass.EditToBase()')
  SELF.oBase.gCLArec :=: SELF.EditQ
  SELF.Debug(SELF.Thread() & ' EXITS: testClassesListClass.EditToBase()')
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.EditToList                   PROCEDURE()
  CODE
  SELF.Debug(SELF.Thread() & ' ENTER: testClassesListClass.EditToList()')
  CLEAR(SELF.ListQ)
  LOOP I# = 1 TO RECORDS(SELF.EditQ)
    GET(SELF.EditQ, I#)
    SELF.ListQ :=: SELF.EditQ
    ADD(SELF.ListQ)
  END!LOOP
  SELF.Debug(SELF.Thread() & ' EXITS: testClassesListClass.EditToList()')
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.ListToEdit                   PROCEDURE()
  CODE
  SELF.Debug(SELF.Thread() & ' ENTER: testClassesListClass.ListToEdit()')
  CLEAR(SELF.EditQ)
  LOOP I# = 1 TO RECORDS(SELF.ListQ)
    GET(SELF.ListQ, I#)
    SELF.EditQ :=: SELF.ListQ
    ADD(SELF.EditQ)
  END!LOOP
  SELF.Debug(SELF.Thread() & ' EXITS: testClassesListClass.ListToEdit()')
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.LoadEditItem                 PROCEDURE(*gtCLAedit pEdit)
  CODE
  CLEAR(SELF.EditQ)
  SELF.EditQ.ClassNumber                          = pEdit.ClassNumber
  SELF.EditQ.CourseNumber                         = pEdit.CourseNumber
  SELF.EditQ.TeacherNumber                        = pEdit.TeacherNumber
  SELF.EditQ.RoomNumber                           = pEdit.RoomNumber
  SELF.EditQ.ScheduledTime                        = pEdit.ScheduledTime
  !
  SELF.EditQ.ClassNumber_style                    = pEdit.ClassNumber_style
  SELF.EditQ.CourseNumber_style                   = pEdit.CourseNumber_style
  SELF.EditQ.TeacherNumber_style                  = pEdit.TeacherNumber_style
  SELF.EditQ.RoomNumber_style                     = pEdit.RoomNumber_style
  SELF.EditQ.ScheduledTime_style                  = pEdit.ScheduledTime_style
  ADD(SELF.EditQ)
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.LoadEditItemStyle            PROCEDURE(*gtCLAedit pEdit, LONG pEditStyle)
  CODE
  pEdit.ClassNumber_style                         = pEditStyle
  pEdit.CourseNumber_style                        = pEditStyle
  pEdit.TeacherNumber_style                       = pEditStyle
  pEdit.RoomNumber_style                          = pEditStyle
  pEdit.ScheduledTime_style                       = pEditStyle
  RETURN

!---------------------------------------------------------------------------------
testClassesListClass.SetEditFormat                PROCEDURE(LONG pEditFEQ)
FormatCLA                                         StringTheory
  CODE
  FormatCLA.SetValue('')
  FormatCLA.Append  ('56R(1)|MY~Class Number~@P##-#####P@#1#')                                                         ! ,NAME('ClassNumber | LONG | @P##-#####P | PROMPT(''Class Number:'')')
  FormatCLA.Append  ('60R(1)|MY~Course Number~@n4@#3#')                                                                ! ,NAME('CourseNumber | LONG | @N4 | PROMPT(''Course Number:'')')
  FormatCLA.Append  ('64R(1)|MY~Teacher Number~@p###-##-####p@#5#')                                                    ! ,NAME('TeacherNumber | LONG | @P###-##-####P | PROMPT(''Teacher Number:'')')
  FormatCLA.Append  ('52L(0)|MY~Room Number~@n4@#7#')                                                                  ! ,NAME('RoomNumber | LONG | @N4 | PROMPT(''Room Number:'')')
  FormatCLA.Append  ('80L(0)|MY~Scheduled Time~@s20@#9#')                                                              ! ,NAME('ScheduledTime | STRING(20) | @S20 | PROMPT(''Scheduled Time:'')')
  pEditFEQ{PROP:Format} = FormatCLA.GetValue()
  RETURN

! LIST,AT(4,40,400,40),USE(?CLA_EditQ),HVSCROLL, |
!   FORMAT('56R(1)|MY~Class Number~@P##-#####P@#1#' & |
!   '60R(1)|MY~Course Number~@n4@#3#' & |
!   '64R(1)|MY~Teacher Number~@p###-##-####p@#5#' & |
!   '52L(0)|MY~Room Number~@n4@#7#' & |
!   '80L(0)|MY~Scheduled Time~@s20@#9#'),FROM(CLA_oListClass.EditQ), |
!   #FIELDS(CLA_oListClass.EditQ.ClassNumber, |
!   CLA_oListClass.EditQ.CourseNumber, |
!   CLA_oListClass.EditQ.TeacherNumber, |
!   CLA_oListClass.EditQ.RoomNumber, |
!   CLA_oListClass.EditQ.ScheduledTime)

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
