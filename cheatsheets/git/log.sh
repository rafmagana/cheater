git log -M 					#will give the commit history with rename information
git log -g 					#will show lost commits
git log $branch1..$branch2 	#different commits between $branch1 and $branch2. ie. "git log local..remote"
git log <commit>.. $file 	#commits since <commit> which modify $file
git log --graph #show the graph in ascii
git log --pretty=oneline --graph --all #show the graph of all commit, one commit per line