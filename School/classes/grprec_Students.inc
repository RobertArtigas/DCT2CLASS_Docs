!BOF
!
!Region Generate
!
! Dictionary:   C:\_GIT_\RobertArtigas\DCT2CLASS_Docs\School\SCHOOL.DCT
! File:         .\classes\grprec_Students.inc
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
! Name:         Students
! Prefix:       STU
! Filename:     'STUDENTS.TPS'
!EndRegion
!Region KeyDocs
!
!-Keys Docs-
!
! KeyStudentNumber                        Number(ASCENDING)
! MajorKey                                Major(ASCENDING)
!                                         LastName(ASCENDING)
!                                         FirstName(ASCENDING)
! KeyLastName                             LastName(ASCENDING)
! KeyGradYear                             GradYear(DESCENDING)
!                                         LastName(ASCENDING)
!                                         FirstName(ASCENDING)
!EndRegion
!Region KeyDefinitions
!
!-Keys-
!
STU_tKey_KeyStudentNumber                 GROUP,TYPE,BINDABLE,PRE(kSTU_Key01)
Number                                      LONG,NAME('Number|LONG|@P###-##-####P|ATTRIBUTE')                                                                                      ! [0001-0004] 
                                          END 
STU_tKey_MajorKey                         GROUP,TYPE,BINDABLE,PRE(kSTU_Key02)
Major                                       LONG,NAME('Major|LONG|@N4|ATTRIBUTE')                                                                                                  ! [0001-0004] 
LastName                                    STRING(20),NAME('LastName|STRING(20)|@S20|ATTRIBUTE')                                                                                  ! [0005-0024] 
FirstName                                   STRING(20),NAME('FirstName|STRING(20)|@S20|ATTRIBUTE')                                                                                 ! [0025-0044] 
                                          END 
STU_tKey_KeyLastName                      GROUP,TYPE,BINDABLE,PRE(kSTU_Key03)
LastName                                    STRING(20),NAME('LastName|STRING(20)|@S20|ATTRIBUTE')                                                                                  ! [0001-0020] 
                                          END 
STU_tKey_KeyGradYear                      GROUP,TYPE,BINDABLE,PRE(kSTU_Key04)
GradYear                                    LONG,NAME('GradYear|LONG|@N4|ATTRIBUTE')                                                                                               ! [0001-0004] 
LastName                                    STRING(20),NAME('LastName|STRING(20)|@S20|ATTRIBUTE')                                                                                  ! [0005-0024] 
FirstName                                   STRING(20),NAME('FirstName|STRING(20)|@S20|ATTRIBUTE')                                                                                 ! [0025-0044] 
                                          END 
!EndRegion
!Region RecordDefinition
!
!-Record-
!
STU_tRec                                  GROUP,TYPE,BINDABLE,PRE(rSTU)
Number                                      LONG,NAME('Number|LONG|@P###-##-####P|ATTRIBUTE')                                                                                      ! [0001-0004] 
FirstName                                   STRING(20),NAME('FirstName|STRING(20)|@S20|ATTRIBUTE')                                                                                 ! [0005-0024] 
LastName                                    STRING(20),NAME('LastName|STRING(20)|@S20|ATTRIBUTE')                                                                                  ! [0025-0044] 
Address                                     STRING(20),NAME('Address|STRING(20)|@S20|ATTRIBUTE')                                                                                   ! [0045-0064] 
Address2                                    STRING(20),NAME('Address2|STRING(20)|@S20|ATTRIBUTE')                                                                                  ! [0065-0084] 
City                                        STRING(20),NAME('City|STRING(20)|@S20|ATTRIBUTE')                                                                                      ! [0085-0104] 
State                                       STRING(2),NAME('State|STRING(2)|@S2|ATTRIBUTE')                                                                                        ! [0105-0106] 
Zip                                         LONG,NAME('Zip|LONG|@N05|ATTRIBUTE')                                                                                                   ! [0107-0110] 
Telephone                                   STRING(12),NAME('Telephone|STRING(12)|@S12|ATTRIBUTE')                                                                                 ! [0111-0122] 
Major                                       LONG,NAME('Major|LONG|@N4|ATTRIBUTE')                                                                                                  ! [0123-0126] 
GradYear                                    LONG,NAME('GradYear|LONG|@N4|ATTRIBUTE')                                                                                               ! [0127-0130] 
                                          END
