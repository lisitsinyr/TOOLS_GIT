@echo off
rem -------------------------------------------------------------------
rem git_config_--global core.excludesfile.bat
rem -------------------------------------------------------------------
chcp 1251

:begin
git config --global core.excludesfile .gitignore_global

:Exit
