drop table if exists sale;
drop table if exists stock;
drop table if exists orderlist;
drop table if exists `order`;
drop table if exists size;
drop table if exists product;
drop table if exists distributor;

drop schema if exists Project;

create schema Project;
use Project;

create table product(
productId int NOT NULL,
name varchar(45) NOT NULL,
constraint PK_product primary key (productId)
);

create table sale(
saleId int,
productId int,
amount int,
date year,
constraint PK_sale primary key (saleId),
constraint FK_sale_product_productId foreign key (productId) references product (productId)
);

create table stock(
productId int,
quantity int,
constraint PK_stock primary key (productId),
constraint FK_stock_product_productId foreign key (productId) references product (productId)
);

create table distributor(
distributorId int,
name varchar(45) NOT NULL,
constraint PK_distributor primary key (distributorId)
);

create table `order`(
orderId int,
distributorId int NOT NULL,
orderDate year NOT NULL,
quantity int,
constraint PK_order primary key (orderId),
constraint FK_order_distributor foreign key (distributorId) references distributor (distributorId)
);

create table orderlist(
productId int,
orderId int,
quantity int,
constraint PK_orderlist primary key (productId, orderId),
constraint FK_orderlist_product_productId foreign key (productId) references product (productId),
constraint FK_orderlist_product_orderId foreign key (orderId) references `order` (orderId)
);

create table size(
sizeId int,
price float,
constraint PK_size primary key (sizeId)
);

create table sizelist(
sizeId int,
productId int,
constraint PK_sizelist primary key (sizeId, productId),
constraint FK_sizelist_product foreign key (productId) references product (productId),
constraint FK_sizelist_size foreign key (sizeId) references size (sizeId)
);
