$ cd my_local_git_repo
$ git remote add upstream git://github.com/user/repo.git
$ git fetch upstream

push your changes
	$ git push origin master

Pulling in upstream changes
	$ git fetch upstream
	$ git merge upstream/master
	
	$ git pull upstream master (alternative to fetch/merge)


