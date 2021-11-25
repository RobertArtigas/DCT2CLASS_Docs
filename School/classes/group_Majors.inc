!BOF
!
! File:         .\classes\group_Majors.inc
! Date-Time:    2021/11/24 - 06:46:40AM
! Purpose:      Generated File Records as Groups
! Author:       GenerateGroups Template
! Narative:     This template is used to pass records structures
!               back and forth between DLL's when the files
!               are not shared. Since file definitions are not
!               available, data has to be passed in areas.
!
!Region
! Name:         Majors
! Prefix:       MAJ
! Filename:     'MAJORS.TPS'
!EndRegion
!
!-Keys-
!
!Region
! KeyNumber                               Number(ASCENDING)
! KeyDescription                          Description(ASCENDING)
!EndRegion
!
!-Keys-
!
!Region
MAJ_tKey_KeyNumber                        GROUP,TYPE,BINDABLE,PRE(kMAJ_Key01)
Number                                      LONG,NAME('Number | LONG | @N4 | [0001-0004] | PROMPT(''Number:'') | COLUMN(''Number'')')                                              ! [0001-0004] 
                                          END 
MAJ_tKey_KeyDescription                   GROUP,TYPE,BINDABLE,PRE(kMAJ_Key02)
Description                                 STRING(20),NAME('Description | STRING(20) | @S20 | [0001-0020] | PROMPT(''Description:'') | COLUMN(''Description'')')                  ! [0001-0020] 
                                          END 
!EndRegion
!
!-Record-
!
!Region
MAJ_tRec                                  GROUP,TYPE,BINDABLE,PRE(rMAJ)
Number                                      LONG,NAME('Number | LONG | @N4 | [0001-0004] | PROMPT(''Number:'') | COLUMN(''Number'')')                                              ! [0001-0004] 
Description                                 STRING(20),NAME('Description | STRING(20) | @S20 | [0005-0024] | PROMPT(''Description:'') | COLUMN(''Description'')')                  ! [0005-0024] 
                                          END
!EndRegion
!
!-Queue-
!
!Region
MAJ_qRec                                  QUEUE(MAJ_tRec),TYPE,BINDABLE,PRE(qMAJ)
                                          END
!EndRegion
!
!-Equates-
!
!Region
C_MAJ_NUMBER                                EQUATE(1)
C_MAJ_DESCRIPTION                           EQUATE(2)
!EndRegion
!
!EOF
