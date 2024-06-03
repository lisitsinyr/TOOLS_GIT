#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_push_remote_branch.bat
# ----------------------------------------------------------------------------
# Отправить новую (или существующую) ветку в удаленный репозитарий
# ----------------------------------------------------------------------------
# usage: git push [<options>] [<repository> [<refspec>...]]
# 
#     -v, --verbose         be more verbose
#     -q, --quiet           be more quiet
#     --repo <repository>   repository
#     --all                 push all refs
#     --mirror              mirror all refs
#     -d, --delete          delete refs
#     --tags                push tags (can't be used with --all or --mirror)
#     -n, --dry-run         dry run
#     --porcelain           machine-readable output
#     -f, --force           force updates
#     --force-with-lease[=<refname>:<expect>]
#                           require old value of ref to be at this value
#     --force-if-includes   require remote updates to be integrated locally
#     --recurse-submodules (check|on-demand|no)
#                           control recursive pushing of submodules
#     --thin                use thin pack
#     --receive-pack <receive-pack>
#                           receive pack program
#     --exec <receive-pack>
#                           receive pack program
#     -u, --set-upstream    set upstream for git pull/status
#     --progress            force progress reporting
#     --prune               prune locally removed refs
#     --no-verify           bypass pre-push hook
#     --follow-tags         push missing but relevant tags
#     --signed[=(yes|no|if-asked)]
#                           GPG sign the push
#     --atomic              request atomic transaction on remote side
#     -o, --push-option <server-specific>
#                           option to transmit
#     -4, --ipv4            use IPv4 addresses only
#     -6, --ipv6            use IPv6 addresses only
# -------------------------------------------------------------------

#:begin
echo '--------------------------------------------------'
echo ' git push $remote $branch'
echo '--------------------------------------------------'
echo 'Check 1 parametr'
if [ -n "$1" ]; then
    remote="$1"
else
    remote=""
    read -p "remote: " remote
fi
if [ -z "$remote" ]; then
   echo 'Parametr $remote not specified'
fi
echo 'Check 2 parametr'
if [ -n "$2" ]; then
    branch="$2"
else
    branch=""
    read -p "branch: " branch
fi
if [ -z "$branch" ]; then
   echo 'Parametr $branch not specified'
fi

if [ ! -z "$remote" && ! -z "$branch" ]; then
    git push "$remote" "$branch"
fi

#:exit
