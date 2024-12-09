CREATE TABLE CUSTOMERS (
                           CUSTOMER_ID INT AUTO_INCREMENT PRIMARY KEY,
                           FIRST_NAME VARCHAR(45) NOT NULL,
                           LAST_NAME VARCHAR(45) NOT NULL,
                           ADDRESS VARCHAR(200),
                           CITY VARCHAR(45),
                           STATE VARCHAR(45),
                           COUNTRY VARCHAR(45),
                           ZIPCODE INT,
                           PHONE_NUMBER VARCHAR(15),
                           EMAIL_ID VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE PAYMENTS (
                          PAYMENT_ID INT AUTO_INCREMENT PRIMARY KEY,
                          CUSTOMER_ID INT NOT NULL,
                          PAYMENT_TYPE VARCHAR(45),
                          EXPIRATION_DATE DATE,
                          EMAIL_ID VARCHAR(100),
                          FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

CREATE TABLE PRODUCTS (
                          PRODUCT_ID INT AUTO_INCREMENT PRIMARY KEY,
                          PRODUCT_NAME VARCHAR(200) NOT NULL,
                          PRODUCT_TYPE VARCHAR(45),
                          PRICE DECIMAL(10, 2)
);

CREATE TABLE ORDERS (
                        ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
                        DEVICE VARCHAR(45),
                        PRODUCT_ID INT NOT NULL,
                        CUSTOMER_ID INT NOT NULL,
                        PAYMENT_ID INT NOT NULL,
                        SHIPPING_ADDRESS VARCHAR(100),
                        SHIPPING_CITY VARCHAR(100),
                        SHIPPING_STATE CHAR(2),
                        SHIPPING_COUNTRY VARCHAR(45),
                        DELIVERED BOOLEAN DEFAULT FALSE,
                        FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID),
                        FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID),
                        FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENTS(PAYMENT_ID)
);

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, COUNTRY, ZIPCODE, PHONE_NUMBER, EMAIL_ID)
VALUES
    ('John', 'Doe', '123 Elm St', 'New York', 'NY', 'USA', 10001, '123-456-7890', 'john.doe@example.com'),
    ('Jane', 'Smith', '456 Oak St', 'Los Angeles', 'CA', 'USA', 90001, '987-654-3210', 'jane.smith@example.com');

INSERT INTO PAYMENTS (CUSTOMER_ID, PAYMENT_TYPE, EXPIRATION_DATE, EMAIL_ID)
VALUES
    (1, 'Credit Card', '2025-12-31', 'john.doe@example.com'),
    (2, 'PayPal', '2026-06-30', 'jane.smith@example.com');

INSERT INTO PRODUCTS (PRODUCT_NAME, PRODUCT_TYPE, PRICE)
VALUES
    ('Wireless Mouse', 'Electronics', 25.99),
    ('Bluetooth Speaker', 'Electronics', 50.00);

INSERT INTO ORDERS (DEVICE, PRODUCT_ID, CUSTOMER_ID, PAYMENT_ID, SHIPPING_ADDRESS, SHIPPING_CITY, SHIPPING_STATE, SHIPPING_COUNTRY, DELIVERED)
VALUES
    ('Mobile', 1, 1, 1, '123 Elm St', 'New York', 'NY', 'USA', FALSE),
    ('Web', 2, 2, 2, '456 Oak St', 'Los Angeles', 'CA', 'USA', FALSE);

SELECT * FROM CUSTOMERS;

SELECT O.ORDER_ID, C.FIRST_NAME, C.LAST_NAME, P.PRODUCT_NAME, O.DELIVERED
FROM ORDERS O
         JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
         JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID;


SELECT PRODUCT_NAME, PRICE
FROM PRODUCTS
WHERE PRICE > 20;

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, COUNTRY, ZIPCODE, PHONE_NUMBER, EMAIL_ID)
VALUES
    ('Alice', 'Johnson', '789 Pine St', 'Seattle', 'WA', 'USA', 98101, '111-222-3333', 'alice.johnson@example.com'),
    ('Bob', 'Brown', '101 Maple Ave', 'Chicago', 'IL', 'USA', 60601, '222-333-4444', 'bob.brown@example.com'),
    ('Carol', 'Davis', '202 Cedar Rd', 'Miami', 'FL', 'USA', 33101, '333-444-5555', 'carol.davis@example.com');

INSERT INTO PRODUCTS (PRODUCT_NAME, PRODUCT_TYPE, PRICE)
VALUES
    ('Smartphone', 'Electronics', 699.99),
    ('Tablet', 'Electronics', 329.99);

INSERT INTO PAYMENTS (CUSTOMER_ID, PAYMENT_TYPE, EXPIRATION_DATE, EMAIL_ID)
VALUES
    (1, 'Credit Card', '2026-05-31', 'john.doe@example.com'),
    (2, 'Bank Transfer', '2025-07-15', 'jane.smith@example.com');

INSERT INTO ORDERS (DEVICE, PRODUCT_ID, CUSTOMER_ID, PAYMENT_ID, SHIPPING_ADDRESS, SHIPPING_CITY, SHIPPING_STATE, SHIPPING_COUNTRY)
VALUES
    ('Smartphone', 1, 1,1,'789 Pine St','Seattle','WA','USA');
