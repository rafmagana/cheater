git svn clone -A authors_file -s --revision=from:to url
#create tags based on "tags/tag_name" branches
git gc #garbage collector
git clone --mirror local_repo local_repo.git #creates a bare mirror clone of the cleaned up git repository
git remote add origin the_url_of_the_remote
git push --mirror git://url_git_repo # The mirror option ensures a 1:1 copy including all branches and tags.