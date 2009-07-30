#create branches
git branch $branch_name #Create a new local branch
git push origin $branch_name #Create remote branch or tag based on a local one
git push origin origin:refs/heads/$branch_name #idem
git push origin master:refs/heads/$branch_name #idem

#delete branches
git branch -r -d origin/new_feature_name #delete remote branch
git branch -d|-D $branch_name #delete a local branch
git push $remote_repo :$branch_or_tag_name #delete a remote branch or a remote tag

#tracking branches
git checkout -b $local_branch_name -t $remote_repo/$remote_branch_name #create a local branch and track the remote one
git checkout -t $remote_repo/$remote_branch_name #the same than the previous one (only in mac)