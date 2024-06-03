@echo off
rem -------------------------------------------------------------------
rem lyrgit_switch_Branch.bat
rem ----------------------------------------------------------------------------
rem Переключает ветви, обновляя индекс и рабочую область
rem ----------------------------------------------------------------------------
rem usage: git switch [<options>] [<branch>]
rem 
rem     -c, --[no-]create <branch>
rem                           create and switch to a new branch
rem     -C, --[no-]force-create <branch>
rem                           create/reset and switch to a branch
rem     --[no-]guess          second guess 'git switch <no-such-branch>'
rem     --[no-]discard-changes
rem                           throw away local modifications
rem     -q, --[no-]quiet      suppress progress reporting
rem     --[no-]recurse-submodules[=<checkout>]
rem                           control recursive updating of submodules
rem     --[no-]progress       force progress reporting
rem     -m, --[no-]merge      perform a 3-way merge with the new branch
rem     --[no-]conflict <style>
rem                           conflict style (merge, diff3, or zdiff3)
rem     -d, --[no-]detach     detach HEAD at named commit
rem     -t, --[no-]track[=(direct|inherit)]
rem                           set branch tracking configuration
rem     -f, --[no-]force      force checkout (throw away local modifications)
rem     --[no-]orphan <new-branch>
rem                           new unparented branch
rem     --[no-]overwrite-ignore
rem                           update ignored files (default)
rem     --[no-]ignore-other-worktrees
rem                           do not check if another worktree is holding the given ref
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
SET branch=%1
goto begin_git
:P1_Input
set /p branch=branch:
if "%branch%" == "" goto P1_Error
goto begin_git
:P1_Error
echo Parametr branch not set
goto Exit

:begin_git
echo ----------------------------------------------------------------------------
echo git switch %branch%
echo ----------------------------------------------------------------------------
git switch %branch%

:Exit
