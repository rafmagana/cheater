!! #run last command
source .bashrc #to not restart the terminal

ls -lSr    #List files (sorted by size)
df -h      #Show available disk space in human-readable format
du -sh /some/dir     #Show how much space /some/dir is taking up
ps aux | grep blah   #List all the running processes but only show ones that contain 'blah'
wget -spider http://0at.org  #Fetch pages and behave like a web spider: don't download the pages, just check to see if they are there
ab   #Apache benchmark use this if you want a quick n' dirty way to benchmark how well your site performs under a heavy load.
perl -i -pe 's/foo/bar/gi' *  #search through * and replace all foo with bar

#split file
split -b2047m $inputfilename #splits $inputfilename in chunks of 2gb
cat x* > $completefilename #regenerate the splitted file

#cut
cut -d : -f 1,7 /etc/passwd #extract users' login and shells

#scp
scp => http://www.hypexr.org/linux_scp_help.php

#apache
sudo apachectl start