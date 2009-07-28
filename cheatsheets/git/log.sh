git log -M 					#will give the commit history with rename information
git log -g 					#will show lost commits
git log $branch1..$branch2 	#different commits between $branch1 and $branch2. ie. "git log local..remote"
git log <commit>.. $file 	#commits since v2.5 which modify $file