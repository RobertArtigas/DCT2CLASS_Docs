!BOF
!
!Region Generate
!
! Dictionary:   C:\_GIT_\RobertArtigas\DCT2CLASS_Docs\School\SCHOOL.DCT
! File:         .\classes\grprec_Majors.inc
! Date-Time:    2022/11/05 - 12:04:56PM
! Purpose:      Generated File Records as Groups
! Author:       GenerateGroups Template
! Narative:     This template is used to pass records structures
!               back and forth between DLL's when the files
!               are not shared. Since file definitions are not
!               available, data has to be passed in areas.
!
!EndRegion
!Region Header
! Name:         Majors
! Prefix:       MAJ
! Filename:     'MAJORS.TPS'
!EndRegion
!Region KeyDocs
!
!-Keys Docs-
!
! KeyNumber                               Number(ASCENDING)
! KeyDescription                          Description(ASCENDING)
!EndRegion
!Region KeyDefinitions
!
!-Keys-
!
MAJ_tKey_KeyNumber                        GROUP,TYPE,BINDABLE,PRE(kMAJ_Key01)
Number                                      LONG,NAME('Number|LONG|@N4|ATTRIBUTE')                                                                                                 ! [0001-0004] 
                                          END 
MAJ_tKey_KeyDescription                   GROUP,TYPE,BINDABLE,PRE(kMAJ_Key02)
Description                                 STRING(20),NAME('Description|STRING(20)|@S20|ATTRIBUTE')                                                                               ! [0001-0020] 
                                          END 
!EndRegion
!Region RecordDefinition
!
!-Record-
!
MAJ_tRec                                  GROUP,TYPE,BINDABLE,PRE(rMAJ)
Number                                      LONG,NAME('Number|LONG|@N4|ATTRIBUTE')                                                                                                 ! [0001-0004] 
Description                                 STRING(20),NAME('Description|STRING(20)|@S20|ATTRIBUTE')                                                                               ! [0005-0024] 
                                          END
!EndRegion
!Region QueueDefinition
!
!-Queue-
!
MAJ_qRec                                  QUEUE(MAJ_tRec),TYPE,BINDABLE,PRE(qMAJ)
                                          END
!EndRegion
!Region FieldEquates
!
!-Equates-
!
C_MAJ_NUMBER                                EQUATE(1)
C_MAJ_DESCRIPTION                           EQUATE(2)
!
!EndRegion
!Region Class_YES
!-------------------------------------------------------------------------------------------------!
! Control:      ?MAJ_ListQ                                                                        !
! Object Name:  MAJ_oListClass                                                                    !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?MAJ_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '32L(2)|M~Number~@n4@#1#' & |
!   '80L(2)|M~Description~@S20@#2#' & |
!   ''), |
!   FROM(MAJ_oListClass.ListQ), |
!   #FIELDS(MAJ_oListClass.ListQ.Number, |
!   MAJ_oListClass.ListQ.Description)
!
!EndRegion
!Region Class_NO
!-------------------------------------------------------------------------------------------------!
! Control:      ?MAJ_ListQ                                                                        !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?MAJ_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '32L(2)|M~Number~@n4@#1#' & |
!   '80L(2)|M~Description~@S20@#2#' & |
!   ''), |
!   FROM(ListQ), |
!   #FIELDS(ListQ.Number, |
!   ListQ.Description)
!
!EndRegion
!
!EOF