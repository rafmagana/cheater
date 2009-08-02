#MYSQL QUERIES
################## LOCAL ###################
SELECT * FROM table WHERE field rlike "^regexp$";

UPDATE products SET state="ready_to_launch" WHERE id=6098;

select * from products where name LIKE "%card-igan%";

select * from products where id=6490;
select * from twitter_messages where product_id=6490;
select * from short_urls where product_id=6490;
UPDATE products SET state="ready_to_launch" WHERE id=6490;

delete from twitter_messages where product_id=6755;
delete from short_urls where product_id=6755;
	
	
################## STAGE ###################
SELECT MAX(run_at) FROM delayed_jobs;
SELECT MAX(id) FROM products;

UPDATE products SET state="ready_to_launch" WHERE id=6083;
UPDATE products SET state="ready_to_launch" WHERE id=6085;
UPDATE products SET state="ready_to_launch" WHERE id=6114;
UPDATE products SET state="active" WHERE id=6085;

UPDATE twitter_messages SET state="new" WHERE id=5;
UPDATE twitter_messages SET state="new" WHERE id=20;

UPDATE twitter_messages SET twitter_send=0 WHERE id=5;
UPDATE twitter_messages SET twitter_send=0 WHERE id=20;

UPDATE twitter_messages SET twitter_send=1 WHERE id=5;
UPDATE twitter_messages SET twitter_send=1 WHERE id=20;

SELECT * from twitter_messages;
TRUNCATE TABLE delayed_jobs;

SELECT * FROM delayed_jobs;
SELECT * FROM products where id=6114;
SELECT * FROM twitter_messages where product_id=6114;
UPDATE twitter_messages SET state="new" WHERE product_id=6114;

SELECT * FROM products where name="testing14";
UPDATE products SET state="ready_to_launch" WHERE id=6098;
select * from twitter_messages where product_id=6098;
select * from short_urls where product_id=6098;
delete from twitter_messages where product_id=6098;
delete from short_urls where product_id=6098;
	
########### GENERAL ########
INSERT INTO $table_name VALUES ('MyName', 'MyOwner', '2002-08-31');
UPDATE $table_name SET $col1 = "new_value" WHERE $record_name = "value";
ALTER TABLE tbl ADD COLUMN [column_create syntax] AFTER col_name;
ALTER IGNORE TABLE $table_name ADD UNIQUE INDEX($column1,$column2);
ALTER TABLE $table_name DROP COLUMN $col;

###from bash
mysql -u user -p < batch_file #(Use -t for nice table layout and -vvv for command echoing.)
mysql> source batch_file;


select email, count(email) as cnt from accounts group by email having cnt > 1 order by cnt;