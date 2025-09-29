--List of hotels which are located in Iran
select * from hotels where country = 'iran ';

--List of rooms that are available between two dates.
select * from rooms where roomid not in(select roomid from reservations where 
checkindate <= '2020-09-25' and checkoutdate >= '2020-10-01')

--Names of guests who have booked a room at the Plaza Hotel.
select distinct firstname,lastname from guests 
join reservations on guests.guestid=reservations.guestid
join rooms on reservations.roomid=rooms.roomid
join hotels on rooms.hotelid=hotels.hotelid
where hotelname = 'plaza'


--List of names and last names of guests who have booked rooms between 2018 and 2020, 
--along with their total payments in descending order.
select firstname ,lastname ,amount from guests 
join reservations on guests.guestid=reservations.guestid
join payments on reservations.reservationid=payments.reservationid
where  year(reservations.checkindate) between  2018 and 2020
group by guests.firstname , guests.lastname , amount
order by amount desc;

--List of rooms that have not been reserved.
select roomid,roomnumber,roomtype from rooms where roomid not in(
select roomid from reservations);

--Information on a guest who has booked a room with the same number at two different hotels.
/*select firstname,lastname,email,roomnumber,hotelname from guests 
join reservations on guests.guestid=reservations.guestid
join rooms on reservations.roomid=rooms.roomid 
join hotels on rooms.hotelid = hotels.hotelid where rooms.roomnumber
in(select roomnumber from rooms
group by roomnumber
having count(distinct hotelid) > 1) 
order by firstname , roomnumber , hotelname;*/

--A view including the reservation code and its corresponding guest code.
create view guest_reservation_view as
select guests.guestid,reservations.reservationid 
from guests join reservations on guests.guestid=reservations.guestid
group by guests.guestid , reservations.reservationid

select * from guest_reservation_view

--A stored procedure that receives a guest ID and displays the guest's details.
create procedure guestinfo @guestid int as
select * from guests where guestid = @guestid

exec guestinfo @guestid=1001 ;

--A stored procedure that receives a hotel ID and displays the hotel's address.
create procedure hotelinfo @hotelid int as
select hoteladdress from hotels 
where hotelid = @hotelid

exec hotelinfo @hotelid = 103

--A function to determine the hotel's grade based on its rating.
create function hotelrate(@rating int)
returns nvarchar(10) as
begin
declare @rank nvarchar(10);
if @rating = 5 set @rank = 'great';
else if @rating > 3 set @rank = 'very good';
else if @rating = 3 set @rank = 'good';
return @rank
end;

select hotelid , dbo.hotelrate(rating) as rank
from hotels;


--Details of a reservation made in 2021.
select * from reservations
where checkindate = '2021'

--Names of hotels that have rooms with a capacity of more than 3.
select hotelname from hotels join rooms
on hotels.hotelid = rooms.hotelid
where capacity >= 3;

--Names of hotels that have a club
select hotelname from hotels join rooms on hotels.hotelid = rooms.hotelid
join reservations on reservations.roomid = rooms.roomid join
service on reservations.reservationid= service.reservationid
where servicename = 'gym';

--Emails of guests whose last name contains the letter 'a' in the middle.
select email from guests 
where lastname like '%o%'

--Types of rooms that have been reserved.
select roomtype from rooms join reservations on 
reservations.roomid=rooms.roomid

--Payments greater than 60,000 based on their payment date.
select paymentdate,sum(amount) from payments 
group by paymentdate 
having sum(amount)>60000

--Names of hotels along with their number of rooms. 
select hotelname , count(*) as room_count from hotels join rooms on
hotels.hotelid = rooms.hotelid
group by hotelname

--List of hotel name and city, room type, service name, 
--and payment date for guests who have booked a hotel.
select firstname , city , roomtype , servicename , paymentdate from guests
join service on guests.guestid = service.guestid join reservations on
service.reservationid = reservations.reservationid join rooms on 
reservations.roomid = rooms.roomid join hotels on 
rooms.hotelid = hotels.hotelid join payments on payments.reservationid =
reservations.reservationid
 
--A trigger that automatically inserts 
--a default room when a new hotel is added to the database.
/*create trigger trg_insert_default_room on hotels
after insert as begin
declare @hotelid int ;
declare @defaultroomnumber int=101;
declare @defaultroomtype nvarchar(50)='standard';
declare @defaultroomprice decimal(10,2) = 100.00;
declare @defaultcapacity int =2;
select @hotelid=hotelid from inserted; 
insert into rooms (hotelid,roomnumber,roomtype,roomprice,capacity)
values (@hotelid,@defaultroomnumber,@defaultroomtype,
@defaultroomprice,@defaultcapacity);
end;*/

--enable trigger trg_insert_default on hotel
--select * from trg_insert_default


--Names of guests who have made more than one reservation.
select firstname , lastname , count(reservationid) from guests 
join reservations on guests.guestid=reservations.guestid
group by firstname , lastname
having count(reservationid)>1;


--List of emails for guests whose payment amount is more than 20,000.
select email , sum(amount) as total_payment from guests join
reservations on guests.guestid = reservations.guestid join
payments on reservations.reservationid=payments.reservationid
group by email 
having sum(amount)>20000

--Hotels where the average room price is more than 10,000.
select hotelid , avg(roomprice) as average_room_price
from rooms
group by hotelid
having avg(roomprice) > 10000

--List of hotels that have at least 4 stars.
select hotelname , rating from hotels group by hotelname , rating
having rating > 4;

--List of payment amounts for services that a guest with ID 1005 has paid for.
select sum(serviceprice) as total_service_price from service
where guestid = '1005'

--Number of rooms per hotel.
select hotelid , sum(roomid) as total_rooms from rooms
group by hotelid;


--Guest name and payment amount for a 5-night stay.
select  totalamount from reservations where reservationid = 112 

select sum(roomprice)*5 from rooms where roomid =20

select firstname , sum(roomprice)*5 from guests join reservations on
guests.guestid=reservations.guestid join rooms on rooms.roomid=reservations.roomid
group by firstname
order by sum(roomprice)*5 desc
