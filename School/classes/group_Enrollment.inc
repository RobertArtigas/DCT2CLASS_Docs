!BOF
!
! File:         .\classes\group_Enrollment.inc
! Date-Time:    2021/11/24 - 06:46:40AM
! Purpose:      Generated File Records as Groups
! Author:       GenerateGroups Template
! Narative:     This template is used to pass records structures
!               back and forth between DLL's when the files
!               are not shared. Since file definitions are not
!               available, data has to be passed in areas.
!
!Region
! Name:         Enrollment
! Prefix:       ENR
! Filename:     'ENROLLMENT.TPS'
!EndRegion
!
!-Keys-
!
!Region
! StuSeq                                  StudentNumber(ASCENDING)
!                                         ClassNumber(ASCENDING)
! SeqStu                                  ClassNumber(ASCENDING)
!                                         StudentNumber(ASCENDING)
!EndRegion
!
!-Keys-
!
!Region
ENR_tKey_StuSeq                           GROUP,TYPE,BINDABLE,PRE(kENR_Key01)
StudentNumber                               LONG,NAME('StudentNumber | LONG | @P###-##-####P | [0001-0004] | PROMPT(''Student Number:'') | COLUMN(''Student#'')')                  ! [0001-0004] 
ClassNumber                                 LONG,NAME('ClassNumber | LONG | @P##-#####P | [0005-0008] | PROMPT(''Class Number'') | COLUMN(''Class#'')')                            ! [0005-0008] 
                                          END 
ENR_tKey_SeqStu                           GROUP,TYPE,BINDABLE,PRE(kENR_Key02)
ClassNumber                                 LONG,NAME('ClassNumber | LONG | @P##-#####P | [0001-0004] | PROMPT(''Class Number'') | COLUMN(''Class#'')')                            ! [0001-0004] 
StudentNumber                               LONG,NAME('StudentNumber | LONG | @P###-##-####P | [0005-0008] | PROMPT(''Student Number:'') | COLUMN(''Student#'')')                  ! [0005-0008] 
                                          END 
!EndRegion
!
!-Record-
!
!Region
ENR_tRec                                  GROUP,TYPE,BINDABLE,PRE(rENR)
StudentNumber                               LONG,NAME('StudentNumber | LONG | @P###-##-####P | [0001-0004] | PROMPT(''Student Number:'') | COLUMN(''Student#'')')                  ! [0001-0004] 
ClassNumber                                 LONG,NAME('ClassNumber | LONG | @P##-#####P | [0005-0008] | PROMPT(''Class Number'') | COLUMN(''Class#'')')                            ! [0005-0008] 
MidtermExam                                 SHORT,NAME('MidtermExam | SHORT | @N3 | [0009-0010] | PROMPT(''Midterm Exam:'') | COLUMN(''Midterm Exam'')')                           ! [0009-0010] 
FinalExam                                   SHORT,NAME('FinalExam | SHORT | @N3 | [0011-0012] | PROMPT(''Final Exam:'') | COLUMN(''Final Exam'')')                                 ! [0011-0012] 
TermPaper                                   SHORT,NAME('TermPaper | SHORT | @N3 | [0013-0014] | PROMPT(''Term Paper:'') | COLUMN(''Term Paper'')')                                 ! [0013-0014] 
                                          END
!EndRegion
!
!-Queue-
!
!Region
ENR_qRec                                  QUEUE(ENR_tRec),TYPE,BINDABLE,PRE(qENR)
                                          END
!EndRegion
!
!-Equates-
!
!Region
C_ENR_STUDENTNUMBER                         EQUATE(1)
C_ENR_CLASSNUMBER                           EQUATE(2)
C_ENR_MIDTERMEXAM                           EQUATE(3)
C_ENR_FINALEXAM                             EQUATE(4)
C_ENR_TERMPAPER                             EQUATE(5)
!EndRegion
!
!EOF
