git log #show recent commits, most recent on top. 

Useful options:
  --color       #with color
  --graph       #with an ASCII-art commit graph on the left
  --decorate    #with branch and tag names on appropriate commits
  --stat        #with stats (files changed, insertions, and deletions)
  -p            #with full diffs
  --author=foo  #only by a certain author
  --after="MMM DD YYYY" ex. ("Jun 20 2008") #only commits after a certain date
  --before="MMM DD YYYY" #only commits that occur before a certain date
  --merge       #only the commits involved in the current merge conflicts

git log -M 					#will give the commit history with rename information
git log -g 					#will show lost commits
git log $branch1..$branch2 	#different commits between $branch1 and $branch2. ie. "git log local..remote"
git log <commit>.. $file 	#commits since <commit> which modify $file
git log --graph #show the graph in ascii
git log --pretty=oneline --graph --all #show the graph of all commit, one commit per line
git log --oneline --date-order --graph --all --decorate #gitx-like presentation