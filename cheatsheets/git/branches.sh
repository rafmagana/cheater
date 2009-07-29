git branch $name #Create a new local branch
git push origin $name #Create remote branch or tag based on a local one
git branch -d|-D $name #delete a local branch
git checkout -b $local_branch_name -t $remote_repo/$remote_branch_name #create a local branch and track the remote one
git checkout -t $remote_repo/$remote_branch_name #the same than the previous one (only in mac)
git push $remote_repo :$branch_or_tag_name #delete a remote branch or a remote tag