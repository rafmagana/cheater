#MYSQL MISC QUERIES
SHOW innodb STATUS;

UPDATE [LOW_PRIORITY] [IGNORE] table_references
    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...
    [WHERE where_condition]

SELECT TABLE_NAME 
	FROM information_schema.COLUMNS 
	WHERE TABLE_SCHEMA = ‘dbName’ and COLUMN_NAME like ‘%ColName%’; #search a column name in all the tables