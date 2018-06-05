git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch cmu-sphinx/sphinx4-5prealpha-src.zip' --prune-empty --tag-name-filter cat -- --all

