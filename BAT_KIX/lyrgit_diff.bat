@echo off
rem -------------------------------------------------------------------
rem lyrgit_diff.bat
rem ----------------------------------------------------------------------------
rem Просмотр разницы между рабочим каталогом и индексом (staged area)
rem ----------------------------------------------------------------------------
rem git diff [<options>] [<commit>] [--] [<path>...]
rem git diff [<options>] --cached [--merge-base] [<commit>] [--] [<path>...]
rem git diff [<options>] [--merge-base] <commit> [<commit>...] <commit> [--] [<path>...]
rem git diff [<options>] <commit>...<commit> [--] [<path>...]
rem git diff [<options>] <blob> <blob>
rem git diff [<options>] --no-index [--] <path> <path>
rem ----------------------------------------------------------------------------
chcp 1251

:Begin
echo ----------------------------------------------------------------------------
echo git diff
echo ----------------------------------------------------------------------------
git diff

:Exit
