@echo off
rem -------------------------------------------------------------------
rem lyrgit_restore.bat
rem ----------------------------------------------------------------------------"
rem Восстановить файлы рабочего дерева
rem ----------------------------------------------------------------------------"
rem usage: git restore [<options>] [--source=<branch>] <file>...
rem 
rem     -s, --[no-]source <tree-ish>
rem                           which tree-ish to checkout from
rem     -S, --[no-]staged     restore the index
rem     -W, --[no-]worktree   restore the working tree (default)
rem     --[no-]ignore-unmerged
rem                           ignore unmerged entries
rem     --[no-]overlay        use overlay mode
rem     -q, --[no-]quiet      suppress progress reporting
rem     --[no-]recurse-submodules[=<checkout>]
rem                           control recursive updating of submodules
rem     --[no-]progress       force progress reporting
rem     -m, --[no-]merge      perform a 3-way merge with the new branch
rem     --[no-]conflict <style>
rem                           conflict style (merge, diff3, or zdiff3)
rem     -2, --ours            checkout our version for unmerged files
rem     -3, --theirs          checkout their version for unmerged files
rem     -p, --[no-]patch      select hunks interactively
rem     --[no-]ignore-skip-worktree-bits
rem                           do not limit pathspecs to sparse entries only
rem     --[no-]pathspec-from-file <file>
rem                           read pathspec from file
rem     --[no-]pathspec-file-nul
rem                           with --pathspec-from-file, pathspec elements are separated with NUL character
rem ----------------------------------------------------------------------------"
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo git restore
echo ----------------------------------------------------------------------------
git restore

:Exit
