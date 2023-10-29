#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#TEMPLATE(zClassesListClass,'2022.02.24.09.16.51: zClassesListClass [GENERATED] Version: 1.00'),FAMILY('CW20','ABC')
#!
#INCLUDE('cape01.tpw')
#INCLUDE('cape02.tpw')
#!
#SYSTEM
#!
#EQUATE(%tplVer  , '1.00')
#EQUATE(%tplRel  , '2022.02.24.09.16.51')
#!
#EQUATE(%tplVerNumber     ,'Version ' & %tplVer & ' [ ' & %tplRel & ' ]'       )
#EQUATE(%tplVerName       ,'Templates Generator Template Collection.'          )
#EQUATE(%tplVerCopyrights ,'Templates copyright (c) by each individual author.')
#EQUATE(%tplVerReserveAll ,'All rights reserved world wide.'                   )
#EQUATE(%tplVerCollection ,'Collection created by Roberto Artigas y Soler.'    )
#EQUATE(%tplVerContact    ,'Contact: roberto.artigas.dev@gmail.com'            )
#!
#GROUP(%ClarionFamily)
#PREPARE
  #IF(NOT VAREXISTS(%FamilyText))
    #DECLARE(%FamilyText)
  #ENDIF
  #SET(%FamilyText,               'Template Family being used by this application.')
  #SET(%FamilyText, %FamilyText & ' This will be set automatically once a compile has been performed.')
  #SET(%FamilyText, %FamilyText & '')
#ENDPREPARE
#BOXED('')
  #DISPLAY(''),AT(,,,1)
  #DISPLAY(%FamilyText),AT(,,350,20)
  #ENABLE(%FALSE)
    #PROMPT('Template Family:',@S10),%Family,DEFAULT(''),AT(80,,100,10),PROP(PROP:READONLY,1),PROP(PROP:FontStyle,700)
  #ENDENABLE
  #DISPLAY(''),AT(,,,1)
#ENDBOXED
#!
#GROUP(%PreambleMe)
#BOXED(%tplVerNumber),AT(,,,52),PROP(PROP:FontStyle,700)
  #DISPLAY(%tplVerName      ),AT(10,08)
  #DISPLAY(%tplVerCopyrights),AT(10,16)
  #DISPLAY(%tplVerReserveAll),AT(10,24)
  #DISPLAY(%tplVerCollection),AT(10,32)
  #DISPLAY(%tplVerContact   ),AT(10,40)
#ENDBOXED
#DISPLAY(''),AT(,,,1)
#!
#GROUP(%LicenseMe)
#TAB('License'),PROP(PROP:FontStyle,700)
#INSERT(%LicenseMeMIT)
#ENDTAB
#GROUP(%LicenseMeMIT)
#PREPARE
  #IF(NOT VAREXISTS(%LicenseMeMITText01))
    #DECLARE(%LicenseMeMITText01)
  #ENDIF
  #IF(NOT VAREXISTS(%LicenseMeMITText02))
    #DECLARE(%LicenseMeMITText02)
  #ENDIF
  #IF(NOT VAREXISTS(%LicenseMeMITText03))
    #DECLARE(%LicenseMeMITText03)
  #ENDIF
  #SET(%LicenseMeMITText01, '')
  #SET(%LicenseMeMITText01, %LicenseMeMITText01 & 'Permission is hereby granted, free of charge, to any person')
  #SET(%LicenseMeMITText01, %LicenseMeMITText01 & ' obtaining a copy of this software and associated documentation')
  #SET(%LicenseMeMITText01, %LicenseMeMITText01 & ' files (the "Software"), to deal in the software without')
  #SET(%LicenseMeMITText01, %LicenseMeMITText01 & ' restriction, including without limitation the rights to use,')
  #SET(%LicenseMeMITText01, %LicenseMeMITText01 & ' copy, modify, merge, publish, distribute, sublicense, and/or sell')
  #SET(%LicenseMeMITText01, %LicenseMeMITText01 & ' copies of the Software, and to permit persons to whom the Software')
  #SET(%LicenseMeMITText01, %LicenseMeMITText01 & ' is furnished to do so, subject to the following conditions:')
  #SET(%LicenseMeMITText02, '')
  #SET(%LicenseMeMITText02, %LicenseMeMITText02 & 'The above copyright notice and this permission notice shall be')
  #SET(%LicenseMeMITText02, %LicenseMeMITText02 & ' included in all copies or substantial portions of the Software.')
  #SET(%LicenseMeMITText03, '')
  #SET(%LicenseMeMITText03, %LicenseMeMITText03 & 'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,')
  #SET(%LicenseMeMITText03, %LicenseMeMITText03 & ' EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF')
  #SET(%LicenseMeMITText03, %LicenseMeMITText03 & ' MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND')
  #SET(%LicenseMeMITText03, %LicenseMeMITText03 & ' NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT')
  #SET(%LicenseMeMITText03, %LicenseMeMITText03 & ' HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,')
  #SET(%LicenseMeMITText03, %LicenseMeMITText03 & ' WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,')
  #SET(%LicenseMeMITText03, %LicenseMeMITText03 & ' OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER')
  #SET(%LicenseMeMITText03, %LicenseMeMITText03 & ' DEALINGS IN THE SOFTWARE.')
  #SET(%LicenseMeMITText03, %LicenseMeMITText03 & '')
