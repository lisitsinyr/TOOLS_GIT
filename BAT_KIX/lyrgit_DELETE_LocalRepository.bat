@echo off
rem -------------------------------------------------------------------
rem lyrgit_delete_LocalRepository.bat
rem ----------------------------------------------------------------------------
rem 0.Удалить локальный репозитарий [***]
rem ----------------------------------------------------------------------------
rem Удаление локального репозитария в текущей папке
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Delete Local Repository in current directory
echo ----------------------------------------------------------------------------

echo RD /s/q .git
RD /s/q .git

echo attrib +A -H .gitignore
attrib +A -H .gitignore
echo .gitignore
del .gitignore

echo attrib +A -H .gitmodules
attrib +A -H .gitmodules
echo del .gitmodules
del .gitmodules

echo attrib +A -H .README.md
attrib +A -H .README.md
echo del .README.md
del .README.md

:Exit

