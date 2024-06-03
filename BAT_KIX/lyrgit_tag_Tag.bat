@echo off
rem -------------------------------------------------------------------
rem lyrgit_tag_Tag.bat
rem ----------------------------------------------------------------------------
rem Создание легковесной метки на текущем коммите
rem ----------------------------------------------------------------------------
rem usage: git tag [-a | -s | -u <key-id>] [-f] [-m <msg> | -F <file>] [-e]
rem                <tagname> [<commit> | <object>]
rem    or: git tag -d <tagname>...
rem    or: git tag [-n[<num>]] -l [--contains <commit>] [--no-contains <commit>]
rem                [--points-at <object>] [--column[=<options>] | --no-column]
rem                [--create-reflog] [--sort=<key>] [--format=<format>]
rem                [--merged <commit>] [--no-merged <commit>] [<pattern>...]
rem    or: git tag -v [--format=<format>] <tagname>...
rem 
rem     -l, --list            list tag names
rem     -n[<n>]               print <n> lines of each tag message
rem     -d, --delete          delete tags
rem     -v, --verify          verify tags
rem 
rem Tag creation options
rem     -a, --[no-]annotate   annotated tag, needs a message
rem     -m, --message <message>
rem                           tag message
rem     -F, --[no-]file <file>
rem                           read message from file
rem     -e, --[no-]edit       force edit of tag message
rem     -s, --[no-]sign       annotated and GPG-signed tag
rem     --[no-]cleanup <mode> how to strip spaces and #comments from message
rem     -u, --[no-]local-user <key-id>
rem                           use another key to sign the tag
rem     -f, --[no-]force      replace the tag if exists
rem     --[no-]create-reflog  create a reflog
rem 
rem Tag listing options
rem     --[no-]column[=<style>]
rem                           show tag list in columns
rem     --contains <commit>   print only tags that contain the commit
rem     --no-contains <commit>
rem                           print only tags that don't contain the commit
rem     --merged <commit>     print only tags that are merged
rem     --no-merged <commit>  print only tags that are not merged
rem     --[no-]omit-empty     do not output a newline after empty formatted refs
rem     --[no-]sort <key>     field name to sort on
rem     --[no-]points-at <object>
rem                           print only tags of the object
rem     --[no-]format <format>
rem                           format to use for the output
rem     --[no-]color[=<when>] respect format colors
rem     -i, --[no-]ignore-case
rem                           sorting and filtering are case insensitive
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
SET Tag=%1
goto begin_git
:P1_Input
set /p Tag=Tag:
if "%Tag%" == "" goto P1_Error
goto begin_git
:P1_Error
echo Parametr Tag not set
goto Exit

:begin_git
echo ----------------------------------------------------------------------------
echo git tag %Tag%
echo ----------------------------------------------------------------------------
git tag %Tag%

:Exit
