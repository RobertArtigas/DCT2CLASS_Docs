!BOF
!
!Region Generate
!
! Dictionary:   C:\_GIT_\RobertArtigas\DCT2CLASS_Docs\School\SCHOOL.DCT
! File:         .\classes\grprec_Enrollment.inc
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
! Name:         Enrollment
! Prefix:       ENR
! Filename:     'ENROLLMENT.TPS'
!EndRegion
!Region KeyDocs
!
!-Keys Docs-
!
! StuSeq                                  StudentNumber(ASCENDING)
!                                         ClassNumber(ASCENDING)
! SeqStu                                  ClassNumber(ASCENDING)
!                                         StudentNumber(ASCENDING)
!EndRegion
!Region KeyDefinitions
!
!-Keys-
!
ENR_tKey_StuSeq                           GROUP,TYPE,BINDABLE,PRE(kENR_Key01)
StudentNumber                               LONG,NAME('StudentNumber|LONG|@P###-##-####P|ATTRIBUTE')                                                                               ! [0001-0004] 
ClassNumber                                 LONG,NAME('ClassNumber|LONG|@P##-#####P|ATTRIBUTE')                                                                                    ! [0005-0008] 
                                          END 
ENR_tKey_SeqStu                           GROUP,TYPE,BINDABLE,PRE(kENR_Key02)
ClassNumber                                 LONG,NAME('ClassNumber|LONG|@P##-#####P|ATTRIBUTE')                                                                                    ! [0001-0004] 
StudentNumber                               LONG,NAME('StudentNumber|LONG|@P###-##-####P|ATTRIBUTE')                                                                               ! [0005-0008] 
                                          END 
!EndRegion
!Region RecordDefinition
!
!-Record-
!
ENR_tRec                                  GROUP,TYPE,BINDABLE,PRE(rENR)
StudentNumber                               LONG,NAME('StudentNumber|LONG|@P###-##-####P|ATTRIBUTE')                                                                               ! [0001-0004] 
ClassNumber                                 LONG,NAME('ClassNumber|LONG|@P##-#####P|ATTRIBUTE')                                                                                    ! [0005-0008] 
MidtermExam                                 SHORT,NAME('MidtermExam|SHORT|@N3|ATTRIBUTE')                                                                                          ! [0009-0010] 
FinalExam                                   SHORT,NAME('FinalExam|SHORT|@N3|ATTRIBUTE')                                                                                            ! [0011-0012] 
TermPaper                                   SHORT,NAME('TermPaper|SHORT|@N3|ATTRIBUTE')                                                                                            ! [0013-0014] 
                                          END
!EndRegion
!Region QueueDefinition
!
!-Queue-
!
ENR_qRec                                  QUEUE(ENR_tRec),TYPE,BINDABLE,PRE(qENR)
                                          END
!EndRegion
!Region FieldEquates
!
!-Equates-
!
C_ENR_STUDENTNUMBER                         EQUATE(1)
C_ENR_CLASSNUMBER                           EQUATE(2)
C_ENR_MIDTERMEXAM                           EQUATE(3)
C_ENR_FINALEXAM                             EQUATE(4)
C_ENR_TERMPAPER                             EQUATE(5)
!
!EndRegion
!Region Class_YES
!-------------------------------------------------------------------------------------------------!
! Control:      ?ENR_ListQ                                                                        !
! Object Name:  ENR_oListClass                                                                    !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?ENR_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '40L(2)|M~Student#~@p###-##-####p@#1#' & |
!   '32L(2)|M~Class#~@p##-#####p@#2#' & |
!   '56L(2)|M~Midterm Exam~@n3@#3#' & |
!   '48L(2)|M~Final Exam~@n3@#4#' & |
!   '48L(2)|M~Term Paper~@n3@#5#' & |
!   ''), |
!   FROM(ENR_oListClass.ListQ), |
!   #FIELDS(ENR_oListClass.ListQ.StudentNumber, |
!   ENR_oListClass.ListQ.ClassNumber, |
!   ENR_oListClass.ListQ.MidtermExam, |
!   ENR_oListClass.ListQ.FinalExam, |
!   ENR_oListClass.ListQ.TermPaper)
!
!EndRegion
!Region Class_NO
!-------------------------------------------------------------------------------------------------!
! Control:      ?ENR_ListQ                                                                        !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?ENR_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '40L(2)|M~Student#~@p###-##-####p@#1#' & |
!   '32L(2)|M~Class#~@p##-#####p@#2#' & |
!   '56L(2)|M~Midterm Exam~@n3@#3#' & |
!   '48L(2)|M~Final Exam~@n3@#4#' & |
!   '48L(2)|M~Term Paper~@n3@#5#' & |
!   ''), |
!   FROM(ListQ), |
!   #FIELDS(ListQ.StudentNumber, |
!   ListQ.ClassNumber, |
!   ListQ.MidtermExam, |
!   ListQ.FinalExam, |
!   ListQ.TermPaper)
!
!EndRegion
!
!EOF