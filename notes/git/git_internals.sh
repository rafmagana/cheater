#INTERNALS

#THE GIT OBJECT MODEL
*Every object consists of three things: a type, a size and content
*There four different types of objects: blob, tree, commit and tag
	<blob>:		used to store file data - generally a file
	<tree>: 	like a directory - it references other trees or blobs
	<commit>: 	points to a single tree. it is a point in the time. points to the previous commits (parents)
	<tag>:		marks a specific commit
	
	All the files have mode 644 or 755, git only pays attention to the executable bit.

#GIT WORKING DIRECTORY
*it stores all the history and meta information of a project
 	-all of the objects
	-pointers to where different branches are, etc.
*there is only one git directory per project (opposed to one per subdirectory as SVN or CVS)
*the default name is .git (not necessarily) and it is in the root of the project (not necessarily)