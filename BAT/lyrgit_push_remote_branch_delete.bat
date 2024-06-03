@echo off
rem -------------------------------------------------------------------
rem lyrgit_push_remote_branch_delete.bat
rem ----------------------------------------------------------------------------
rem Удаление удаленной ветки
rem ----------------------------------------------------------------------------
rem usage: git push [<options>] [<repository> [<refspec>...]]
rem 
rem     -v, --verbose         be more verbose
rem     -q, --quiet           be more quiet
rem     --repo <repository>   repository
rem     --all                 push all refs
rem     --mirror              mirror all refs
rem     -d, --delete          delete refs
rem     --tags                push tags (can't be used with --all or --mirror)
rem     -n, --dry-run         dry run
rem     --porcelain           machine-readable output
rem     -f, --force           force updates
rem     --force-with-lease[=<refname>:<expect>]
rem                           require old value of ref to be at this value
rem     --force-if-includes   require remote updates to be integrated locally
rem     --recurse-submodules (check|on-demand|no)
rem                           control recursive pushing of submodules
rem     --thin                use thin pack
rem     --receive-pack <receive-pack>
rem                           receive pack program
rem     --exec <receive-pack>
rem                           receive pack program
rem     -u, --set-upstream    set upstream for git pull/status
rem     --progress            force progress reporting
rem     --prune               prune locally removed refs
rem     --no-verify           bypass pre-push hook
rem     --follow-tags         push missing but relevant tags
rem     --signed[=(yes|no|if-asked)]
rem                           GPG sign the push
rem     --atomic              request atomic transaction on remote side
rem     -o, --push-option <server-specific>
rem                           option to transmit
rem     -4, --ipv4            use IPv4 addresses only
rem     -6, --ipv6            use IPv6 addresses only
rem -------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
SET remote=%1
goto P2
:P1_Input
set /p remote=remote:
if "%remote%" == "" goto Error_1
goto P2
:Error_1
echo Parametr remote not set
goto Exit

echo ----------------------------------------------------------------------------
echo Check 2 parametr
echo ----------------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
SET branch=%2
goto begin_git
:P2_Input
set /p branch=branch:
if "%branch%" == "" goto P2_Error
goto begin_git
:P2_Error
echo Parametr branch not set
goto Exit
rem -------------------------------------------------------------------

:begin_git
echo ----------------------------------------------------------------------------
echo git push %remote% --delete %branch%
echo ----------------------------------------------------------------------------
git push %remote% --delete %branch%

:Exit
