@echo off
rem -------------------------------------------------------------------
rem lyrgit_config_local_UserEmail.bat
rem ----------------------------------------------------------------------------
rem UserEmail [local] Для конкретного проекта (эти настройки переопределят глобальные)
rem ----------------------------------------------------------------------------
rem usage: git config [<options>]
rem 
rem Config file location
rem     --[no-]global         use global config file
rem     --[no-]system         use system config file
rem     --[no-]local          use repository config file
rem     --[no-]worktree       use per-worktree config file
rem     -f, --[no-]file <file>
rem                           use given config file
rem     --[no-]blob <blob-id> read config from given blob object
rem 
rem Action
rem     --[no-]get            get value: name [value-pattern]
rem     --[no-]get-all        get all values: key [value-pattern]
rem     --[no-]get-regexp     get values for regexp: name-regex [value-pattern]
rem     --[no-]get-urlmatch   get value specific for the URL: section[.var] URL
rem     --[no-]replace-all    replace all matching variables: name value [value-pattern]
rem     --[no-]add            add a new variable: name value
rem     --[no-]unset          remove a variable: name [value-pattern]
rem     --[no-]unset-all      remove all matches: name [value-pattern]
rem     --[no-]rename-section rename section: old-name new-name
rem     --[no-]remove-section remove a section: name
rem     -l, --[no-]list       list all
rem     --[no-]fixed-value    use string equality when comparing values to 'value-pattern'
rem     -e, --[no-]edit       open an editor
rem     --[no-]get-color      find the color configured: slot [default]
rem     --[no-]get-colorbool  find the color setting: slot [stdout-is-tty]
rem 
rem Type
rem     -t, --[no-]type <type>
rem                           value is given this type
rem     --bool                value is "true" or "false"
rem     --int                 value is decimal number
rem     --bool-or-int         value is --bool or --int
rem     --bool-or-str         value is --bool or string
rem     --path                value is a path (file or directory name)
rem     --expiry-date         value is an expiry date
rem 
rem Other
rem     -z, --[no-]null       terminate values with NUL byte
rem     --[no-]name-only      show variable names only
rem     --[no-]includes       respect include directives on lookup
rem     --[no-]show-origin    show origin of config (file, standard input, blob, command line)
rem     --[no-]show-scope     show scope of config (worktree, local, global, system, command)
rem     --[no-]default <value>
rem                           with --get, use default value when missing entry
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
SET UserEmail=%1
goto begin_git
:P1_Input
set /p UserEmail=UserEmail:
if "%UserEmail%" == "" goto P1_Error
goto begin_git
:P1_Error
echo Parametr UserEmail not set
goto Exit

:begin_git
echo ----------------------------------------------------------------------------
echo git config --local user.email "%UserEmail%"
echo ----------------------------------------------------------------------------
git config --local user.email %UserEmail%

:Exit
