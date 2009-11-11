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