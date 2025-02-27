@echo off
rem -------------------------------------------------------------------
rem lyrgit_reset_soft_HEAD.bat
rem ----------------------------------------------------------------------------"
rem Отмените последний коммит, оставив его изменения в рабочей области незафиксированными [git reset --soft HEAD^]
rem ----------------------------------------------------------------------------"
rem usage: git reset [--mixed | --soft | --hard | --merge | --keep] [-q] [<commit>]
rem    or: git reset [-q] [<tree-ish>] [--] <pathspec>...
rem    or: git reset [-q] [--pathspec-from-file [--pathspec-file-nul]] [<tree-ish>]
rem    or: git reset --patch [<tree-ish>] [--] [<pathspec>...]
rem    or: DEPRECATED: git reset [-q] [--stdin [-z]] [<tree-ish>]
rem 
rem     -q, --[no-]quiet      be quiet, only report errors
rem     --no-refresh          skip refreshing the index after reset
rem     --refresh             opposite of --no-refresh
rem     --mixed               reset HEAD and index
rem     --soft                reset only HEAD
rem     --hard                reset HEAD, index and working tree
rem     --merge               reset HEAD, index and working tree
rem     --keep                reset HEAD but keep local changes
rem     --[no-]recurse-submodules[=<reset>]
rem                           control recursive updating of submodules
rem     -p, --[no-]patch      select hunks interactively
rem     -N, --[no-]intent-to-add
rem                           record only the fact that removed paths will be added later
rem     --[no-]pathspec-from-file <file>
rem                           read pathspec from file
rem     --[no-]pathspec-file-nul
rem                           with --pathspec-from-file, pathspec elements are separated with NUL character
rem     -z                    DEPRECATED (use --pathspec-file-nul instead): paths are separated with NUL character
rem     --[no-]stdin          DEPRECATED (use --pathspec-from-file=- instead): read paths from <stdin>
rem ----------------------------------------------------------------------------"
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo git reset --soft HEAD^
echo ----------------------------------------------------------------------------
git reset --soft HEAD^

:Exit
