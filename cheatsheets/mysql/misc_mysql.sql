#MYSQL MISC QUERIES
SHOW innodb STATUS;

UPDATE [LOW_PRIORITY] [IGNORE] table_references
    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...
    [WHERE where_condition]

INSERT INTO tbl_name (col1,col2) VALUES(col2*2,15);

mysql -u USER -p DBNAME < dump.sql

SELECT TABLE_NAME 
	FROM information_schema.COLUMNS 
	WHERE TABLE_SCHEMA = ‘dbName’ and COLUMN_NAME like ‘%ColName%’; #search a column name in all the tables
	
#DELETE
DROP DATABASE $database_name

#DUMP SCHEMA (structure)
mysqldump -d -h {host} -u {user} -p {password} {database} > {dumpfile.sql}
mysqldump -u{user} -p{pass} --skip-triggers --compact --no-create-info {database} > {dumpfile.sql}


#CHARSET AND COLLATION
ALTER TABLE 'table_name' DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci
ALTER TABLE 'table_name' CHANGE 'table_name' 'table_name' VARCHAR( 150 ) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
ALTER TABLE 'table_name' CHANGE 'table_name' 'table_name' VARCHAR( 150 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
ALTER TABLE 'table_name' DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ALTER TABLE 'table_name' DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci
ALTER TABLE 'table_name' DEFAULT CHARACTER SET utf8 COLLATE utf8_bin

ALTER DATABASE $database DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci

#PAGER
pager less

#CREATE USER
CREATE USER 'user_name'@'server' IDENTIFIED BY 'the_pass';

#PERMISSIONS
GRANT ALL ON {database}.* TO {user};

http://www.pantz.org/software/mysql/mysqlcommands.html

mysqlcheck -u root -p –auto-repair –check –optimize –all-databases #issue it every week to improve performance