CREATE TABLE AMAZON_USER (
email VARCHAR(255) PRIMARY KEY,
fname VARCHAR(255) NOT NULL,
lname VARCHAR(255),
password VARCHAR(30) NOT NULL,
user_type VARCHAR(10)  NOT NULL,
customer_rep_id integer
);

CREATE TABLE contact_detail (
address_id INTEGER PRIMARY KEY,
email VARCHAR(255) NOT NULL,
street VARCHAR(100) NOT NULL,
city VARCHAR(30) NOT NULL,
state VARCHAR(30) NOT NULL,
country VARCHAR(30) NOT NULL,
zipcode NUMBER(5) NOT NULL,
phone VARCHAR(15) NOT NULL,
is_default NUMBER(1) DEFAULT 0
);

CREATE TABLE amz_order (
order_id INTEGER PRIMARY KEY,
buyer_id VARCHAR(255) NOT NULL,
payment_id INTEGER NOT NULL,
total_price NUMBER(10, 2),
order_date DATE,
address_id INTEGER,
delivery_date DATE,
status VARCHAR(255) NOT NULL,
quantity INTEGER NOT NULL
);

CREATE TABLE payment (
payment_id INTEGER PRIMARY KEY,
invoice VARCHAR(255) NOT NULL,
payment_mode VARCHAR(255) NOT NULL,
status VARCHAR(255) NOT NULL,
instrument_id INTEGER
);

CREATE TABLE card (
card_no INTEGER PRIMARY KEY,
expiry DATE,
cvv INTEGER NOT NULL,
card_type VARCHAR(255) NOT NULL,
card_name VARCHAR(255) NOT NULL,
payment_id INTEGER,
buyer_id VARCHAR(255)
);

CREATE TABLE wallet (
wallet_id INTEGER PRIMARY KEY,
balance INTEGER NOT NULL,
payment_id INTEGER,
buyer_id VARCHAR(255)
);

CREATE TABLE buyer (
buyer_id VARCHAR(255) PRIMARY KEY,
is_prime VARCHAR(10) DEFAULT 'no',
prime_expiry_date DATE
);

CREATE TABLE seller (
seller_id VARCHAR(255) PRIMARY KEY,
name VARCHAR(255) NOT NULL,
rating NUMBER(2, 1) 
);


CREATE TABLE coupon (
coupon_id INTEGER PRIMARY KEY,
expiry_date DATE,
redeem_code VARCHAR(255) NOT NULL,
buyer_id VARCHAR(255),
wallet_id INTEGER,
coupon_value INTEGER
);

CREATE TABLE product (
product_id INTEGER PRIMARY KEY,
seller_id VARCHAR(255) NOT NULL,
name VARCHAR(255) NOT NULL,
description VARCHAR(200),
available_units INTEGER,
price NUMBER(8, 2) NOT NULL,
weight NUMBER(8, 2),
rating NUMBER(2, 1),
category_id INTEGER,
color VARCHAR(25),
in_stock NUMBER(1),
shipper_id INTEGER
);

CREATE TABLE product_image (
product_id INTEGER,
image_url VARCHAR(255),
PRIMARY KEY ( product_id,image_url )
);

CREATE TABLE review (
review_id INTEGER PRIMARY KEY,
product_id INTEGER,
buyer_id VARCHAR(255),
description VARCHAR(255),
rating INTEGER NOT NULL
);

CREATE TABLE shipper (
shipper_id INTEGER PRIMARY KEY,
phone INTEGER NOT NULL,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL
);

CREATE TABLE customer_support (
customer_rep_id INTEGER PRIMARY KEY,
helpline_no INTEGER NOT NULL,
assigned_to VARCHAR(255),
rating NUMBER(38)
);

CREATE TABLE return (
buyer_id VARCHAR(255),
return_date DATE
);


CREATE TABLE product_return (
buyer_id VARCHAR(255),
product_id INTEGER
);


CREATE TABLE order_product (
order_id INTEGER,
product_id INTEGER,
PRIMARY KEY ( order_id, product_id )
);
 
CREATE TABLE wishlist (
buyer_id VARCHAR(255),
date_added DATE
);
 
CREATE TABLE product_wishlist (
product_id INTEGER,
buyer_id VARCHAR(255),
PRIMARY KEY ( product_id, buyer_id )
);
 
CREATE TABLE shopping_cart (
buyer_id VARCHAR(255),
date_added DATE
);
 
CREATE TABLE product_shopping_cart (
product_id INTEGER,
buyer_id VARCHAR(255),
PRIMARY KEY ( product_id, buyer_id )
);
 
CREATE TABLE buy_now (
buyer_id VARCHAR(255),
date_bought DATE
);
 
CREATE TABLE product_buy_now (
product_id INTEGER,
buyer_id VARCHAR(255),
PRIMARY KEY ( product_id, buyer_id )
);

CREATE TABLE category (
category_id INTEGER PRIMARY KEY,
category_name VARCHAR(255) NOT NULL
);

CREATE TABLE refund (
amount INTEGER,
product_id INTEGER,
refund_id INTEGER PRIMARY KEY
);



ALTER TABLE contact_detail
ADD CONSTRAINT contact_detail_user_email_fk FOREIGN KEY (email)
REFERENCES amazon_user (email)
ON DELETE CASCADE;
 
ALTER TABLE product
ADD CONSTRAINT product_seller_id_fk FOREIGN KEY ( seller_id )
REFERENCES seller (seller_id)
ON DELETE CASCADE;
 
