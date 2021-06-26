CREATE OR REPLACE TRIGGER remove_items_from_cart AFTER INSERT ON amz_order
FOR EACH ROW
DECLARE
pragma autonomous_transaction;
BEGIN
DELETE FROM shopping_cart WHERE
buyer_id = :new.buyer_id;
DELETE FROM product_shopping_cart WHERE
buyer_id = :new.buyer_id; 
COMMIT;
END;


CREATE OR REPLACE TRIGGER update_available_units AFTER INSERT ON amz_order
FOR EACH ROW
DECLARE
pragma autonomous_transaction;
product_id_var INTEGER; available_units_var INTEGER; CURSOR products_cur IS SELECT
product_id FROM
order_product WHERE
order_id = :new.order_id;
BEGIN
OPEN products_cur; LOOP
FETCH products_cur INTO product_id_var; EXIT WHEN products_cur%notfound; SELECT
available_units
INTO available_units_var FROM
product WHERE
product_id = product_id_var;
IF available_units_var >= 2 THEN UPDATE product
SET
available_units = available_units - 1 WHERE
product_id = product_id_var;
ELSIF available_units_var = 1 THEN UPDATE product
SET
available_units = available_units - 1,
in_stock = 0 WHERE
product_id = product_id_var; END IF;
END LOOP;
CLOSE products_cur;
COMMIT;
END;


CREATE OR REPLACE TRIGGER update_product_rating AFTER INSERT ON review
FOR EACH ROW
DECLARE
new_rating NUMBER(2, 1); review_count_old INTEGER;
pragma autonomous_transaction;
BEGIN SELECT
count(*)
INTO review_count_old FROM
review WHERE
product_id = :NEW.product_id;
new_rating := :NEW.rating; UPDATE product
SET
rating = ( ( rating * review_count_old ) + new_rating ) / ( review_count_old + 1 )
WHERE
product_id = :new.product_id;
COMMIT;
END;


CREATE OR REPLACE TRIGGER notification_on_update
AFTER UPDATE OR INSERT
ON amz_order FOR EACH ROW
 
DECLARE
order_id_new INTEGER; status_new VARCHAR2(255);
pragma autonomous_transaction;
BEGIN SELECT
order_id
INTO order_id_new FROM
AMZ_ORDER WHERE
AMZ_ORDER.ORDER_ID = :NEW.order_id;
status_new := :NEW.status;
        INSERT INTO NOTIFICATION(ORDER_ID,MESSAGE)
        VALUES(order_id_new,status_new);
COMMIT;
END;


CREATE OR REPLACE TRIGGER initiate_refund AFTER INSERT ON product_return
FOR EACH ROW
DECLARE
new_product_id NUMBER; new_price NUMBER(8,2); temp_refund_id INTEGER;
pragma autonomous_transaction;
BEGIN SELECT
product.PRICE
INTO new_price FROM
PRODUCT WHERE
product_id = :NEW.product_id;
new_product_id := :NEW.product_id;
SELECT trunc(dbms_random.value(1,1000000)) INTO temp_refund_id from dual ;
        INSERT INTO REFUND(REFUND.AMOUNT,REFUND.PRODUCT_ID,REFUND.REFUND_ID)
        VALUES(new_price,new_product_id,temp_refund_id);
UPDATE wallet
SET
wallet.BALANCE = wallet.BALANCE + new_price
WHERE
wallet.BUYER_ID = :new.BUYER_ID;
COMMIT;
END;


---

