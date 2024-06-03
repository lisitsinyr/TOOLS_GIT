#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_revert_commite.bat
# ----------------------------------------------------------------------------
# Обратный коммит, указанный коммитом, и фиксирует результат [git revert <commit>]
# ----------------------------------------------------------------------------
# usage: git revert [--[no-]edit] [-n] [-m <parent-number>] [-s] [-S[<keyid>]] <commit>...
#    or: git revert (--continue | --skip | --abort | --quit)
# 
#     --quit                end revert or cherry-pick sequence
#     --continue            resume revert or cherry-pick sequence
#     --abort               cancel revert or cherry-pick sequence
#     --skip                skip current commit and continue
#     --[no-]cleanup <mode> how to strip spaces and #comments from message
#     -n, --no-commit       don't automatically commit
#     --commit              opposite of --no-commit
#     -e, --[no-]edit       edit the commit message
#     -s, --[no-]signoff    add a Signed-off-by trailer
#     -m, --[no-]mainline <parent-number>
#                           select mainline parent
#     --[no-]rerere-autoupdate
#                           update the index with reused conflict resolution if possible
#     --[no-]strategy <strategy>
#                           merge strategy
#     -X, --[no-]strategy-option <option>
#                           option for merge strategy
#     -S, --[no-]gpg-sign[=<key-id>]
#                           GPG sign commit
#     --[no-]reference      use the 'reference' format to refer to commits
# ----------------------------------------------------------------------------

#:begin
echo '----------------------------------------------'
echo ' git revert $commite'
echo '----------------------------------------------'
echo 'Check 1 parametr'
if [ -n "$1" ]; then
    commite="$1"
else
    commite=""
    read -p "commite: " commite
fi

if [ ! -z "$commite" ]; then
    git revert "$commite"
else
   echo 'Parametr $UserEmail not specified'
fi

#:exit
