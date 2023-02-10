create database [Trade]
go
use [Trade]
go
create table [Role]
(
	RoleID int primary key identity,
	RoleName nvarchar(100) not null
)
go
create table [Status]
(
	StatusID int primary key identity,
	StatusName nvarchar(100) not null
)
go
create table [PickupPoint]
(
	PointID int primary key identity,
	PostCode int not null,
	City nvarchar(100) not null,
	Street nvarchar(100) not null,
	HouseNumber int not null
)
go
create table [User]
(
	UserID int primary key identity,
	UserSurname nvarchar(100) not null,
	UserName nvarchar(100) not null,
	UserPatronymic nvarchar(100) not null,
	UserLogin nvarchar(max) not null,
	UserPassword nvarchar(max) not null,
	UserRole int foreign key references [Role](RoleID) not null
)
go
create table [Order]
(
	OrderID int primary key identity,
	OrderCreationDate datetime not null,
	OrderDeliveryDate datetime not null,
	OrderPickupPoint int foreign key references [PickupPoint](PointID) not null,
	OrderUser int foreign key references [User](UserID) null,
	OrderDeliveryCode int not null,
	OrderStatus int foreign key references [Status](StatusID) not null
)
go
create table Product
(
	ProductArticleNumber nvarchar(100) primary key,
	ProductName nvarchar(max) not null,
	ProductUnit nvarchar(3) not null,
	ProductCost int not null,
	ProductDiscountMaxAmount int not null,
	ProductManufacturer nvarchar(max) not null,
	ProductSupplier nvarchar(max) not null,
	ProductCategory nvarchar(max) not null,
	ProductDiscountAmount int not null,
	ProductQuantityInStock int not null,
	ProductDescription nvarchar(max) not null,
	ProductPhoto nvarchar(max) null
	
)
go
create table OrderProduct
(
	OrderProductID int primary key identity,
	OrderID int foreign key references [Order](OrderID) not null,
	Article nvarchar(100) foreign key references Product(ProductArticleNumber) not null,
	Amout int not null
	
)
