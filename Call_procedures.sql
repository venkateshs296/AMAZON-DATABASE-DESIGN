BEGIN
add_buyer('raghavmurali@gmail.com','raghav','murali','rm123','Yes','Buyer',TO_DATE('2023-12-09','YYYY-MM-DD'));
add_buyer('venkateshsankar@gmail.com','venkatesh','sankar','vs123','No','Buyer',null);
add_buyer('yogeshbala@gmail.com','yogesh','bala','yb123','No','Buyer',null);
END;

BEGIN
add_seller('akshaiseshadri@gmail.com','akshai','seshadri','as123','Seller','Akshai Corp');
add_seller('jayantjaishwin@gmail.com','jayant','jaishwin','jj123','Seller','JJ Corp');
add_seller('srivignesh@gmail.com','sri','vignesh','sv123','Seller','SV Corp');
END;

BEGIN
add_contact_details('raghavmurali@gmail.com',1,'Woodson','Dallas','Texas','USA',75252,234522524,0);
add_contact_details('raghavmurali@gmail.com',2,'Baker','New York City','New York','USA',62738,283848297,1);
add_contact_details('venkateshsankar@gmail.com',3,'Grover','Chicago','Illinois','USA',43256,52525522,0);
add_contact_details('yogeshbala@gmail.com',4,'Harrison','Austin','Texas','USA',34512,749287284,0);
END;

BEGIN
add_card_details('raghavmurali@gmail.com',4035501000000008,TO_DATE('2025-05-05','YYYY-MM-DD') ,778,'debit','Raghav Murali');
add_card_details('venkateshsankar@gmail.com',6062828888666688,TO_DATE('2026-06-29','YYYY-MM-DD') ,566,'credit','Venkatesh Sankar');
add_card_details('yogeshbala@gmail.com',3569990010095841,TO_DATE('2028-03-24','YYYY-MM-DD') ,956,'debit','Yogesh Bala');
END;

BEGIN
add_wallet_details('raghavmurali@gmail.com',942857);
add_wallet_details('venkateshsankar@gmail.com',863556);
add_wallet_details('yogeshbala@gmail.com',654345);
END;

BEGIN
set_default_contact_detail(3, 'venkateshsankar@gmail.com');
set_default_contact_detail(4, 'yogeshbala@gmail.com');
END;

BEGIN
    update_prime_membership('venkateshsankar@gmail.com');
END;

BEGIN
    cancel_prime_membership('venkateshsankar@gmail.com');
END;

BEGIN
create_coupon(978893, TO_DATE('2022-12-09','YYYY-MM-DD'), 'dfdguk239',100);
create_coupon(876558, TO_DATE('2023-04-11','YYYY-MM-DD'), 'kdjgi98qd',200);
create_coupon(765438, TO_DATE('2022-06-29','YYYY-MM-DD'), 'ldf09ds8e',300);
END;

BEGIN
add_coupon_to_wallet('venkateshsankar@gmail.com', 765438);
add_coupon_to_wallet('raghavmurali@gmail.com', 978893);
add_coupon_to_wallet('yogeshbala@gmail.com', 876558);
END;

BEGIN
populate_product_categories();
add_shipper();
add_customer_rep();
END;

BEGIN
add_product(1,'akshaiseshadri@gmail.com','Apple Iphone 12','Best phone ever',6,1200,230,2,'Grey',2,'www.apple.com/iphone12');
add_product(2,'srivignesh@gmail.com','Louis Vitton Blazer','Best blazer ever',4,350,120,1,'Black',1,'www.loiusvitton.com/blazer');
add_product(3,'jayantjaishwin@gmail.com','Great value whole milk','Best milk ever',100,3,20,3,'White',3,'www.greatvalue.com/wholemilk');
END;

BEGIN
add_product(4,'akshaiseshadri@gmail.com','Lenovo Thinkpad A6','Best laptop ever',50,1500,500,2,'Grey',2,'www.lenovo.com/thinkpad');
add_product(5,'srivignesh@gmail.com','Peter England Shirt','Best shirt ever',40,40,13,1,'Blue',1,'www.peterengland.com/shirt');
add_product(6,'jayantjaishwin@gmail.com','Farm Fresh eggs','Best eggs ever',500,25,20,3,'White',3,'www.farmfresh.com/eggs');
END;


BEGIN
add_to_wishlist('raghavmurali@gmail.com',1);
add_to_wishlist('venkateshsankar@gmail.com',2);
add_to_wishlist('yogeshbala@gmail.com',3);
END;

BEGIN
add_to_shopping_cart('raghavmurali@gmail.com',2);
add_to_shopping_cart('venkateshsankar@gmail.com',3);
add_to_shopping_cart('yogeshbala@gmail.com',1);
END;

BEGIN
add_to_buy_now('raghavmurali@gmail.com',3);
add_to_buy_now('venkateshsankar@gmail.com',1);
add_to_buy_now('yogeshbala@gmail.com',2);
END;


BEGIN
contact_customer_support('venkateshsankar@gmail.com');
contact_customer_support('raghavmurali@gmail.com');
contact_customer_support('yogeshbala@gmail.com');
END;

BEGIN
place_order(1,'raghavmurali@gmail.com','CARD');
place_order(2,'venkateshsankar@gmail.com','WALLET');
place_order(3,'yogeshbala@gmail.com','CARD');
END;

BEGIN
add_review(1,2,'raghavmurali@gmail.com','Very comfortable blazer', 4);
add_review(2,3,'venkateshsankar@gmail.com','Very tasty milk', 5);
add_review(3,1,'yogeshbala@gmail.com','Awesome Phone', 4);
END;

BEGIN
add_to_return('yogeshbala@gmail.com',1);
END;

BEGIN
cancel_order(2);
END;


select * from amazon_user;--
select * from amz_order;--
select * from buyer;--
select * from seller;--
select * from contact_detail;--
select * from card;--
select * from wallet;--
select * from category;--
select * from payment;--
select * from shipper;--
select * from coupon;--
select * from customer_support;--
select * from product;--
select * from product_image;--
select * from wishlist;--
select * from product_wishlist;--
select * from shopping_cart;--
select * from product_shopping_cart;--
select * from buy_now;--
select * from product_buy_now;--
select * from return;--
select * from product_return;--
select * from order_product;--
select * from refund;--
select * from review;--
select * from notification;--
