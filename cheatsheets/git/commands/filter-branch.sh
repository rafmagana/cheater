git filter-branch -f --index-filter 'git update-index --remove filename' HEAD
git filter-branch -f --index-filter 'git update-index --remove filename' <introduction-revision-sha1>..HEAD
git push --force --verbose --dry-run
git push --force


git-filter-branch,
git reset, 
removing the .git/refs/original/ directory, 
editing .git/packed-refs in some editor, 
running git reflog expire, 
cloning the resulting repository, 
and running git gc yet again