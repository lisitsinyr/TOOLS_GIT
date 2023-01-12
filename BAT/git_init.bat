@echo off
rem -------------------------------------------------------------------
rem git init
rem -------------------------------------------------------------------
chcp 1251

:begin
git init

touch .gitignore
attrib +A +H .gitignore

touch .gitmodules
attrib +A +H .gitmodules

touch .README.md
attrib +A +H .README.md

:Exit

