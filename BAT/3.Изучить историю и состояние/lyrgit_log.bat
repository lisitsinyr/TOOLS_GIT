@echo off
rem -------------------------------------------------------------------
rem lyrgit_log.bat
rem ----------------------------------------------------------------------------
rem Показать журналы коммитов
rem ----------------------------------------------------------------------------
rem usage: git log [<options>] [<revision-range>] [[--] <path>...]
rem    or: git show [<options>] <object>...
rem 
rem     -q, --[no-]quiet      suppress diff output
rem     --[no-]source         show source
rem     --[no-]use-mailmap    use mail map file
rem     --[no-]mailmap        alias of --use-mailmap
rem     --clear-decorations   clear all previously-defined decoration filters
rem     --[no-]decorate-refs <pattern>
rem                           only decorate refs that match <pattern>
rem     --[no-]decorate-refs-exclude <pattern>
rem                           do not decorate refs that match <pattern>
rem     --[no-]decorate[=...] decorate options
rem     -L <range:file>       trace the evolution of line range <start>,<end> or function :<funcname> in <file>
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo git log
echo ----------------------------------------------------------------------------
git log

:Exit