#ENDPREPARE
#BOXED('MIT License'),PROP(PROP:FontStyle,700)
  #DISPLAY(''),AT(,,,1)
  #DISPLAY('Copyright (c) ' & YEAR(TODAY()) & ' by Roberto Artigas y Soler.'),PROP(PROP:FontStyle,700)
  #DISPLAY(''),AT(,,,1)
  #DISPLAY(%LicenseMeMITText01),AT(,,350,44)
  #DISPLAY(%LicenseMeMITText02),AT(,,350,22),PROP(PROP:FontStyle,700)
  #DISPLAY(%LicenseMeMITText03),AT(,,350,48)
#ENDBOXED
#!
#GROUP(%ReadGlobal,%pa,%force)
#INSERT(%SetFamily)
#FOR(%ApplicationTemplate),WHERE(%ApplicationTemplate='GlobalzClassesListClass(zClassesListClass)')
  #FOR(%ApplicationTemplateInstance)
    #CONTEXT(%Application,%ApplicationTemplateInstance)
      #INSERT(%ReadClassesPR,'cClassesListClass.inc',%pa,%force)
      #INSERT(%ReadAdditionalIncFiles,%pa,%force)
    #ENDCONTEXT
  #ENDFOR
#ENDFOR
#!
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#EXTENSION(GlobalzClassesListClass,'2022.02.24.09.16.51: zClassesListClass [GENERATED] Version: 1.00'),APPLICATION(zClassesListClass)
#!
#INSERT(%PreambleMe)
#!
#SHEET,HSCROLL
  #PREPARE
    #INSERT(%ReadGlobal,1,0)
  #ENDPREPARE
  #INSERT(%LicenseMe)
  #TAB(UPPER(%Application) & '.' & UPPER(%ProgramExtension))
    #BOXED('GlobalzClassesListClass')
      #DISPLAY(''),AT(,,,1)
      #DISPLAY('cClassesListClass')
      #DISPLAY('Templates copyright (c) by each individual author.')
      #DISPLAY('Contact: roberto.artigas.dev@gmail.com')
    #ENDBOXED
    #DISPLAY(''),AT(,,,1)
    #BOXED('Debugging Global')
      #PROMPT('Disable All Global cClassesListClass Features',CHECK),%NoGlobalzClassesListClass,AT(10)
    #ENDBOXED
    #INSERT(%ClarionFamily)
  #ENDTAB
  #TAB('Multi-Dll'),WHERE(%NoGlobalzClassesListClass=0)
    #BOXED('')
      #PROMPT('This is part of a Multi-DLL program',CHECK),%MultiDLL,DEFAULT(%ProgramExtension='DLL'),AT(10) ,PROP(PROP:Readonly,1),PROP(PROP:Disable,1)
      #ENABLE(%MultiDLL=1)
        #ENABLE(%ProgramExtension='DLL')
          #PROMPT('Export Class from this DLL',CHECK),%RootDLL,at(10)
        #ENDENABLE
      #ENDENABLE
    #ENDBOXED
  #ENDTAB
  #TAB('Classes')
    #INSERT(%GlobalDeclareClassesPR)
  #ENDTAB
#ENDSHEET
#!
#AT(%AfterGlobalIncludes),WHERE(%NoGlobalzClassesListClass=0)
  INCLUDE('cClassesListClass.inc'),ONCE
  #INSERT(%IncludeAdditionalIncFiles)
