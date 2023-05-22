create database QuanLyBanhang;
use QuanLyBanHang;

create table Customer(
	cID int primary key auto_increment,
    cName varchar(20) not null,
    cAge int check(cAge between 0 and 150)
);

create table Orderr(
	oID int primary key auto_increment,
    cID int,
    oDate datetime,
    oTotalPrice float not null check(oTotalPrice >= 0),
    foreign key (cID) references Customer(cID)
);

create table Product(
	pID int primary key auto_increment,
    pName varchar(50) not null,
    pPrice float not null check(pPrice >= 0)
);

create table OrderDetail(
	oID int,
    pID int,
    primary key (oID, pID),
    odQTY int not null check(odQTY >= 0),
    foreign key (oID) references Orderr(oID),
    foreign key (pID) references Product(pID)
);