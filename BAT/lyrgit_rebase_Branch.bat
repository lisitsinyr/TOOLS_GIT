@echo off
rem -------------------------------------------------------------------
rem lyrgit_rebase_Branch.bat
rem ----------------------------------------------------------------------------
rem Отменяет все коммиты с тех пор, как текущая ветвь отклонилась от вышестоящей ветки
rem ----------------------------------------------------------------------------
rem usage: git rebase [-i] [options] [--exec <cmd>] [--onto <newbase> | --keep-base] [<upstream> [<branch>]]
rem    or: git rebase [-i] [options] [--exec <cmd>] [--onto <newbase>] --root [<branch>]
rem    or: git rebase --continue | --abort | --skip | --edit-todo
rem 
rem     --[no-]onto <revision>
rem                           rebase onto given branch instead of upstream
rem     --[no-]keep-base      use the merge-base of upstream and branch as the current base
rem     --no-verify           allow pre-rebase hook to run
rem     --verify              opposite of --no-verify
rem     -q, --[no-]quiet      be quiet. implies --no-stat
rem     -v, --[no-]verbose    display a diffstat of what changed upstream
rem     -n, --no-stat         do not show diffstat of what changed upstream
rem     --stat                opposite of --no-stat
rem     --[no-]signoff        add a Signed-off-by trailer to each commit
rem     --[no-]committer-date-is-author-date
rem                           make committer date match author date
rem     --[no-]reset-author-date
rem                           ignore author date and use current date
rem     -C <n>                passed to 'git apply'
rem     --[no-]ignore-whitespace
rem                           ignore changes in whitespace
rem     --[no-]whitespace <action>
rem                           passed to 'git apply'
rem     -f, --[no-]force-rebase
rem                           cherry-pick all commits, even if unchanged
rem     --no-ff               cherry-pick all commits, even if unchanged
rem     --ff                  opposite of --no-ff
rem     --continue            continue
rem     --skip                skip current patch and continue
rem     --abort               abort and check out the original branch
rem     --quit                abort but keep HEAD where it is
rem     --edit-todo           edit the todo list during an interactive rebase
rem     --show-current-patch  show the patch file being applied or merged
rem     --apply               use apply strategies to rebase
rem     -m, --merge           use merging strategies to rebase
rem     -i, --interactive     let the user edit the list of commits to rebase
rem     --[no-]rerere-autoupdate
rem                           update the index with reused conflict resolution if possible
rem     --empty (drop|keep|ask)
rem                           how to handle commits that become empty
rem     --[no-]autosquash     move commits that begin with squash!/fixup! under -i
rem     --[no-]update-refs    update branches that point to commits that are being rebased
rem     -S, --[no-]gpg-sign[=<key-id>]
rem                           GPG-sign commits
rem     --[no-]autostash      automatically stash/stash pop before and after
rem     -x, --[no-]exec <exec>
rem                           add exec lines after each commit of the editable list
rem     -r, --[no-]rebase-merges[=<mode>]
rem                           try to rebase merges instead of skipping them
rem     --[no-]fork-point     use 'merge-base --fork-point' to refine upstream
rem     -s, --[no-]strategy <strategy>
rem                           use the given merge strategy
rem     -X, --[no-]strategy-option <option>
rem                           pass the argument through to the merge strategy
rem     --[no-]root           rebase all reachable commits up to the root(s)
rem     --[no-]reschedule-failed-exec
rem                           automatically re-schedule any `exec` that fails
rem     --[no-]reapply-cherry-picks
rem                           apply all changes, even those already present upstream
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
SET upstream_branch=%1
goto begin_git
:P1_Input
set /p upstream_branch=upstream_branch:
if "%branch%" == "" goto P1_Error
goto begin_git
:P1_Error
echo Parametr upstream_branch not set
goto Exit

:begin_git
echo ----------------------------------------------------------------------------
echo git rebase %upstream_branch%
echo ----------------------------------------------------------------------------
git rebase %upstream_branch%

:Exit
