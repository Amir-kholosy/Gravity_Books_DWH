CREATE TABLE author_dim (
    Author_SK INT IDENTITY(1,1) PRIMARY KEY,
    AuthorID_bk INT,
    Author_name NVARCHAR(255),
    st_date DATE,
    end_date DATE,
    is_current BIT
);

CREATE TABLE Book_dim (
    book_sk INT IDENTITY(1,1) PRIMARY KEY,
    bookID_bk INT,
    title NVARCHAR(255),
    isbn13 NVARCHAR(20),
    num_of_pages INT,
    publication_date DATE,
    Publisher_name NVARCHAR(255),
    language_name NVARCHAR(100),
    language_code NVARCHAR(10),
    st_date DATE,
    end_date DATE,
    is_current BIT
);

CREATE TABLE book_author_bridge (
    book_sk INT,
    Author_sk INT,
    PRIMARY KEY (book_sk, Author_sk)
);

CREATE TABLE Customer_dim (
    Customer_sk INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID_bk INT,
    First_name NVARCHAR(100),
    Last_name NVARCHAR(100),
    Email NVARCHAR(255),
    st_date DATE,
    end_date DATE,
    is_current BIT
);

CREATE TABLE Address_dim (
    Address_SK INT IDENTITY(1,1) PRIMARY KEY,
    AddressID_bk INT,
    StreetNumber NVARCHAR(50),
    StreetName NVARCHAR(255),
    City NVARCHAR(100),
    CountyName NVARCHAR(100),
    st_date DATE,
    end_date DATE,
    is_current BIT
);

CREATE TABLE Order_status_dim (
    order_status_sk INT PRIMARY KEY,
    order_status_bk INT,
    status_value NVARCHAR(100)
);

CREATE TABLE shipping_method_dim (
    shipping_method_sk INT IDENTITY(1,1) PRIMARY KEY,
    shippingID_bk INT,
    Method_name NVARCHAR(100)
);

CREATE TABLE Sales_Fact (
    Sales_sk INT IDENTITY(1,1) PRIMARY KEY,
    Customer_sk_fk INT,
    Address_SK_FK INT,
    Book_SK_FK INT,
    Date_sk_FK INT,
    Order_ID_DD INT,
    Address_status_DD NVARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE order_shipping_fact (
    order_shipping_SK INT IDENTITY(1,1) PRIMARY KEY,
    Customer_sk_FK INT,
    Date_sk_fk INT,
    Shipping_method_sk_fk INT,
    order_status_sk_fk INT,
    order_ID_DD INT,
    Shipping_COST DECIMAL(10,2)
);
