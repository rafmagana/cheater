INTERNALS
=========

What is Git?
------------

Git is a stupid content tracker. It's a file system.
Git tracks content.
Git is a collection of simple tools that implement a tree history storage and directory CMS.
It is simply used as an SCM, not really designed as one.
Git is less a program and more a toolkit (porcelain and plumbing).

When most SMCs store a new version of a project, they store the code delta or diff.
When Git stores a new version of a project, it stores a new tree - a bunch of blobs of content.
If you want a diff between two versions, it doesn't add up all the deltas, it simply looks at the two trees and runs a new diff on them.

*What is git good for?*
	*Non-linear Development
	*Distributed Development
	*Efficiency

The Git Object Model		
--------------------

_Every object consists of three things: a type, a size and content_
_There four different types of objects: blob, tree, commit and tag_
	*<blob>:	used to store file data - generally a file
	*<tree>: 	like a directory - it references other trees or blobs
	*<commit>: 	points to a single tree and keeps author, committer, message and parent commits.
	*<tag>:		marks a specific commit, or even a blob
	
	All the files have mode 644 or 755, git only pays attention to the executable bit.
	
	*Objects are immutable.
	
The Git Data Model
------------------
 *1. The Git object data is a directed acyclic graph.* 
 *2. All commit objects point to a tree and optionally to previous commits.* 
 *3. All trees point to one or many blobs and/or trees.* 
	
	**References**
	Pointers to a particualr commit.
	A branch and a remote are examples of references
	
	* Each time you edit a file a new blob is added and its parent tree is changed as well.

Branching and Merging
---------------------

Remotes
-------



GIT WORKING DIRECTORY
*it stores all the history and meta information of a project
 	-all of the objects
	-pointers to where different branches are, etc.
*there is only one git directory per project (opposed to one per subdirectory as SVN or CVS)
*the default name is .git (not necessarily) and it is in the root of the project (not necessarily)