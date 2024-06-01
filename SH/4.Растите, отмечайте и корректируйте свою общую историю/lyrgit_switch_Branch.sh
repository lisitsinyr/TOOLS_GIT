#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_switch_Branch.bat
# ----------------------------------------------------------------------------
# Переключает ветви, обновляя индекс и рабочую область
# ----------------------------------------------------------------------------
# usage: git switch [<options>] [<branch>]
# 
#     -c, --[no-]create <branch>
#                           create and switch to a new branch
#     -C, --[no-]force-create <branch>
#                           create/reset and switch to a branch
#     --[no-]guess          second guess 'git switch <no-such-branch>'
#     --[no-]discard-changes
#                           throw away local modifications
#     -q, --[no-]quiet      suppress progress reporting
#     --[no-]recurse-submodules[=<checkout>]
#                           control recursive updating of submodules
#     --[no-]progress       force progress reporting
#     -m, --[no-]merge      perform a 3-way merge with the new branch
#     --[no-]conflict <style>
#                           conflict style (merge, diff3, or zdiff3)
#     -d, --[no-]detach     detach HEAD at named commit
#     -t, --[no-]track[=(direct|inherit)]
#                           set branch tracking configuration
#     -f, --[no-]force      force checkout (throw away local modifications)
#     --[no-]orphan <new-branch>
#                           new unparented branch
#     --[no-]overwrite-ignore
#                           update ignored files (default)
#     --[no-]ignore-other-worktrees
#                           do not check if another worktree is holding the given ref
# ----------------------------------------------------------------------------

#:begin
echo '---------------------------------------------'
echo ' git switch $branch'
echo '---------------------------------------------'
echo 'Check 1 parametr'
if [ -n "$1" ]; then
    branch="$1"
else
    branch=""
    read -p "branch: " branch
fi

if [ ! -z "$branch" ]; then
    git switch "$branch"
else
   echo 'Parametr $branch not specified'
fi

#:exit
