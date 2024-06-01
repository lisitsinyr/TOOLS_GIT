#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_cherry-pick_commite.bat
# ----------------------------------------------------------------------------
# Интегрировать изменения в данном коммите в текущую ветку. [git cherry-pick <commit>]
# ----------------------------------------------------------------------------
# usage: git cherry-pick [--edit] [-n] [-m <parent-number>] [-s] [-x] [--ff]
#                        [-S[<keyid>]] <commit>...
#    or: git cherry-pick (--continue | --skip | --abort | --quit)
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
#     -x                    append commit name
#     --[no-]ff             allow fast-forward
#     --[no-]allow-empty    preserve initially empty commits
#     --[no-]allow-empty-message
#                           allow commits with empty messages
#     --[no-]keep-redundant-commits
#                           keep redundant, empty commits
# ----------------------------------------------------------------------------

#:begin
echo '----------------------------------------------'
echo ' git cherry-pick $commite'
echo '----------------------------------------------'
echo 'Check 1 parametr'
if [ -n "$1" ]; then
    commite="$1"
else
    commite=""
    read -p "commite: " commite
fi

if [ ! -z "$commite" ]; then
    git cherry-pick "$commite"
else
   echo 'Parametr $UserEmail not specified'
fi

#:exit
