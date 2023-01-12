@echo off
rem -------------------------------------------------------------------
rem git commit -a -m "%Comment%"
rem -------------------------------------------------------------------
rem usage: git commit [-a | --interactive | --patch] [-s] [-v] [-u<mode>] [--amend]
rem                   [--dry-run] [(-c | -C | --squash) <commit> | --fixup [(amend|reword):]<commit>)]
rem                   [-F <file> | -m <msg>] [--reset-author] [--allow-empty]
rem                   [--allow-empty-message] [--no-verify] [-e] [--author=<author>]
rem                   [--date=<date>] [--cleanup=<mode>] [--[no-]status]
rem                   [-i | -o] [--pathspec-from-file=<file> [--pathspec-file-nul]]
rem                   [(--trailer <token>[(=|:)<value>])...] [-S[<keyid>]]
rem                   [--] [<pathspec>...]
rem 
rem     -q, --quiet           suppress summary after successful commit
rem     -v, --verbose         show diff in commit message template
rem 
rem Commit message options
rem     -F, --file <file>     read message from file
rem     --author <author>     override author for commit
rem     --date <date>         override date for commit
rem     -m, --message <message>
rem                           commit message
rem     -c, --reedit-message <commit>
rem                           reuse and edit message from specified commit
rem     -C, --reuse-message <commit>
rem                           reuse message from specified commit
rem     --fixup [(amend|reword):]commit
rem                           use autosquash formatted message to fixup or amend/reword specified commit
rem     --squash <commit>     use autosquash formatted message to squash specified commit
rem     --reset-author        the commit is authored by me now (used with -C/-c/--amend)
rem     --trailer <trailer>   add custom trailer(s)
rem     -s, --signoff         add a Signed-off-by trailer
rem     -t, --template <file>
rem                           use specified template file
rem     -e, --edit            force edit of commit
rem     --cleanup <mode>      how to strip spaces and #comments from message
rem     --status              include status in commit message template
rem     -S, --gpg-sign[=<key-id>]
rem                           GPG sign commit
rem 
rem Commit contents options
rem     -a, --all             commit all changed files
rem     -i, --include         add specified files to index for commit
rem     --interactive         interactively add files
rem     -p, --patch           interactively add changes
rem     -o, --only            commit only specified files
rem     -n, --no-verify       bypass pre-commit and commit-msg hooks
rem     --dry-run             show what would be committed
rem     --short               show status concisely
rem     --branch              show branch information
rem     --ahead-behind        compute full ahead/behind values
rem     --porcelain           machine-readable output
rem     --long                show status in long format (default)
rem     -z, --null            terminate entries with NUL
rem     --amend               amend previous commit
rem     --no-post-rewrite     bypass post-rewrite hook
rem     -u, --untracked-files[=<mode>]
rem                           show untracked files, optional modes: all, normal, no. (Default: all)
rem     --pathspec-from-file <file>
rem                           read pathspec from file
rem     --pathspec-file-nul   with --pathspec-from-file, pathspec elements are separated with NUL character
rem 
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p Comment=Комментарий:
if "%Comment%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра "Comment" не установлено
goto Exit
rem -------------------------------------------------------------------

:Begin
git commit -a -m "%Comment%"

:Exit
