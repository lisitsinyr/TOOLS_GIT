@echo off
rem -------------------------------------------------------------------
rem lyrgit_merge_Commit.bat
rem ----------------------------------------------------------------------------
rem Объединить изменения из имени коммита в текущую коммит
rem ----------------------------------------------------------------------------
rem usage: git merge [<options>] [<commit>...]
rem    or: git merge --abort
rem    or: git merge --continue
rem 
rem     -n                    do not show a diffstat at the end of the merge
rem     --[no-]stat           show a diffstat at the end of the merge
rem     --[no-]summary        (synonym to --stat)
rem     --[no-]log[=<n>]      add (at most <n>) entries from shortlog to merge commit message
rem     --[no-]squash         create a single commit instead of doing a merge
rem     --[no-]commit         perform a commit if the merge succeeds (default)
rem     -e, --[no-]edit       edit message before committing
rem     --[no-]cleanup <mode> how to strip spaces and #comments from message
rem     --[no-]ff             allow fast-forward (default)
rem     --ff-only             abort if fast-forward is not possible
rem     --[no-]rerere-autoupdate
rem                           update the index with reused conflict resolution if possible
rem     --[no-]verify-signatures
rem                           verify that the named commit has a valid GPG signature
rem     -s, --[no-]strategy <strategy>
rem                           merge strategy to use
rem     -X, --[no-]strategy-option <option=value>
rem                           option for selected merge strategy
rem     -m, --[no-]message <message>
rem                           merge commit message (for a non-fast-forward merge)
rem     -F, --file <path>     read message from file
rem     --[no-]into-name <name>
rem                           use <name> instead of the real target
rem     -v, --[no-]verbose    be more verbose
rem     -q, --[no-]quiet      be more quiet
rem     --[no-]abort          abort the current in-progress merge
rem     --[no-]quit           --abort but leave index and working tree alone
rem     --[no-]continue       continue the current in-progress merge
rem     --[no-]allow-unrelated-histories
rem                           allow merging unrelated histories
rem     --[no-]progress       force progress reporting
rem     -S, --[no-]gpg-sign[=<key-id>]
rem                           GPG sign commit
rem     --[no-]autostash      automatically stash/stash pop before and after
rem     --[no-]overwrite-ignore
rem                           update ignored files (default)
rem     --[no-]signoff        add a Signed-off-by trailer
rem     --no-verify           bypass pre-merge-commit and commit-msg hooks
rem     --verify              opposite of --no-verify
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
Commit=%1
goto begin_git
:P1_Input
set Commit=Commit:
if "%Commit%" == "" goto P1_Error
goto begin_git
:P1_Error
echo Parametr Commit not set
goto Exit

:begin_git
echo ----------------------------------------------------------------------------
echo git merge %Commit%
echo ----------------------------------------------------------------------------
git merge %Commit%

:Exit
