git stash list #list the current stashes
git reflog show stash #idem
git stash save "a message" #saves the stash with a custom message
git stash show $stash_number #show the stat of files included in the stash
git stash show $stash_number -p #show the contents of a stash - accepts all diff args
git stash pop #restore the changes from the most recent stash, and remove it from the stack of stashed changes
git stash clear #delete current stashes