# mysql-indexing
Create a table named product(Fields: id, product_name, product_code, product_description)
- Create a table named order(id, order_id)
- Create a table named order item(id, product_id, order_id)

(From product to order relationship is 1 to many. From order_item to product relationship is 1 to many)

- Insert some data into these tables.
- Every table must have a primary key. 
- Apply unique index on product_code and order_id column of product and order table.
- Apply fulltext search on product_description. 
- Apply the composite index on product_code and product_description.

Test with various select queries and check the query execution plan with EXPLAIN command
