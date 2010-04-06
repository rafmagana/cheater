#MYSQL QUERIES

#SELECTING RECORDS
SELECT * FROM {table} WHERE {field} RLIKE "^regexp$";
SELECT * FROM {table} WHERE {field} LIKE "%card-igan%";
SELECT * FROM {table} WHERE {field}={value};
SELECT * FROM {table};
select email, count(email) as cnt from accounts group by email having cnt > 1 order by cnt;

#UPDATING RECORDS
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

###Schemas
RENAME {DATABASE | SCHEMA} db_name TO new_db_name;

##Gathering information about the tables
select table_name, table_rows, data_length, index_length from information_schema.partitions where TABLE_SCHEMA={database_name};