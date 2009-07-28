git branch $name #Create a new local branch
git push origin $name #Create remote branch based on a local one
git branch -d $name #delete a local branch
git checkout -b $local_branch_name -t $remote_repo/$remote_branch_name #create a local branch a track the remote one
git push $remote_repo :$branch_or_tag_name #delete a remote branch or a remote tag