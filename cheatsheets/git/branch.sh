#create branches
git branch $branch_name #Create a new local branch
git push origin $branch_name #Create remote branch or tag based on a local one
git push origin origin:refs/heads/$branch_name #idem
git push origin master:refs/heads/$branch_name #idem
git push origin :/heads/branchname #deletes branchname

#delete branches
git branch -r -d origin/new_feature_name #delete remote branch
git branch -d|-D $branch_name #delete a local branch
git push $remote_repo :$branch_or_tag_name #delete a remote branch or a remote tag

#tracking branches
git checkout -b $local_branch_name -t $remote_repo/$remote_branch_name #create a local branch and track the remote one
git checkout -t $remote_repo/$remote_branch_name #the same than the previous one (only in mac)

#Branching
#---------

git branch
  list all local branches

git branch -r
  list all remote branches

git branch -a
  list all local and remote branches

git branch <branch>
  create a new branch named <branch>, referencing the same point in history as
  the current branch

git branch <branch> <start-point>
  create a new branch named <branch>, referencing <start-point>, which may be
  specified any way you like, including using a branch name or a tag name

git branch --track <branch> <remote-branch>
  create a tracking branch. Will push/pull changes to/from another repository.
  Example: git branch --track experimental origin/experimental

git branch -d <branch>
  delete the branch <branch>; if the branch you are deleting points to a commit
  which is not reachable from the current branch, this command will fail with a
  warning.

git branch -r -d <remote-branch>
  delete a remote-tracking branch.
  Example: git branch -r -d wycats/master

git branch -D <branch>
  even if the branch points to a commit not reachable from the current branch,
  you may know that that commit is still reachable from some other branch or
  tag. In that case it is safe to use this command to force git to delete the
  branch.

git checkout <branch>
  make the current branch <branch>, updating the working directory to reflect
  the version referenced by <branch>

git checkout -b <new> <start-point>
  create a new branch <new> referencing <start-point>, and check it out.

git push <repository> :<branch>
  removes a branch from a remote repository.
  Example: git push origin :old_branch_to_be_deleted