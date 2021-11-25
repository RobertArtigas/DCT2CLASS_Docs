!BOF
!
! File:         .\classes\group_Students.inc
! Date-Time:    2021/11/24 - 06:46:40AM
! Purpose:      Generated File Records as Groups
! Author:       GenerateGroups Template
! Narative:     This template is used to pass records structures
!               back and forth between DLL's when the files
!               are not shared. Since file definitions are not
!               available, data has to be passed in areas.
!
!Region
! Name:         Students
! Prefix:       STU
! Filename:     'STUDENTS.TPS'
!EndRegion
!
!-Keys-
!
!Region
! KeyStudentNumber                        Number(ASCENDING)
! MajorKey                                Major(ASCENDING)
!                                         LastName(ASCENDING)
!                                         FirstName(ASCENDING)
! KeyLastName                             LastName(ASCENDING)
! KeyGradYear                             GradYear(DESCENDING)
!                                         LastName(ASCENDING)
!                                         FirstName(ASCENDING)
!EndRegion
!
!-Keys-
!
!Region
STU_tKey_KeyStudentNumber                 GROUP,TYPE,BINDABLE,PRE(kSTU_Key01)
Number                                      LONG,NAME('Number | LONG | @P###-##-####P | [0001-0004] | PROMPT(''Number:'') | COLUMN(''Number'')')                                   ! [0001-0004] 
                                          END 
STU_tKey_MajorKey                         GROUP,TYPE,BINDABLE,PRE(kSTU_Key02)
Major                                       LONG,NAME('Major | LONG | @N4 | [0001-0004] | PROMPT(''Major:'') | COLUMN(''Major'')')                                                 ! [0001-0004] 
LastName                                    STRING(20),NAME('LastName | STRING(20) | @S20 | [0005-0024] | PROMPT(''Last Name:'') | COLUMN(''Last Name'')')                         ! [0005-0024] 
FirstName                                   STRING(20),NAME('FirstName | STRING(20) | @S20 | [0025-0044] | PROMPT(''First Name:'') | COLUMN(''First Name'')')                      ! [0025-0044] 
                                          END 
STU_tKey_KeyLastName                      GROUP,TYPE,BINDABLE,PRE(kSTU_Key03)
LastName                                    STRING(20),NAME('LastName | STRING(20) | @S20 | [0001-0020] | PROMPT(''Last Name:'') | COLUMN(''Last Name'')')                         ! [0001-0020] 
                                          END 
STU_tKey_KeyGradYear                      GROUP,TYPE,BINDABLE,PRE(kSTU_Key04)
GradYear                                    LONG,NAME('GradYear | LONG | @N4 | [0001-0004] | PROMPT(''Grad Year:'') | COLUMN(''Grad Year'')')                                      ! [0001-0004] 
LastName                                    STRING(20),NAME('LastName | STRING(20) | @S20 | [0005-0024] | PROMPT(''Last Name:'') | COLUMN(''Last Name'')')                         ! [0005-0024] 
FirstName                                   STRING(20),NAME('FirstName | STRING(20) | @S20 | [0025-0044] | PROMPT(''First Name:'') | COLUMN(''First Name'')')                      ! [0025-0044] 
                                          END 
!EndRegion
!
!-Record-
!
!Region
STU_tRec                                  GROUP,TYPE,BINDABLE,PRE(rSTU)
Number                                      LONG,NAME('Number | LONG | @P###-##-####P | [0001-0004] | PROMPT(''Number:'') | COLUMN(''Number'')')                                   ! [0001-0004] 
FirstName                                   STRING(20),NAME('FirstName | STRING(20) | @S20 | [0005-0024] | PROMPT(''First Name:'') | COLUMN(''First Name'')')                      ! [0005-0024] 
LastName                                    STRING(20),NAME('LastName | STRING(20) | @S20 | [0025-0044] | PROMPT(''Last Name:'') | COLUMN(''Last Name'')')                         ! [0025-0044] 
Address                                     STRING(20),NAME('Address | STRING(20) | @S20 | [0045-0064] | PROMPT(''Address:'') | COLUMN(''Address'')')                              ! [0045-0064] 
Address2                                    STRING(20),NAME('Address2 | STRING(20) | @S20 | [0065-0084] | PROMPT(''Address 2:'') | COLUMN(''Address 2'')')                         ! [0065-0084] 
City                                        STRING(20),NAME('City | STRING(20) | @S20 | [0085-0104] | PROMPT(''City:'') | COLUMN(''City'')')                                       ! [0085-0104] 
State                                       STRING(2),NAME('State | STRING(2) | @S2 | [0105-0106] | PROMPT(''State:'') | COLUMN(''State'')')                                       ! [0105-0106] 
Zip                                         LONG,NAME('Zip | LONG | @N05 | [0107-0110] | PROMPT(''Zip:'') | COLUMN(''Zip'')')                                                      ! [0107-0110] 
Telephone                                   STRING(12),NAME('Telephone | STRING(12) | @S12 | [0111-0122] | PROMPT(''Telephone:'') | COLUMN(''Telephone'')')                        ! [0111-0122] 
Major                                       LONG,NAME('Major | LONG | @N4 | [0123-0126] | PROMPT(''Major:'') | COLUMN(''Major'')')                                                 ! [0123-0126] 
GradYear                                    LONG,NAME('GradYear | LONG | @N4 | [0127-0130] | PROMPT(''Grad Year:'') | COLUMN(''Grad Year'')')                                      ! [0127-0130] 
                                          END
!EndRegion
!
!-Queue-
!
!Region
STU_qRec                                  QUEUE(STU_tRec),TYPE,BINDABLE,PRE(qSTU)
                                          END
!EndRegion
!
!-Equates-
!
!Region
C_STU_NUMBER                                EQUATE(1)
C_STU_FIRSTNAME                             EQUATE(2)
C_STU_LASTNAME                              EQUATE(3)
C_STU_ADDRESS                               EQUATE(4)
C_STU_ADDRESS2                              EQUATE(5)
C_STU_CITY                                  EQUATE(6)
C_STU_STATE                                 EQUATE(7)
C_STU_ZIP                                   EQUATE(8)
C_STU_TELEPHONE                             EQUATE(9)
C_STU_MAJOR                                 EQUATE(10)
C_STU_GRADYEAR                              EQUATE(11)
!EndRegion
!
!EOF
