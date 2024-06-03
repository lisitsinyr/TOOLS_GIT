@echo off
rem -------------------------------------------------------------------
rem lyrgit_branch_v.bat
rem ----------------------------------------------------------------------------
rem Посмотреть последний коммит на каждой из локальных веток
rem ----------------------------------------------------------------------------
rem usage: git branch [<options>] [-r | -a] [--merged] [--no-merged]
rem    or: git branch [<options>] [-f] [--recurse-submodules] <branch-name> [<start-point>]
rem    or: git branch [<options>] [-l] [<pattern>...]
rem    or: git branch [<options>] [-r] (-d | -D) <branch-name>...
rem    or: git branch [<options>] (-m | -M) [<old-branch>] <new-branch>
rem    or: git branch [<options>] (-c | -C) [<old-branch>] <new-branch>
rem    or: git branch [<options>] [-r | -a] [--points-at]
rem    or: git branch [<options>] [-r | -a] [--format]
rem 
rem Generic options
rem     -v, --[no-]verbose    show hash and subject, give twice for upstream branch
rem     -q, --[no-]quiet      suppress informational messages
rem     -t, --[no-]track[=(direct|inherit)]
rem                           set branch tracking configuration
rem     -u, --[no-]set-upstream-to <upstream>
rem                           change the upstream info
rem     --[no-]unset-upstream unset the upstream info
rem     --[no-]color[=<when>] use colored output
rem     -r, --remotes         act on remote-tracking branches
rem     --contains <commit>   print only branches that contain the commit
rem     --no-contains <commit>
rem                           print only branches that don't contain the commit
rem     --[no-]abbrev[=<n>]   use <n> digits to display object names
rem 
rem Specific git-branch actions:
rem     -a, --all             list both remote-tracking and local branches
rem     -d, --[no-]delete     delete fully merged branch
rem     -D                    delete branch (even if not merged)
rem     -m, --[no-]move       move/rename a branch and its reflog
rem     -M                    move/rename a branch, even if target exists
rem     --[no-]omit-empty     do not output a newline after empty formatted refs
rem     -c, --[no-]copy       copy a branch and its reflog
rem     -C                    copy a branch, even if target exists
rem     -l, --[no-]list       list branch names
rem     --[no-]show-current   show current branch name
rem     --[no-]create-reflog  create the branch's reflog
rem     --[no-]edit-description
rem                           edit the description for the branch
rem     -f, --[no-]force      force creation, move/rename, deletion
rem     --merged <commit>     print only branches that are merged
rem     --no-merged <commit>  print only branches that are not merged
rem     --[no-]column[=<style>]
rem                           list branches in columns
rem     --[no-]sort <key>     field name to sort on
rem     --[no-]points-at <object>
rem                           print only branches of the object
rem     -i, --[no-]ignore-case
rem                           sorting and filtering are case insensitive
rem     --[no-]recurse-submodules
rem                           recurse through submodules
rem     --[no-]format <format>
rem                           format to use for the output
rem --------------------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo git branch -v
echo ----------------------------------------------------------------------------
git branch -v

:Exit
