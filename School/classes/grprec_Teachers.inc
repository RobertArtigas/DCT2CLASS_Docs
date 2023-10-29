!BOF
!
!Region Generate
!
! Dictionary:   C:\_GIT_\RobertArtigas\DCT2CLASS_Docs\School\SCHOOL.DCT
! File:         .\classes\grprec_Teachers.inc
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
! Name:         Teachers
! Prefix:       TEA
! Filename:     'TEACHERS.TPS'
!EndRegion
!Region KeyDocs
!
!-Keys Docs-
!
! KeyTeacherNumber                        Number(ASCENDING)
! KeyLastName                             LastName(ASCENDING)
! KeyDepartment                           Department(ASCENDING)
!EndRegion
!Region KeyDefinitions
!
!-Keys-
!
TEA_tKey_KeyTeacherNumber                 GROUP,TYPE,BINDABLE,PRE(kTEA_Key01)
Number                                      LONG,NAME('Number|LONG|@P###-##-####P|ATTRIBUTE')                                                                                      ! [0001-0004] 
                                          END 
TEA_tKey_KeyLastName                      GROUP,TYPE,BINDABLE,PRE(kTEA_Key02)
LastName                                    STRING(20),NAME('LastName|STRING(20)|@S20|ATTRIBUTE')                                                                                  ! [0001-0020] 
                                          END 
TEA_tKey_KeyDepartment                    GROUP,TYPE,BINDABLE,PRE(kTEA_Key03)
Department                                  LONG,NAME('Department|LONG|@N4|ATTRIBUTE')                                                                                             ! [0001-0004] 
                                          END 
!EndRegion
!Region RecordDefinition
!
!-Record-
!
TEA_tRec                                  GROUP,TYPE,BINDABLE,PRE(rTEA)
Number                                      LONG,NAME('Number|LONG|@P###-##-####P|ATTRIBUTE')                                                                                      ! [0001-0004] 
FirstName                                   STRING(20),NAME('FirstName|STRING(20)|@S20|ATTRIBUTE')                                                                                 ! [0005-0024] 
LastName                                    STRING(20),NAME('LastName|STRING(20)|@S20|ATTRIBUTE')                                                                                  ! [0025-0044] 
Address                                     STRING(20),NAME('Address|STRING(20)|@S20|ATTRIBUTE')                                                                                   ! [0045-0064] 
City                                        STRING(20),NAME('City|STRING(20)|@S20|ATTRIBUTE')                                                                                      ! [0065-0084] 
State                                       STRING(2),NAME('State|STRING(2)|@S2|ATTRIBUTE')                                                                                        ! [0085-0086] 
Zip                                         LONG,NAME('Zip|LONG|@N05|ATTRIBUTE')                                                                                                   ! [0087-0090] 
Telephone                                   STRING(12),NAME('Telephone|STRING(12)|@S12|ATTRIBUTE')                                                                                 ! [0091-0102] 
Department                                  LONG,NAME('Department|LONG|@N4|ATTRIBUTE')                                                                                             ! [0103-0106] 
                                          END
!EndRegion
!Region QueueDefinition
!
!-Queue-
!
TEA_qRec                                  QUEUE(TEA_tRec),TYPE,BINDABLE,PRE(qTEA)
                                          END
!EndRegion
!Region FieldEquates
!
!-Equates-
!
C_TEA_NUMBER                                EQUATE(1)
C_TEA_FIRSTNAME                             EQUATE(2)
C_TEA_LASTNAME                              EQUATE(3)
C_TEA_ADDRESS                               EQUATE(4)
C_TEA_CITY                                  EQUATE(5)
C_TEA_STATE                                 EQUATE(6)
C_TEA_ZIP                                   EQUATE(7)
C_TEA_TELEPHONE                             EQUATE(8)
C_TEA_DEPARTMENT                            EQUATE(9)
!
!EndRegion
!Region Class_YES
!-------------------------------------------------------------------------------------------------!
! Control:      ?TEA_ListQ                                                                        !
! Object Name:  TEA_oListClass                                                                    !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?TEA_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '32L(2)|M~Number~@P###-##-####P@#1#' & |
!   '80L(2)|M~First Name~@S20@#2#' & |
!   '80L(2)|M~Last Name~@S20@#3#' & |
!   '80L(2)|M~Address~@S20@#4#' & |
!   '80L(2)|M~City~@S20@#5#' & |
!   '28L(2)|M~State~@S2@#6#' & |
!   '16L(2)|M~Zip~@n05@#7#' & |
!   '48L(2)|M~Telephone~@s12@#8#' & |
!   '48L(2)|M~Department~@n4@#9#' & |
!   ''), |
!   FROM(TEA_oListClass.ListQ), |
!   #FIELDS(TEA_oListClass.ListQ.Number, |
!   TEA_oListClass.ListQ.FirstName, |
!   TEA_oListClass.ListQ.LastName, |
!   TEA_oListClass.ListQ.Address, |
!   TEA_oListClass.ListQ.City, |
!   TEA_oListClass.ListQ.State, |
!   TEA_oListClass.ListQ.Zip, |
!   TEA_oListClass.ListQ.Telephone, |
!   TEA_oListClass.ListQ.Department)
!
!EndRegion
!Region Class_NO
!-------------------------------------------------------------------------------------------------!
! Control:      ?TEA_ListQ                                                                        !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?TEA_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '32L(2)|M~Number~@P###-##-####P@#1#' & |
!   '80L(2)|M~First Name~@S20@#2#' & |
!   '80L(2)|M~Last Name~@S20@#3#' & |
!   '80L(2)|M~Address~@S20@#4#' & |
!   '80L(2)|M~City~@S20@#5#' & |
!   '28L(2)|M~State~@S2@#6#' & |
!   '16L(2)|M~Zip~@n05@#7#' & |
!   '48L(2)|M~Telephone~@s12@#8#' & |
!   '48L(2)|M~Department~@n4@#9#' & |
!   ''), |
!   FROM(ListQ), |
!   #FIELDS(ListQ.Number, |
!   ListQ.FirstName, |
!   ListQ.LastName, |
!   ListQ.Address, |
!   ListQ.City, |
!   ListQ.State, |
!   ListQ.Zip, |
!   ListQ.Telephone, |
!   ListQ.Department)
!
!EndRegion
!
!EOF
