@echo off
rem -------------------------------------------------------------------
rem lyrgit_cherry-pick_commite.bat
rem ----------------------------------------------------------------------------
rem Интегрировать изменения в данном коммите в текущую ветку. [git cherry-pick <commit>]
rem ----------------------------------------------------------------------------
rem usage: git cherry-pick [--edit] [-n] [-m <parent-number>] [-s] [-x] [--ff]
rem                        [-S[<keyid>]] <commit>...
rem    or: git cherry-pick (--continue | --skip | --abort | --quit)
rem 
rem     --quit                end revert or cherry-pick sequence
rem     --continue            resume revert or cherry-pick sequence
rem     --abort               cancel revert or cherry-pick sequence
rem     --skip                skip current commit and continue
rem     --[no-]cleanup <mode> how to strip spaces and #comments from message
rem     -n, --no-commit       don't automatically commit
rem     --commit              opposite of --no-commit
rem     -e, --[no-]edit       edit the commit message
rem     -s, --[no-]signoff    add a Signed-off-by trailer
rem     -m, --[no-]mainline <parent-number>
rem                           select mainline parent
rem     --[no-]rerere-autoupdate
rem                           update the index with reused conflict resolution if possible
rem     --[no-]strategy <strategy>
rem                           merge strategy
rem     -X, --[no-]strategy-option <option>
rem                           option for merge strategy
rem     -S, --[no-]gpg-sign[=<key-id>]
rem                           GPG sign commit
rem     -x                    append commit name
rem     --[no-]ff             allow fast-forward
rem     --[no-]allow-empty    preserve initially empty commits
rem     --[no-]allow-empty-message
rem                           allow commits with empty messages
rem     --[no-]keep-redundant-commits
rem                           keep redundant, empty commits
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
SET commite=%1
goto begin_git
:P1_Input
set /p commite=commite:
if "%commite%" == "" goto P1_Error
goto begin_git
:P1_Error
echo Parametr commite not set
goto Exit

:begin_git
echo ----------------------------------------------------------------------------
echo git cherry-pick %commite%
echo ----------------------------------------------------------------------------
git cherry-pick %commite%

:Exit
