/*create table hotels (
hotelid int primary key ,
hotelname nvarchar (100),
hoteladdress nvarchar(1000),
city nvarchar(100),
country nvarchar(100),
rating int );*/

/*create table rooms (
roomid int primary key,
hotelid int foreign key references hotels (hotelid),
roomnumber int ,
roomtype nvarchar (50) ,
roomprice decimal (10,2),
capacity int);*/

/*create table guests(
guestid int primary key,
firstname nvarchar (100),
lastname nvarchar (100),
email varchar (100),
phone varchar (20));*/

/*create table reservations(
reservationid int primary key ,
guestid int foreign key references guests(guestid),
roomid int foreign key references rooms(roomid),
chechindate date ,
checkoutdate date ,
totalamount decimal(10,2));*/

/*create table payments(
paymentid int primary key ,
reservationid int foreign key references reservations(reservationid),
amount decimal (10,2),
paymentdate date);*/

/*create table service (
serviceid int primary key,
servicename nvarchar (100),
serviceprice decimal (10,2));*/

/*alter table service
add guestid int foreign key references guests(guestid);*/

/*alter table service
add reservationid int foreign key references reservations(reservationid);*/
 
 --insert into reservations (reservationid,guestid,roomid,checkindate,checkoutdate,totalamount)
 --values(118,1001,20,'2018/02/03','2018/02/10',10000)

 /*create table res_service(
 res_id int foreign key references reservations(reservationid),
 serv_id int foreign key references service(serviceid)
 constraint rs_id primary key (res_id , serv_id)
 );*/

 /*create table guests_service(
 guest_id int foreign key references guests(guestid),
 serv_id int foreign key references service(serviceid)
 constraint gs_id primary key (guest_id , serv_id)
);*/
 
 

