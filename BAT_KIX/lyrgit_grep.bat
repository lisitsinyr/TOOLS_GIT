@echo off
rem -------------------------------------------------------------------
rem lyrgit_grep.bat
rem ----------------------------------------------------------------------------
rem Печатать строки, соответствующие шаблону
rem ----------------------------------------------------------------------------
rem usage: git grep [<options>] [-e] <pattern> [<rev>...] [[--] <path>...]
rem 
rem     --[no-]cached         search in index instead of in the work tree
rem     --no-index            find in contents not managed by git
rem     --index               opposite of --no-index
rem     --[no-]untracked      search in both tracked and untracked files
rem     --[no-]exclude-standard
rem                           ignore files specified via '.gitignore'
rem     --[no-]recurse-submodules
rem                           recursively search in each submodule
rem 
rem     -v, --[no-]invert-match
rem                           show non-matching lines
rem     -i, --[no-]ignore-case
rem                           case insensitive matching
rem     -w, --[no-]word-regexp
rem                           match patterns only at word boundaries
rem     -a, --[no-]text       process binary files as text
rem     -I                    don't match patterns in binary files
rem     --[no-]textconv       process binary files with textconv filters
rem     -r, --[no-]recursive  search in subdirectories (default)
rem     --max-depth <n>       descend at most <n> levels
rem 
rem     -E, --[no-]extended-regexp
rem                           use extended POSIX regular expressions
rem     -G, --[no-]basic-regexp
rem                           use basic POSIX regular expressions (default)
rem     -F, --[no-]fixed-strings
rem                           interpret patterns as fixed strings
rem     -P, --[no-]perl-regexp
rem                           use Perl-compatible regular expressions
rem 
rem     -n, --[no-]line-number
rem                           show line numbers
rem     --[no-]column         show column number of first match
rem     -h                    don't show filenames
rem     -H                    show filenames
rem     --[no-]full-name      show filenames relative to top directory
rem     -l, --[no-]files-with-matches
rem                           show only filenames instead of matching lines
rem     --[no-]name-only      synonym for --files-with-matches
rem     -L, --[no-]files-without-match
rem                           show only the names of files without match
rem     -z, --[no-]null       print NUL after filenames
rem     -o, --[no-]only-matching
rem                           show only matching parts of a line
rem     -c, --[no-]count      show the number of matches instead of matching lines
rem     --[no-]color[=<when>] highlight matches
rem     --[no-]break          print empty line between matches from different files
rem     --[no-]heading        show filename only once above matches from same file
rem 
rem     -C, --[no-]context <n>
rem                           show <n> context lines before and after matches
rem     -B, --[no-]before-context <n>
rem                           show <n> context lines before matches
rem     -A, --[no-]after-context <n>
rem                           show <n> context lines after matches
rem     --[no-]threads <n>    use <n> worker threads
rem     -NUM                  shortcut for -C NUM
rem     -p, --[no-]show-function
rem                           show a line with the function name before matches
rem     -W, --[no-]function-context
rem                           show the surrounding function
rem 
rem     -f <file>             read patterns from file
rem     -e <pattern>          match <pattern>
rem     --and                 combine patterns specified with -e
rem     --or
rem     --not
rem     (
rem     )
rem     -q, --[no-]quiet      indicate hit with exit status without output
rem     --[no-]all-match      show only matches from files that match all patterns
rem 
rem     -O, --[no-]open-files-in-pager[=<pager>]
rem                           show matching files in the pager
rem     --[no-]ext-grep       allow calling of grep(1) (ignored by this build)
rem     -m, --[no-]max-count <n>
rem                           maximum number of results per file
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo git grep
echo ----------------------------------------------------------------------------
git grep

:Exit
