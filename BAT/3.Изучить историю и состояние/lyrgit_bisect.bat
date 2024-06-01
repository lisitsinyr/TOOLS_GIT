@echo off
rem -------------------------------------------------------------------
rem lyrgit_bisect.bat
rem ----------------------------------------------------------------------------
rem Используйте бинарный поиск, чтобы найти фиксацию, которая привела к ошибке
rem ----------------------------------------------------------------------------
rem usage: git bisect start [--term-(new|bad)=<term> --term-(old|good)=<term>]    [--no-checkout] [--first-parent] [<bad> [<good>...]] [--]    [<pathspec>...]
rem    or: git bisect (good|bad) [<rev>...]
rem    or: git bisect terms [--term-good | --term-bad]
rem    or: git bisect skip [(<rev>|<range>)...]
rem    or: git bisect next
rem    or: git bisect reset [<commit>]
rem    or: git bisect visualize
rem    or: git bisect replay <logfile>
rem    or: git bisect log
rem    or: git bisect run <cmd> [<arg>...]
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo git bisect
echo ----------------------------------------------------------------------------
git bisect

:Exit
