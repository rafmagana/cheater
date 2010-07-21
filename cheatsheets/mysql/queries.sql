#MYSQL QUERIES

#SELECTING RECORDS
SELECT TABLE_NAME 
	FROM information_schema.COLUMNS 
	WHERE TABLE_SCHEMA = ‘dbName’ and COLUMN_NAME like ‘%ColName%’; #search a column name in all the tables

SELECT * FROM {table} WHERE {field} RLIKE "^regexp$";
SELECT * FROM {table} WHERE {field} LIKE "%card-igan%";
SELECT * FROM {table} WHERE {field}={value};
SELECT * FROM {table};
select email, count(email) as cnt from accounts group by email having cnt > 1 order by cnt;

#UPDATING RECORDS
UPDATE [LOW_PRIORITY] [IGNORE] table_references
    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...
    [WHERE where_condition]

UPDATE {table} SET {field}={value} WHERE {field}={value};
UPDATE twitter_messages SET state="new" WHERE product_id=6114;
UPDATE $table_name SET $col1 = "new_value" WHERE $record_name = "value";

#DELETING RECORDS
delete from twitter_messages where product_id=6755;
delete from short_urls where product_id=6755;
delete from twitter_messages where product_id=6098;
delete from short_urls where product_id=6098;
TRUNCATE TABLE {table};

#INSERTING RECORDS
INSERT INTO $table_name VALUES ('MyName', 'MyOwner', '2002-08-31');
INSERT INTO $table_name (col1,col2) VALUES ("col1", "col2");

#DELETING TABLES
DROP TABLE {table}

#TABLE MODIFICATION
ALTER TABLE tbl ADD COLUMN [column_create syntax] AFTER col_name;
ALTER IGNORE TABLE $table_name ADD UNIQUE INDEX($column1,$column2);
ALTER TABLE $table_name DROP COLUMN $col;

#CREATING USERS
CREATE USER 'monty'@'localhost' IDENTIFIED BY 'some_pass';

#PERMISSIONS
SHOW GRANTS FOR 'user_name'@'localhost';
GRANT ALL ON {database}.* TO {user};


#CHARSET AND COLLATION
ALTER TABLE 'table_name' DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci
ALTER TABLE 'table_name' CHANGE 'table_name' 'table_name' VARCHAR( 150 ) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
ALTER TABLE 'table_name' CHANGE 'table_name' 'table_name' VARCHAR( 150 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
ALTER TABLE 'table_name' DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ALTER TABLE 'table_name' DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci
ALTER TABLE 'table_name' DEFAULT CHARACTER SET utf8 COLLATE utf8_bin

ALTER DATABASE $database DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci

###Schemas
RENAME {DATABASE | SCHEMA} db_name TO new_db_name;

##Gathering information about the tables
select table_name, table_rows, data_length, index_length from information_schema.partitions where TABLE_SCHEMA={database_name};

#MYSQL MISC QUERIES
SHOW innodb STATUS;