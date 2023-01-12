@echo off
rem -------------------------------------------------------------------
rem push an existing repository from the command line
rem -------------------------------------------------------------------
chcp 1251

:begin
git remote add origin https://github.com/lisitsinyr/TOOLS_GIT

git branch -M main

git push -u origin main

:Exit
