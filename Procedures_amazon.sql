CREATE OR REPLACE PROCEDURE add_buyer (
email IN VARCHAR,
fname IN VARCHAR,
lname IN VARCHAR,
password IN VARCHAR,
isprime IN VARCHAR,
usertype IN VARCHAR,
prime_expiry_date IN DATE
) AS
   BEGIN
     INSERT INTO amazon_user VALUES (
      email,
      fname,
      lname,
      password, 
      usertype,
      NULL
    );
    INSERT INTO buyer VALUES (
     email,
     isprime,
     prime_expiry_date
    );
END add_buyer;


CREATE OR REPLACE PROCEDURE add_seller (
email IN VARCHAR,
fname IN VARCHAR,
lname IN VARCHAR,
password IN VARCHAR,
usertype IN VARCHAR,
seller_name IN VARCHAR
) AS
  BEGIN
   INSERT INTO amazon_user VALUES (
    email, 
    fname,
    lname,
    password,
    usertype,
    NULL
   );
   INSERT INTO seller VALUES (
    email,
    seller_name,
    0
   );
END add_seller;


CREATE OR REPLACE PROCEDURE add_contact_details (
user_email IN VARCHAR,
address_id IN INTEGER,
street IN VARCHAR,
city IN VARCHAR,
state IN VARCHAR,
country IN VARCHAR,
zipcode IN NUMBER,
phone IN VARCHAR,
isdefault IN NUMBER
) AS
  BEGIN
   INSERT INTO contact_detail VALUES (
    address_id,
    user_email,
    street,
    city,
    state,
    country,
    zipcode,
    phone,
    isdefault
   );
END add_contact_details;




CREATE OR REPLACE PROCEDURE populate_product_categories AS
BEGIN
INSERT INTO category VALUES (
1,
'Fashion'
);
INSERT INTO category VALUES (
2,
'Electronics'
);INSERT INTO category VALUES (
3,
'Groceries'
);
END populate_product_categories;



CREATE OR REPLACE PROCEDURE add_shipper AS
BEGIN
INSERT INTO shipper VALUES (
1,
193842024,
'UPS',
'UPS@gmail.com'
);
INSERT INTO shipper VALUES (
2,
293842024,
'Bluedart',
'Bluedart@gmail.com'
);
INSERT INTO shipper VALUES (
3,
393842026,
'Fedex',
'Fedex@gmail.com'
);
END add_shipper;




CREATE OR REPLACE PROCEDURE add_product (
product_id IN INTEGER,
seller_id IN VARCHAR,
name IN VARCHAR,
description IN VARCHAR,
available_units IN INTEGER,
price IN NUMBER,
weight IN NUMBER,
category_id IN INTEGER,
color IN VARCHAR,
shipper_id IN INTEGER,
image_url IN VARCHAR
) AS
BEGIN
INSERT INTO product VALUES (
product_id,
seller_id,
name,
description,
available_units,
price,
weight,
0,
category_id,
color,
0,
shipper_id
);
INSERT INTO product_image VALUES (
product_id,
image_url
);
END add_product;


CREATE OR REPLACE PROCEDURE add_to_wishlist (
buyer_id IN VARCHAR,
product_id IN INTEGER
) AS
BEGIN
INSERT INTO wishlist VALUES (
buyer_id,
sysdate
);
INSERT INTO product_wishlist VALUES (
product_id,
buyer_id
);
END add_to_wishlist;

CREATE OR REPLACE PROCEDURE add_to_shopping_cart (
buyer_id IN VARCHAR,
product_id IN INTEGER
) AS
BEGIN
INSERT INTO shopping_cart VALUES (
buyer_id,
sysdate
);
INSERT INTO product_shopping_cart VALUES (
product_id,
buyer_id
);
END add_to_shopping_cart;


CREATE OR REPLACE PROCEDURE add_to_buy_now (
buyer_id IN VARCHAR,
product_id IN INTEGER
) AS
BEGIN
INSERT INTO buy_now VALUES (
buyer_id,
sysdate
);
INSERT INTO product_buy_now VALUES (
product_id,
buyer_id
);
END add_to_buy_now;


CREATE OR REPLACE PROCEDURE add_to_return (
buyer_id IN VARCHAR,
product_id IN INTEGER
) AS
BEGIN
INSERT INTO return VALUES (
buyer_id,
sysdate
);
INSERT INTO product_return VALUES (
product_id,
buyer_id
);
END add_to_return;

CREATE OR REPLACE PROCEDURE add_review (
review_id IN NUMBER,
product_id IN INTEGER,
buyer_id IN VARCHAR,
description IN VARCHAR,
rating IN NUMBER
) AS
BEGIN
INSERT INTO review VALUES (
review_id,
product_id,
buyer_id,
description,
rating
);
END add_review;

CREATE OR REPLACE PROCEDURE add_customer_rep AS
BEGIN
INSERT INTO customer_support VALUES (
123,
73782973,
null,
0
);
INSERT INTO customer_support VALUES (
456,
93782972,
null,
0
);INSERT INTO customer_support VALUES (
789,
53782923,
null,
0
);
END add_customer_rep;

CREATE OR REPLACE PROCEDURE add_card_details(
  buyer_id IN VARCHAR,
  card_no IN NUMBER,
  expiry IN DATE,
  cvv IN NUMBER,
  card_type IN VARCHAR,
  card_name IN VARCHAR 
) AS
   BEGIN
     
     INSERT INTO card VALUES (
      card_no,
      expiry,
      cvv,
      card_type,
      card_name,
      NULL,
      buyer_id
      );
END add_card_details;



CREATE OR REPLACE PROCEDURE add_wallet_details(
  buyer_id IN VARCHAR,
  wallet_id IN NUMBER
) AS
   BEGIN
     
     INSERT INTO wallet VALUES (
      wallet_id,
      0,
      null,
      buyer_id
      );
END add_wallet_details;


CREATE OR REPLACE PROCEDURE create_coupon (
  coupon_id IN NUMBER,
  expiry_date IN DATE,
  redeem_code IN VARCHAR
) AS
   BEGIN
     
     INSERT INTO coupon VALUES (
      coupon_id,
      expiry_date,
      redeem_code,
      null,
      null
      );
END create_coupon;



