#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_push_Remote_Local_Name.bat
# ----------------------------------------------------------------------------
# Отправьте ветку в удаленный репозитарий с другим именем
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
echo ' git Name --track $remote $Local:$Name'
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
    Local="$2"
else
    Local=""
    read -p "Local: " Local
fi
if [ -z "$Local" ]; then
   echo 'Parametr $Local not specified'
fi
echo 'Check 3 parametr'
if [ -n "$3" ]; then
    Name="$3"
else
    Name=""
    read -p "Name: " Name
fi
if [ -z "$Name" ]; then
   echo 'Parametr $Name not specified'
fi

if [ ! -z "$remote" && ! -z "$branch" && ! -z "$Name" ]; then
    git Name --track "$remote" "$Local":"$Name"
fi

#:exit
