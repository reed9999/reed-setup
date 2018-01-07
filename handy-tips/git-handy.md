# Handy git tips

## Change a remote
http://help.github.com/articles/changing-a-remote-s-url/

git remote set-url origin https://github.com/reed9999/OpenNMT


## Fix line endings
git config core.autocrlf false


## How to clean up big or sensitive files after they get pushed
https://rtyley.github.io/bfg-repo-cleaner/

## Find big files first
find . -size +1G | cat >> .gitignore
https://stackoverflow.com/questions/4035779/gitignore-by-file-size

## Reverse .gitignore
https://stackoverflow.com/questions/987142/make-gitignore-ignore-everything-except-a-few-files
use a !
