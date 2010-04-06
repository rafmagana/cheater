Merging
-------

git merge <branch>
  merge branch <branch> into the current branch; this command is idempotent and
  can be run as many times as needed to keep the current branch up-to-date with
  changes in <branch>

git merge <branch> --no-commit
  merge branch <branch> into the current branch, but do not autocommit the
  result; allows you to make further tweaks

git merge <branch> -s ours
  merge branch <branch> into the current branch, but drops any changes in
  <branch>, using the current tree as the new tree