!EndRegion
!Region QueueDefinition
!
!-Queue-
!
STU_qRec                                  QUEUE(STU_tRec),TYPE,BINDABLE,PRE(qSTU)
                                          END
!EndRegion
!Region FieldEquates
!
!-Equates-
!
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
!
!EndRegion
! -03- %pFieldType=BLOB       %pFieldPicture=                     %zLenDec=                    , %zLength=0000, %zDigits=00 %pFieldType=BLOB      
! -03- %pFieldType=BLOB       %pFieldPicture=                     %zLenDec=                    , %zLength=0000, %zDigits=00 %pFieldType=BLOB      
! -03- %pFieldType=BLOB       %pFieldPicture=                     %zLenDec=                    , %zLength=0000, %zDigits=00 %pFieldType=BLOB      
!Region Class_YES
!-------------------------------------------------------------------------------------------------!
! Control:      ?STU_ListQ                                                                        !
! Object Name:  STU_oListClass                                                                    !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?STU_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '0L(0)|M~~@s255@#1#' & |
!   '32L(2)|M~Number~@P###-##-####P@#2#' & |
!   '80L(2)|M~First Name~@S20@#3#' & |
!   '80L(2)|M~Last Name~@S20@#4#' & |
!   '80L(2)|M~Address~@S20@#5#' & |
!   '80L(2)|M~Address 2~@s20@#6#' & |
!   '80L(2)|M~City~@S20@#7#' & |
!   '28L(2)|M~State~@S2@#8#' & |
!   '16L(2)|M~Zip~@n05@#9#' & |
!   '48L(2)|M~Telephone~@s12@#10#' & |
!   '28L(2)|M~Major~@n4@#11#' & |
!   '44L(2)|M~Grad Year~@n4@#12#' & |
!   ''), |
!   FROM(STU_oListClass.ListQ), |
!   #FIELDS(STU_oListClass.ListQ.Photograph, |
!   STU_oListClass.ListQ.Number, |
!   STU_oListClass.ListQ.FirstName, |
!   STU_oListClass.ListQ.LastName, |
!   STU_oListClass.ListQ.Address, |
!   STU_oListClass.ListQ.Address2, |
!   STU_oListClass.ListQ.City, |
!   STU_oListClass.ListQ.State, |
!   STU_oListClass.ListQ.Zip, |
!   STU_oListClass.ListQ.Telephone, |
!   STU_oListClass.ListQ.Major, |
!   STU_oListClass.ListQ.GradYear)
!
!EndRegion
!Region Class_NO
!-------------------------------------------------------------------------------------------------!
! Control:      ?STU_ListQ                                                                        !
! Queue List:   ListQ                                                                             !
!-------------------------------------------------------------------------------------------------!
! This LIST structure is created to replace the one generated by the ABC templates.               !
! Save your generated window structure first, then cut and paste replacing your LIST structure.   !
!-------------------------------------------------------------------------------------------------!
! LIST,AT(4,40,400,40),USE(?STU_ListQ),HVSCROLL, |
!   FORMAT('' & |
!   '0L(0)|M~~@s255@#1#' & |
!   '32L(2)|M~Number~@P###-##-####P@#2#' & |
!   '80L(2)|M~First Name~@S20@#3#' & |
!   '80L(2)|M~Last Name~@S20@#4#' & |
!   '80L(2)|M~Address~@S20@#5#' & |
!   '80L(2)|M~Address 2~@s20@#6#' & |
!   '80L(2)|M~City~@S20@#7#' & |
!   '28L(2)|M~State~@S2@#8#' & |
!   '16L(2)|M~Zip~@n05@#9#' & |
!   '48L(2)|M~Telephone~@s12@#10#' & |
!   '28L(2)|M~Major~@n4@#11#' & |
!   '44L(2)|M~Grad Year~@n4@#12#' & |
!   ''), |
!   FROM(ListQ), |
!   #FIELDS(ListQ.Photograph, |
!   ListQ.Number, |
!   ListQ.FirstName, |
!   ListQ.LastName, |
!   ListQ.Address, |
!   ListQ.Address2, |
!   ListQ.City, |
!   ListQ.State, |
!   ListQ.Zip, |
!   ListQ.Telephone, |
!   ListQ.Major, |
!   ListQ.GradYear)
!
!EndRegion
!
!EOF
