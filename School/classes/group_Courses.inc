!BOF
!
! File:         .\classes\group_Courses.inc
! Date-Time:    2021/11/24 - 06:46:40AM
! Purpose:      Generated File Records as Groups
! Author:       GenerateGroups Template
! Narative:     This template is used to pass records structures
!               back and forth between DLL's when the files
!               are not shared. Since file definitions are not
!               available, data has to be passed in areas.
!
!Region
! Name:         Courses
! Prefix:       COU
! Filename:     'COURSES.TPS'
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
COU_tKey_KeyNumber                        GROUP,TYPE,BINDABLE,PRE(kCOU_Key01)
Number                                      LONG,NAME('Number | LONG | @N4 | [0001-0004] | PROMPT(''Number:'') | COLUMN(''Number'')')                                              ! [0001-0004] 
                                          END 
COU_tKey_KeyDescription                   GROUP,TYPE,BINDABLE,PRE(kCOU_Key02)
Description                                 STRING(40),NAME('Description | STRING(40) | @S30 | [0001-0040] | PROMPT(''Description:'') | COLUMN(''Description'')')                  ! [0001-0040] 
                                          END 
!EndRegion
!
!-Record-
!
!Region
COU_tRec                                  GROUP,TYPE,BINDABLE,PRE(rCOU)
Number                                      LONG,NAME('Number | LONG | @N4 | [0001-0004] | PROMPT(''Number:'') | COLUMN(''Number'')')                                              ! [0001-0004] 
Description                                 STRING(40),NAME('Description | STRING(40) | @S30 | [0005-0044] | PROMPT(''Description:'') | COLUMN(''Description'')')                  ! [0005-0044] 
                                          END
!EndRegion
!
!-Queue-
!
!Region
COU_qRec                                  QUEUE(COU_tRec),TYPE,BINDABLE,PRE(qCOU)
                                          END
!EndRegion
!
!-Equates-
!
!Region
C_COU_NUMBER                                EQUATE(1)
C_COU_DESCRIPTION                           EQUATE(2)
!EndRegion
!
!EOF
