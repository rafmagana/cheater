#git misc

#CLEAN
git clean -n #show what would be and would not be removed with "git clean -f"

#DIFF
git diff --binary HEAD > tempPatch.diff #create a diff patch
git diff <commit1>:path/file <commit2>:otherpath/otherfile #make a diff between two arbitrary files in different revisions
git diff --cached <file>|empty #diff of files in index
git diff -p #see complete diffs of commits

#crazy things
git hash-object -w <path/file> #returns the SHA1 of the object
git reflog

#GENERAL
The inverse of 'git add <file>' is 'git reset HEAD -- <file>' not 'git rm <file>'
git rm --cached <filename> #If you want to keep a file, but not have it in the next revision
git ls-files -o --exclude-standard #show untracked files
git show-ref --hash $branch_name #show two different SHA1s if local and remote are in different commit