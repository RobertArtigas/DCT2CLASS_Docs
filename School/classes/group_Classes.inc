!BOF
!
! File:         .\classes\group_Classes.inc
! Date-Time:    2021/11/24 - 06:46:40AM
! Purpose:      Generated File Records as Groups
! Author:       GenerateGroups Template
! Narative:     This template is used to pass records structures
!               back and forth between DLL's when the files
!               are not shared. Since file definitions are not
!               available, data has to be passed in areas.
!
!Region
! Name:         Classes
! Prefix:       CLA
! Description:  Classes offered.
! Filename:     'CLASSES.TPS'
!EndRegion
!
!-Keys-
!
!Region
! KeyClassNumber                          ClassNumber(ASCENDING)
! KeyCourseNumber                         CourseNumber(ASCENDING)
!                                         ClassNumber(ASCENDING)
! KeyTeacherNumber                        TeacherNumber(ASCENDING)
!EndRegion
!
!-Keys-
!
!Region
CLA_tKey_KeyClassNumber                   GROUP,TYPE,BINDABLE,PRE(kCLA_Key01)
ClassNumber                                 LONG,NAME('ClassNumber | LONG | @P##-#####P | [0001-0004] | PROMPT(''Class Number:'') | COLUMN(''Class #'')')                          ! [0001-0004] 
                                          END 
CLA_tKey_KeyCourseNumber                  GROUP,TYPE,BINDABLE,PRE(kCLA_Key02)
CourseNumber                                LONG,NAME('CourseNumber | LONG | @N4 | [0001-0004] | PROMPT(''Course Number:'') | COLUMN(''Course #'')')                               ! [0001-0004] 
ClassNumber                                 LONG,NAME('ClassNumber | LONG | @P##-#####P | [0005-0008] | PROMPT(''Class Number:'') | COLUMN(''Class #'')')                          ! [0005-0008] 
                                          END 
CLA_tKey_KeyTeacherNumber                 GROUP,TYPE,BINDABLE,PRE(kCLA_Key03)
TeacherNumber                               LONG,NAME('TeacherNumber | LONG | @P###-##-####P | [0001-0004] | PROMPT(''Teacher Number:'') | COLUMN(''Teacher #'')')                 ! [0001-0004] 
                                          END 
!EndRegion
!
!-Record-
!
!Region
CLA_tRec                                  GROUP,TYPE,BINDABLE,PRE(rCLA)
ClassNumber                                 LONG,NAME('ClassNumber | LONG | @P##-#####P | [0001-0004] | PROMPT(''Class Number:'') | COLUMN(''Class #'')')                          ! [0001-0004] 
CourseNumber                                LONG,NAME('CourseNumber | LONG | @N4 | [0005-0008] | PROMPT(''Course Number:'') | COLUMN(''Course #'')')                               ! [0005-0008] 
TeacherNumber                               LONG,NAME('TeacherNumber | LONG | @P###-##-####P | [0009-0012] | PROMPT(''Teacher Number:'') | COLUMN(''Teacher #'')')                 ! [0009-0012] 
RoomNumber                                  LONG,NAME('RoomNumber | LONG | @N4 | [0013-0016] | PROMPT(''Room Number:'') | COLUMN(''Room #'')')                                     ! [0013-0016] 
ScheduledTime                               STRING(20),NAME('ScheduledTime | STRING(20) | @S20 | [0017-0036] | PROMPT(''Scheduled Time:'') | COLUMN(''Scheduled Time'')')          ! [0017-0036] 
                                          END
!EndRegion
!
!-Queue-
!
!Region
CLA_qRec                                  QUEUE(CLA_tRec),TYPE,BINDABLE,PRE(qCLA)
                                          END
!EndRegion
!
!-Equates-
!
!Region
C_CLA_CLASSNUMBER                           EQUATE(1)
C_CLA_COURSENUMBER                          EQUATE(2)
C_CLA_TEACHERNUMBER                         EQUATE(3)
C_CLA_ROOMNUMBER                            EQUATE(4)
C_CLA_SCHEDULEDTIME                         EQUATE(5)
!EndRegion
!
!EOF