#ENDAT
#!
#ATSTART
  #IF(%NoGlobalzClassesListClass=0)
    #INSERT(%ReadGlobal,2,0)
  #ENDIF
#ENDAT
#!
#ATEND
  #IF(%NoGlobalzClassesListClass=0)
    #INSERT(%EndGlobal)
  #ENDIF
#ENDAT
#!
#AT(%DllExportList),WHERE(%ProgramExtension='DLL' AND %RootDLL=1 AND %MultiDll=1 AND %NoGlobalzClassesListClass=0)
#INSERT(%ExportClassesPR,'cClassesListClass.inc')
#INSERT(%ExportAdditionalIncFiles)
#ENDAT
#!
#AT(%CustomGlobalDeclarations),WHERE(%NoGlobalzClassesListClass=0)
#INSERT(%Defines,1,'LinkMode','DllMode',%MultiDLL,%RootDll)
#ENDAT
#!
#AT(%mpDefineAll),WHERE(%NoGlobalzClassesListClass=0)
#INSERT(%Defines,2,'LinkMode','DllMode',%MultiDLL,%RootDll)
#ENDAT
#!
#AT(%mpDefineAll7),WHERE(%NoGlobalzClassesListClass=0)
#INSERT(%Defines,3,'LinkMode','DllMode',%MultiDLL,%RootDll)
#ENDAT
#!
#AT(%BeforeGlobalIncludes),WHERE(%NoGlobalzClassesListClass=0)
RelVer:zClassesListClass EQUATE('Rel:2022.02.24.09.16.51-Ver:1.00')
#ENDAT
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#EXTENSION(LocalzClassesListClass, ' 2022.02.24.09.16.51: LOCAL zClassesListClass [GENERATED] Version: 1.00'),PROCEDURE,REQ(GlobalzClassesListClass(zClassesListClass))
#!
#INSERT(%PreambleMe)
#!
#SHEET,HSCROLL
  #PREPARE
    #INSERT(%ReadGlobal,3,0)
  #ENDPREPARE
  #INSERT(%LicenseMe)
  #TAB(UPPER(%Application) & '.' & UPPER(%ProgramExtension))
    #BOXED('LocalzClassesListClass')
      #DISPLAY(''),AT(,,,1)
      #DISPLAY('cClassesListClass')
      #DISPLAY('Templates copyright (c) by each individual author.')
      #DISPLAY('Contact: roberto.artigas.dev@gmail.com')
    #ENDBOXED
    #DISPLAY(''),AT(,,,1)
    #BOXED('Debugging Local')
      #PROMPT('Disable Local cClassesListClass Features',CHECK),%NoLocalzClassesListClass,AT(10)
    #ENDBOXED
    #INSERT(%ClarionFamily)
  #ENDTAB
  #TAB('Classes')
    #BOXED('')
      #DISPLAY(''),AT(,,,1)
      #PROMPT('&Object Name',@s100),%zObjectName,DEFAULT('CLA_oListClass')
      #PROMPT('&Class Name',@s100),%zClassName,DEFAULT('cClassesListClass')
    #ENDBOXED
  #ENDTAB
#ENDSHEET
#!
#ATSTART
  #IF(%NoLocalzClassesListClass=0)
    #INSERT(%AtStartInitialisation)
    #INSERT(%AddObjectPR,%zClassName,%zObjectName,'Local Objects')
  #ENDIF
#ENDAT
#!
#AT(%DataSection),WHERE(%NoLocalzClassesListClass=0),DESCRIPTION('LocalzClassesListClass - Class Definition'),PRIORITY(2700)
#INSERT(%GenerateClassDeclaration,%zClassName,%zObjectName,'Local Objects','RYB Objects')
#ENDAT
#!
#AT(%LocalProcedures),WHERE(%NoLocalzClassesListClass=0),DESCRIPTION('LocalzClassesListClass - Class Definition')
#INSERT(%GenerateMethods,%zClassName,%zObjectName,'Local Objects','RYB Objects')
#ENDAT
#!
#AT(%dMethodCodeSection,%ActiveTemplate & %ActiveTemplateInstance,%eMethodID),PRIORITY(5000),DESCRIPTION('Parent Call')
#INSERT(%ParentCall)
#ENDAT
#!
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
#!-----------------------------------------------------------------------------------------------------
