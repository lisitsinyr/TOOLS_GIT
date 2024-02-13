@echo off
rem -------------------------------------------------------------------
rem lyrgit_checkout_Branch_b.bat
rem ----------------------------------------------------------------------------
rem Создать новую ветку (branch) и сразу же переключится на нее
rem ----------------------------------------------------------------------------
rem usage: git checkout [<options>] <branch>
rem    or: git checkout [<options>] [<branch>] -- <file>...
rem 
rem     -b <branch>           create and checkout a new branch
rem     -B <branch>           create/reset and checkout a branch
rem     -l                    create reflog for new branch
rem     --[no-]guess          second guess 'git checkout <no-such-branch>' (default)
rem     --[no-]overlay        use overlay mode (default)
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
rem     -2, --ours            checkout our version for unmerged files
rem     -3, --theirs          checkout their version for unmerged files
rem     -p, --[no-]patch      select hunks interactively
rem     --[no-]ignore-skip-worktree-bits
rem                           do not limit pathspecs to sparse entries only
rem     --[no-]pathspec-from-file <file>
rem                           read pathspec from file
rem     --[no-]pathspec-file-nul
rem                           with --pathspec-from-file, pathspec elements are separated with NUL character
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ---------------------------------------------------------------
echo Check 1 parametr
echo ---------------------------------------------------------------
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
echo ---------------------------------------------------------------
echo  git checkout -b %branch%                                      
echo ---------------------------------------------------------------
git checkout -b %branch%

:Exit
