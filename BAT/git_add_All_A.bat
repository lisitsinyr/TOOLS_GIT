@echo off
rem -------------------------------------------------------------------
rem git add -A|--all
rem -------------------------------------------------------------------
rem usage: git add [<options>] [--] <pathspec>...
rem 
rem     -n, --dry-run         dry run
rem     -v, --verbose         be verbose
rem 
rem     -i, --interactive     interactive picking
rem     -p, --patch           select hunks interactively
rem     -e, --edit            edit current diff and apply
rem     -f, --force           allow adding otherwise ignored files
rem     -u, --update          update tracked files
rem     --renormalize         renormalize EOL of tracked files (implies -u)
rem     -N, --intent-to-add   record only the fact that the path will be added later
rem     -A, --all             add changes from all tracked and untracked files
rem     --ignore-removal      ignore paths removed in the working tree (same as --no-all)
rem     --refresh             don't add, only refresh the index
rem     --ignore-errors       just skip files which cannot be added because of errors
rem     --ignore-missing      check if - even missing - files are ignored in dry run
rem     --sparse              allow updating entries outside of the sparse-checkout cone
rem     --chmod (+|-)x        override the executable bit of the listed files
rem     --pathspec-from-file <file>
rem                           read pathspec from file
rem     --pathspec-file-nul   with --pathspec-from-file, pathspec elements are separated with NUL character
rem -------------------------------------------------------------------
chcp 1251

:begin
git add -A

:Exit
