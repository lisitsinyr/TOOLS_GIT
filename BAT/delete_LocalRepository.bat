@echo off
rem -------------------------------------------------------------------
rem Удаление локального репозитария в текущей папке
rem delete_LocalRepository.bat
rem -------------------------------------------------------------------
chcp 1251

:begin

RD /s/q .git

attrib +A -H .gitignore
del .gitignore

attrib +A -H .gitmodules
del .gitmodules

attrib +A -H .README.md
del .README.md

:Exit

