http://www.pantz.org/software/mysql/mysqlcommands.html

mysqlcheck -u root -p –auto-repair –check –optimize –all-databases #issue it every week to improve performance
mysql -u USER -p DBNAME < dump.sql
	
#DUMP SCHEMA (structure)
mysqldump -d -h {host} -u {user} -p {password} {database} > {dumpfile.sql}
mysqldump -u{user} -p{pass} --skip-triggers --compact --no-create-info {database} > {dumpfile.sql}

#import files
mysql -u root -p -vvf database < file
mysql -u root -p -vvf < file (si el archivo tiene CREATE )