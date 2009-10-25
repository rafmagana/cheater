git commit --amend #
git commit -v #add a diff of the commit in the commit message

Committing
----------

git commit <file1> <file2> ... [-m <msg>]
  commit <file1>, <file2>, etc..., optionally using commit message <msg>,
  otherwise opening your editor to let you type a commit message

git commit -a
  commit all files changed since your last commit
  (does not include new (untracked) files)

git commit -v
  commit verbosely, i.e. includes the diff of the contents being committed in
  the commit message screen

git commit --amend
  edit the commit message of the most recent commit

git commit --amend <file1> <file2> ...
  redo previous commit, including changes made to <file1>, <file2>, etc...