ALTER TABLE product
ADD CONSTRAINT product_category_id_fk FOREIGN KEY ( category_id )
REFERENCES category (category_id)
ON DELETE CASCADE;  
 
ALTER TABLE product
ADD CONSTRAINT product_shipper_id_fk FOREIGN KEY ( shipper_id )
REFERENCES shipper (shipper_id)
ON DELETE CASCADE;
 
ALTER TABLE shopping_cart
ADD CONSTRAINT shopping_cart_buyer_id_fk FOREIGN KEY ( buyer_id )
REFERENCES buyer (buyer_id)
ON DELETE CASCADE;
 
ALTER TABLE product_shopping_cart
ADD CONSTRAINT product_sh_ca_buyer_id_fk FOREIGN KEY ( buyer_id )
REFERENCES buyer (buyer_id)
ON DELETE CASCADE;
 
ALTER TABLE product_shopping_cart
ADD CONSTRAINT product_sh_ca_product_id_fk FOREIGN KEY ( product_id )
REFERENCES product (product_id)
ON DELETE CASCADE;

ALTER TABLE amz_order
ADD CONSTRAINT order_buyer_id_fk FOREIGN KEY ( buyer_id )
REFERENCES buyer ( buyer_id )
ON DELETE CASCADE;

ALTER TABLE amz_order
ADD CONSTRAINT payment_id_fk FOREIGN KEY ( payment_id )
REFERENCES payment ( payment_id )
ON DELETE CASCADE;


ALTER TABLE card
ADD CONSTRAINT card_payment_fk FOREIGN KEY ( payment_id )
REFERENCES payment ( payment_id )
ON DELETE CASCADE;

ALTER TABLE wallet
ADD CONSTRAINT wallet_payment_fk FOREIGN KEY ( payment_id )
REFERENCES payment ( payment_id )
ON DELETE CASCADE;

ALTER TABLE coupon
ADD CONSTRAINT coupon_buyer_id_fk FOREIGN KEY ( buyer_id )
REFERENCES buyer ( buyer_id )
ON DELETE CASCADE;

ALTER TABLE coupon
ADD CONSTRAINT coupon_wallet_id_fk FOREIGN KEY ( wallet_id )
REFERENCES wallet ( wallet_id )
ON DELETE CASCADE;

ALTER TABLE return
ADD CONSTRAINT return_buyer_id_fk FOREIGN KEY ( buyer_id )
REFERENCES buyer ( buyer_id )
ON DELETE CASCADE;

ALTER TABLE product_return
ADD CONSTRAINT product_return_buyer_id_fk FOREIGN KEY ( buyer_id )
REFERENCES buyer ( buyer_id )
ON DELETE CASCADE;

ALTER TABLE product_return
ADD CONSTRAINT product_return_product_id_fk FOREIGN KEY ( product_id )
REFERENCES product ( product_id )
ON DELETE CASCADE;


ALTER TABLE review
ADD CONSTRAINT review_buyer_id_fk FOREIGN KEY ( buyer_id )
REFERENCES buyer ( buyer_id )
ON DELETE CASCADE;

ALTER TABLE review
ADD CONSTRAINT review_product_id_fk FOREIGN KEY ( product_id )
REFERENCES product ( product_id )
ON DELETE CASCADE;

ALTER TABLE wishlist
ADD CONSTRAINT wishlist_buyer_id_fk FOREIGN KEY ( buyer_id )
REFERENCES buyer ( buyer_id )
ON DELETE CASCADE;
 
ALTER TABLE product_wishlist
ADD CONSTRAINT product_wishlist_product_id_fk FOREIGN KEY ( product_id )
REFERENCES product ( product_id )
ON DELETE CASCADE;
 
ALTER TABLE product_wishlist
ADD CONSTRAINT product_wishlist_buyer_id_fk FOREIGN KEY ( buyer_id )
REFERENCES buyer ( buyer_id )
ON DELETE CASCADE;
 
ALTER TABLE order_product
ADD CONSTRAINT order_product_order_id_fk FOREIGN KEY (order_id)
REFERENCES amz_order ( order_id )
ON DELETE CASCADE;
 
ALTER TABLE order_product
ADD CONSTRAINT order_product_product_id_fk FOREIGN KEY (product_id)
REFERENCES product ( product_id )
ON DELETE CASCADE;
 
ALTER TABLE buy_now
ADD CONSTRAINT buy_now_buyer_id_fk FOREIGN KEY ( buyer_id )
REFERENCES buyer (buyer_id)
ON DELETE CASCADE;
 
ALTER TABLE product_buy_now
ADD CONSTRAINT product_buy_now_buyer_id_fk FOREIGN KEY ( buyer_id )
REFERENCES buyer (buyer_id)
ON DELETE CASCADE;
 
ALTER TABLE product_buy_now
ADD CONSTRAINT product_buy_now_product_id_fk FOREIGN KEY ( product_id )
REFERENCES product (product_id)
ON DELETE CASCADE;

ALTER TABLE amazon_user
ADD CONSTRAINT user_cust_rep_id_fk FOREIGN KEY (customer_rep_id)
REFERENCES customer_support (customer_rep_id)
ON DELETE CASCADE;

ALTER TABLE refund
ADD CONSTRAINT refund_product_id_fk FOREIGN KEY ( product_id )
REFERENCES product (product_id)
ON DELETE CASCADE;
