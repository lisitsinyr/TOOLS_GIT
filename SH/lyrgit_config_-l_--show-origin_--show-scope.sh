#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_config_-l_--show-origin_--show-scope.bat
# ----------------------------------------------------------------------------
# 
# ----------------------------------------------------------------------------
# usage: git config [<options>]
# 
# Config file location
#     --[no-]global         use global config file
#     --[no-]system         use system config file
#     --[no-]local          use repository config file
#     --[no-]worktree       use per-worktree config file
#     -f, --[no-]file <file>
#                           use given config file
#     --[no-]blob <blob-id> read config from given blob object
# 
# Action
#     --[no-]get            get value: name [value-pattern]
#     --[no-]get-all        get all values: key [value-pattern]
#     --[no-]get-regexp     get values for regexp: name-regex [value-pattern]
#     --[no-]get-urlmatch   get value specific for the URL: section[.var] URL
#     --[no-]replace-all    replace all matching variables: name value [value-pattern]
#     --[no-]add            add a new variable: name value
#     --[no-]unset          remove a variable: name [value-pattern]
#     --[no-]unset-all      remove all matches: name [value-pattern]
#     --[no-]rename-section rename section: old-name new-name
#     --[no-]remove-section remove a section: name
#     -l, --[no-]list       list all
#     --[no-]fixed-value    use string equality when comparing values to 'value-pattern'
#     -e, --[no-]edit       open an editor
#     --[no-]get-color      find the color configured: slot [default]
#     --[no-]get-colorbool  find the color setting: slot [stdout-is-tty]
# 
# Type
#     -t, --[no-]type <type>
#                           value is given this type
#     --bool                value is "true" or "false"
#     --int                 value is decimal number
#     --bool-or-int         value is --bool or --int
#     --bool-or-str         value is --bool or string
#     --path                value is a path (file or directory name)
#     --expiry-date         value is an expiry date
# 
# Other
#     -z, --[no-]null       terminate values with NUL byte
#     --[no-]name-only      show variable names only
#     --[no-]includes       respect include directives on lookup
#     --[no-]show-origin    show origin of config (file, standard input, blob, command line)
#     --[no-]show-scope     show scope of config (worktree, local, global, system, command)
#     --[no-]default <value>
#                           with --get, use default value when missing entry
# ----------------------------------------------------------------------------

#:begin
echo '-----------------------------------------------------'
echo ' git config -l --show-origin --show-scope'
echo '-----------------------------------------------------'
# git config -l                                     > ./GIT_CONFIG_l_so_ss
git config -l --show-origin --show-scope          > ./GIT_CONFIG_l_so_ss_current
# git config -l --show-origin --show-scope --global > ./GIT_CONFIG_l_so_ss_global
# git config -l --show-origin --show-scope --local  > ./GIT_CONFIG_l_so_ss_local
# git config -l --show-origin --show-scope --system > ./GIT_CONFIG_l_so_ss_system

#:exit
