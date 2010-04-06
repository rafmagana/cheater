**Starting from scrach**
	mkdir my-project
	cd my-project
	git init
	echo "This is my new project on Beanstalk." > README
	git add README
	git commit -m "My first commit."
	git remote add origin repo
	git push origin master
	
**Import existing files on your computer**
	cd my-project
	git init
	git remote add origin repo
	git add .
	git ci -m "Importing my project to Git, without saving history."
	git push origin master

**Import (clone) an existing SVN repository**
	git svn clone repo
	cd my-project
	git remote add origin repo
	git push origin master
	
**Move an existing Git repository**
	cd my-git-repo
	git remote add beanstalk git@acronym.beanstalkapp.com:/creatingtags.git
	git push beanstalk
	

