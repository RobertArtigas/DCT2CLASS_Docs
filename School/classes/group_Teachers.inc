!BOF
!
! File:         .\classes\group_Teachers.inc
! Date-Time:    2021/11/24 - 06:46:40AM
! Purpose:      Generated File Records as Groups
! Author:       GenerateGroups Template
! Narative:     This template is used to pass records structures
!               back and forth between DLL's when the files
!               are not shared. Since file definitions are not
!               available, data has to be passed in areas.
!
!Region
! Name:         Teachers
! Prefix:       TEA
! Filename:     'TEACHERS.TPS'
!EndRegion
!
!-Keys-
!
!Region
! KeyTeacherNumber                        Number(ASCENDING)
! KeyLastName                             LastName(ASCENDING)
! KeyDepartment                           Department(ASCENDING)
!EndRegion
!
!-Keys-
!
!Region
TEA_tKey_KeyTeacherNumber                 GROUP,TYPE,BINDABLE,PRE(kTEA_Key01)
Number                                      LONG,NAME('Number | LONG | @P###-##-####P | [0001-0004] | PROMPT(''Number:'') | COLUMN(''Number'')')                                   ! [0001-0004] 
                                          END 
TEA_tKey_KeyLastName                      GROUP,TYPE,BINDABLE,PRE(kTEA_Key02)
LastName                                    STRING(20),NAME('LastName | STRING(20) | @S20 | [0001-0020] | PROMPT(''Last Name:'') | COLUMN(''Last Name'')')                         ! [0001-0020] 
                                          END 
TEA_tKey_KeyDepartment                    GROUP,TYPE,BINDABLE,PRE(kTEA_Key03)
Department                                  LONG,NAME('Department | LONG | @N4 | [0001-0004] | PROMPT(''Department:'') | COLUMN(''Department'')')                                  ! [0001-0004] 
                                          END 
!EndRegion
!
!-Record-
!
!Region
TEA_tRec                                  GROUP,TYPE,BINDABLE,PRE(rTEA)
Number                                      LONG,NAME('Number | LONG | @P###-##-####P | [0001-0004] | PROMPT(''Number:'') | COLUMN(''Number'')')                                   ! [0001-0004] 
FirstName                                   STRING(20),NAME('FirstName | STRING(20) | @S20 | [0005-0024] | PROMPT(''First Name:'') | COLUMN(''First Name'')')                      ! [0005-0024] 
LastName                                    STRING(20),NAME('LastName | STRING(20) | @S20 | [0025-0044] | PROMPT(''Last Name:'') | COLUMN(''Last Name'')')                         ! [0025-0044] 
Address                                     STRING(20),NAME('Address | STRING(20) | @S20 | [0045-0064] | PROMPT(''Address:'') | COLUMN(''Address'')')                              ! [0045-0064] 
City                                        STRING(20),NAME('City | STRING(20) | @S20 | [0065-0084] | PROMPT(''City:'') | COLUMN(''City'')')                                       ! [0065-0084] 
State                                       STRING(2),NAME('State | STRING(2) | @S2 | [0085-0086] | PROMPT(''State:'') | COLUMN(''State'')')                                       ! [0085-0086] 
Zip                                         LONG,NAME('Zip | LONG | @N05 | [0087-0090] | PROMPT(''Zip:'') | COLUMN(''Zip'')')                                                      ! [0087-0090] 
Telephone                                   STRING(12),NAME('Telephone | STRING(12) | @S12 | [0091-0102] | PROMPT(''Telephone:'') | COLUMN(''Telephone'')')                        ! [0091-0102] 
Department                                  LONG,NAME('Department | LONG | @N4 | [0103-0106] | PROMPT(''Department:'') | COLUMN(''Department'')')                                  ! [0103-0106] 
                                          END
!EndRegion
!
!-Queue-
!
!Region
TEA_qRec                                  QUEUE(TEA_tRec),TYPE,BINDABLE,PRE(qTEA)
                                          END
!EndRegion
!
!-Equates-
!
!Region
C_TEA_NUMBER                                EQUATE(1)
C_TEA_FIRSTNAME                             EQUATE(2)
C_TEA_LASTNAME                              EQUATE(3)
C_TEA_ADDRESS                               EQUATE(4)
C_TEA_CITY                                  EQUATE(5)
C_TEA_STATE                                 EQUATE(6)
C_TEA_ZIP                                   EQUATE(7)
C_TEA_TELEPHONE                             EQUATE(8)
C_TEA_DEPARTMENT                            EQUATE(9)
!EndRegion
!
!EOF
