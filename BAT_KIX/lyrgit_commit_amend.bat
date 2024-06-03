@echo off
rem -------------------------------------------------------------------
rem lyrgit_commit_amend.bat
rem ----------------------------------------------------------------------------
rem Закоммитить изменения
rem ----------------------------------------------------------------------------
rem usage: git commit [-a | --interactive | --patch] [-s] [-v] [-u<mode>] [--amend]
rem                   [--dry-run] [(-c | -C | --squash) <commit> | --fixup [(amend|reword):]<commit>)]
rem                   [-F <file> | -m <msg>] [--reset-author] [--allow-empty]
rem                   [--allow-empty-message] [--no-verify] [-e] [--author=<author>]
rem                   [--date=<date>] [--cleanup=<mode>] [--[no-]status]
rem                   [-i | -o] [--pathspec-from-file=<file> [--pathspec-file-nul]]
rem                   [(--trailer <token>[(=|:)<value>])...] [-S[<keyid>]]
rem                   [--] [<pathspec>...]
rem 
rem     -q, --[no-]quiet      suppress summary after successful commit
rem     -v, --[no-]verbose    show diff in commit message template
rem 
rem Commit message options
rem     -F, --[no-]file <file>
rem                           read message from file
rem     --[no-]author <author>
rem                           override author for commit
rem     --[no-]date <date>    override date for commit
rem     -m, --[no-]message <message>
rem                           commit message
rem     -c, --[no-]reedit-message <commit>
rem                           reuse and edit message from specified commit
rem     -C, --[no-]reuse-message <commit>
rem                           reuse message from specified commit
rem     --[no-]fixup [(amend|reword):]commit
rem                           use autosquash formatted message to fixup or amend/reword specified commit
rem     --[no-]squash <commit>
rem                           use autosquash formatted message to squash specified commit
rem     --[no-]reset-author   the commit is authored by me now (used with -C/-c/--amend)
rem     --trailer <trailer>   add custom trailer(s)
rem     -s, --[no-]signoff    add a Signed-off-by trailer
rem     -t, --[no-]template <file>
rem                           use specified template file
rem     -e, --[no-]edit       force edit of commit
rem     --[no-]cleanup <mode> how to strip spaces and #comments from message
rem     --[no-]status         include status in commit message template
rem     -S, --[no-]gpg-sign[=<key-id>]
rem                           GPG sign commit
rem 
rem Commit contents options
rem     -a, --[no-]all        commit all changed files
rem     -i, --[no-]include    add specified files to index for commit
rem     --[no-]interactive    interactively add files
rem     -p, --[no-]patch      interactively add changes
rem     -o, --[no-]only       commit only specified files
rem     -n, --no-verify       bypass pre-commit and commit-msg hooks
rem     --verify              opposite of --no-verify
rem     --[no-]dry-run        show what would be committed
rem     --[no-]short          show status concisely
rem     --[no-]branch         show branch information
rem     --[no-]ahead-behind   compute full ahead/behind values
rem     --[no-]porcelain      machine-readable output
rem     --[no-]long           show status in long format (default)
rem     -z, --[no-]null       terminate entries with NUL
rem     --[no-]amend          amend previous commit
rem     --no-post-rewrite     bypass post-rewrite hook
rem     --post-rewrite        opposite of --no-post-rewrite
rem     -u, --[no-]untracked-files[=<mode>]
rem                           show untracked files, optional modes: all, normal, no. (Default: all)
rem     --[no-]pathspec-from-file <file>
rem                           read pathspec from file
rem     --[no-]pathspec-file-nul
rem                           with --pathspec-from-file, pathspec elements are separated with NUL character
rem ----------------------------------------------------------------------------
chcp 1251

:Begin
echo ----------------------------------------------------------------------------
echo git commit -amend
echo ----------------------------------------------------------------------------
git commit -amend

:Exit
