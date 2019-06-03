Create database Bigmobile
Go
use Bigmobile
go
/*Khởi tạo bảng Admin*/
CREATE TABLE [Admin]
(
AdminID int identity(1,1) primary key,
Email varchar(100),
[Password] varchar(20) not null,
Fullname nvarchar(50) not null ,
AdminRole nvarchar(100) not null,
Avatar varchar(200) not null,
CreatedDate date,
AdminState bit
)
/*Khởi Tạo bảng Khách Hàng*/
CREATE TABLE Customers
(
CustomerID int identity(1,1) primary key,
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null,
Gender bit,
Phone varchar(10) not null,
Email varchar(100) not null,
CreatedDate date,
CustomerState bit 
)

/*Khởi tạo bảng danh mục sản Phẩm*/
CREATE TABLE Category
(
CategoryID int identity(1,1) primary key,
CategoryName varchar(50) not null,
CategoryImages varchar(100)not null,
CategoryState bit
)
/*Khởi tạo bảng thương hiệu*/
CREATE TABLE Brand
(
BrandID int identity(1,1) primary key,
BrandName varchar(35) not null,
BrandImages varchar(100),
Descriptions nvarchar(max),
BrandState bit
)
/*Khởitạo bảng sản phẩm*/
CREATE TABLE Products
(
ProductID int identity(1,1) primary key ,
Id_dm int,
Id_th int ,
ProductName varchar(100) not null,
Image1_sp varchar(255) not null,
Image2_sp varchar(255) not null,
Image3_sp varchar(255) not null,
Image4_sp varchar(255) not null,
price float not null,
kich_thuoc varchar(35),
trong_luong varchar(35),
mau_sac varchar(35),
am_thanh varchar(35),
bo_nho varchar(35),
he_dieu_hanh varchar(35),
cpu varchar(35),
the_nho varchar(35),
pin varchar(35),
camera1 varchar(35),
camara2 varchar(35),
manhinh varchar(35),
ketnoi varchar(35),
tg_bao_hanh varchar(25),
khuyen_mai int,
bd_khuyenmai datetime,
kt_khuyenmai datetime ,
infor1 varchar,
imageinfor1 varchar(200),
infor2 varchar,
imageinfor2 varchar(200),
infor3 varchar,
imageinfor3 varchar(200),
infor4 varchar,
imageinfor4 varchar(200),
Foreign key(Id_th) REFERENCES ThuongHieu(Id_th),
Foreign key(Id_dm) REFERENCES DanhMucSP(Id_dm)

)
/*Khởi tạo bảng Đơn hàng*/
CREATE TABLE Orders
(
OrderID int identity(1,1) primary key,
CustomerID int,
Total float,
OrderDate date,
ShipAddress varchar(200) not null,
ShipNote varchar(500) not null,
[Status] int ,
Foreign key(CustomerID) REFERENCES Customers(CustomerID),
)

/*Khởi tạo Bảng chi tiết đơn hàng */
CREATE TABLE OrderDetails
(
OrderDetailID int identity(1,1) primary key,
OrderID int,
ProductID int,
Price float,
Quantity int ,
Foreign key(ProductID) REFERENCES Products(ProductID),
Foreign key(OrderID) REFERENCES Orders(OrderID)
)

