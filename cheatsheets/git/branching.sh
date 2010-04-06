Remote branches
	dev
	prod or master (integration)
	stage (intrgration)
	test (for testing stuff, it could be rolled back to any position)
	pu (proposed updates)
	
Topic branches
	make one branch for every topic
	Rule:  Make a side branch for every feature, bugfix. Fork it off at the oldest integration branch that you will eventually want to merge it into.

As a given feature goes from experimental to stable, it also "graduates" between the corresponding branches of the software. 
git uses the following integration branches:

maint => tracks the commits that should go into the next "maintenance release", i.e., update of the last released stable version;
master => tracks the commits that should go into the next release;
next => is intended as a testing branch for topics being tested for stability for master.

==========================


Repo EKOS
	Flex (branch)
		depends on AcronymUIComponents (turn into a repo)
		depends on SEOLabsCommonLib (a branch)
	Rails (branch)