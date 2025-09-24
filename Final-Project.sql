Create database Final;
Use Final
Drop database Final;

create table Aircraft(
ID varchar(255) not null primary key,
Model varchar(255) not null,
Capacity int not null,
Manufacturer varchar(255) not null,
Maintennance_date date,
);

create table Maintenance_record(
ID varchar(255) not null primary key, 
AircraftID varchar(255) not null foreign key references Aircraft(ID),
MaintenanceDate date,
Performedby varchar(255) not null,
);

create table Service_type(
ID int not null primary key,
Service_type varchar(255),
Price INT not null
);

Create table Airport(
ID varchar(10) not null primary key,
Country varchar(255) not null,
Terminals INT not null, 
Nameairport varchar(255) not null,
City varchar(255) not null
);

Create table Airway(
ID varchar(225) not null primary key,
Distance INT not null,
Flight_duration time not null,
);

Create table Airway_Airport(
AirwayID varchar(225) not null foreign key references Airway(ID),
AirportID varchar(10) not null foreign key references Airport(ID),
);

CREATE TABLE Flight (
    ID INT NOT NULL PRIMARY KEY,
    Departure_time DATETIME,
    Arrival_time DATETIME,
    AircraftID varchar(255) NOT NULL,
    AirwayID VARCHAR(225) NOT NULL,
    Status_FL CHAR(1) CHECK (Status_FL IN ('O', 'D', 'C')),
    CONSTRAINT FK_FlightAircraft FOREIGN KEY (AircraftID) REFERENCES Aircraft(ID),
    CONSTRAINT FK_FlightAirway FOREIGN KEY (AirwayID) REFERENCES Airway(ID)
);

Create table Flight_service(
ServiceID int not null foreign key references Service_type(ID),
FlightID int not null foreign key references Flight(ID)
);

Create table Employee(
ID int not null primary key,
FlightID int not null foreign key references Flight(ID),
Lastname varchar(255) not null,
Firstname varchar(255) not null,
Role_employee varchar(255) not null,
HireYear int not null
);

Create table Passenger(
ID int not null primary key,
Firstname varchar(255) not null,
Lastname varchar(255),
Birthday date,
PassportNumber varchar(255) ,
Contact_detail varchar(255) not null
);

Create table Booking(
ID int not null primary key,
PassengerID int not null foreign key references Passenger (ID),
FlightID int not null foreign key references Flight (ID),
BookingDate date,
Seatnumber varchar(10) not null
);

Insert into Service_type (ID, Service_type, Price)
Values (1, 'Food', 10), 
(2, 'Drink', 5),
(3, 'Consign', 5),
(4, 'Transfer service', 10),
(5, 'Wifi', 6); 

Insert into Passenger (ID, Firstname, Lastname, Birthday, PassportNumber, Contact_detail)
Values (1, 'Van Tien' , 'Vu', '01-jan-98', 098723111, 'vuvantien91@yahoo.com'),
(2, 'Khanh Linh', 	'Vu', '02-feb-98', 08663201, 'vklinh123@gmail.com'),
(3, 'Hoang Nguyen', 'Lai', '01-apr-01', 06892012, 'lhoangnguyen@gmail.com'),
(4, 'Minh Giam', 'Hoang', '10-jul-04', 07102932, 'hmgiam@yahoo.com'),
(5, 'Tranh Anh', 'Huynh' , '11-jul-03', 07152002, 'huynhtranganh@gmail.com'),
(6, 'Tien Dat', 'Nguyen', '01-nov-02', 099232011, 'datng123@gmail.com'),
(7, 'Tuan Anh', 'Trinh Tran', '30-may-99', 06655261, 'tttanh1993@gmail.com'),
(8, 'Thi Ha', 'Ngo', '13-feb-67', 08710291, 'Nthiha96@yahoo.com'),
(9, 'Tuan Anh', 'Phung', '15-jul-68', 0901209332, 'ptuananh18@yahoo.com'),
(10, 'Van Luong', 'Le', '23-sep-78', 01234567, 'lvl9021@gmail.com'),
(11, 'Steven', 'Hawking', '24-aug-01', 021223, 'Steve@yahoo.com'),
(12, 'Elizabeth', 'No1' , '09-jul-92', 0129590,	'Elizahehe@gmail.com'),
(13, 'Jack', 'Sparow', '08-may-56', 02134211, 'cuopbien@icloud.com'),
(14, 'Emi', 'Fukkada', '09-may-01', 069696969, 'JAnnVvv@gmail.com'),
(15, 'Donal', 'Trump', '12-aug-05', 0695443791, 'USAnumber1@gov.com'),
(16, 'Mono', Null ,'17-sep-95', 0224456677, 'emtraisontung@gmail.com'),
(17, 'Son Tung'	, 'MTP', '15-jan-95', 081222223, 'skyoiii123@gmail.com'),
(18, 'Thomas' , 'Edison', '20-aug-46', 012445567, 'Thomas1122@gmail.com'),
(19, 'Chong Un', 'Kim', '30-jan-54', 0844296897, 'nuclear@gmail.com'),
(20, 'Thi Thuy Trang', 'Hoang', '24-mar-96', 0833596277 ,'hoangtrang161102@gmail.com'),
(21, 'Nhat Minh', 'Doan', '01-may-04', 0897622082, 'minhdoan98@gmail.com'),
(22, 'Minh Duc' ,'Le' ,'28-apr-05', 0867201022 ,'lmd71102@gmail.com'),
(23, 'Tuan Phat', 'Huynh', '29-jan-93', 0905072002, 'htuanp45@gmail.com'),
(24, 'Nghia Hiep', 'Do', '10-oct-92', 0907112002, 'dnhiep1234@gmail.com'),
(25, 'Trang Linh', 'Hoang', '21-mar-94', 0901029889, 'htlinh1992@gmail.com'),
(26, 'Linh My' ,'Trinh Tran', '19-jan-04', 0367651202, 'ttlinhmy99@gmail.com'),
(27, 'Hai Viet', 'Phi', '28-jan-06', 0964230102, 'haivietphi12@gmail.com'),
(28, 'Viet Anh', 'Vu', '27-jun-04', 0964741672, 'Vuvietanhdz@gmail.com'),
(29, 'Kim Lien', 'Ta', '17-sep-95', 0336782012, 'lienta971@gmail.com'),
(30, ' Minh Anh', 'Nguyen', '21-jun-95', 0913219704, 'minhanhxinh@gmail.com'),
(31, 'Hoang Son', 'Tran ', '18-oct-94', 0584622082, 'hsontran@gmail.com'),
(32, 'Duc Anh', 'Nguyen', '25-sep-91', 0988722012, 'ducanh711@gmail.com'),
(33, 'Thanh Nhat', 'Hoang', '24-jun-02', 0584622082, 'htn0507@gmail.com'),
(34, 'Bao Chau', 'Vu Ngo', '11-mar-84', 0982329702, 'vungobaochau@gmail.com'),
(35, 'Thanh Duong', 'Dong ', '10-may-96', 0868751685, 'Duongngu123@gmail.com'),
(36, 'Hoang Thang', 'Tran Le' ,'13-jul-84', 0907781819, 'thangtran111@gmail.com'),
(37, 'Cong Thanh', 'Tran', '06-mar-98', 09012345678, 'thanhtrancong@gmail.com'),
(38, 'Tuan Anh', 'Dam ', '14-feb-68', 09012345678, 'cosmos6578@gmail.com'),
(39, 'Linh Chi', 'Phung', '23-may-65', 0907781819, 'linhchi113@gmail.com'),
(40, 'Bao Nam', 'Hoang ', '23-oct-78', 0868855613, 'hoangnam123@gmail.com'),
(41, 'Phuong Tuan', 'Trinh Tran ', '31-aug-98', 098653420, 'j97123@gmail.com'), 
(42, 'Thien An', 'Nguyen Hoang', '17-jul-84', 0376590401, 'thienan5tr@gmail.com'),
(43, 'Thien Son', 'Trinh Tran ', '05-may-73', 0584308790, 'thienson97@gmail.com'),
(44, 'Dong Nhi', 'Nguyen', '18-aug-03', 098786521, 'dongquaxuantoi@gmail.com'),
(45, 'Anh Tuan', 'Ha', '23-may-92', 0376799245, 'connhoanhkhong@gmail.com'),
(46, 'Luong Anh', 'Nguyen' , '14-jun-82', 098367218, 'luonganh07@gmail.com'),
(47, 'Ha Trang', 'Le', '05-sep-01', 0985765439, 'hatrangne@gmail.com'),
(48, 'Thuy Ha', 'Nguyen Thi', '18-jan-00', 0373529776 ,'hathaibinh@gmail.com'),
(49, 'Thu Trang', 'Cao Thi', '16-sep-68', 0978568241, 'trangkhi@gmail.com'),
(50, 'Quang Hung', 'Do', '08-Jul-95', 0984980568, 'hungbavi@gmail.com')

Insert into Airway (ID,Distance,Flight_duration)
values
('H-N', 2400, '05:00:00'),
('S-D', 810, '02:00:00'),
('N-C', 2500,'06:00:00'),
('J-H', 8500, '10:00:00'),
('L-S', 6200, '15:00:00')

INSERT INTO Aircraft (ID, Model, Capacity, Manufacturer, Maintennance_date)
VALUES 
(1,'Boeing 747', 40, 'Boeing', '05-Mar-24'),
(2,'Airbus A320', 50, 'Airbus', '17-Jan-24'),
(3,'Boeing 747 Freighter', 45, 'Boeing', '08-May-24'),
(4, 'Airbus A330-200F', 48, 'Airbus', '26-Apr-24'),
(5, 'Boeing 749', 43, 'Boeing', '28-Feb-24')

Insert into Flight(ID,AircraftID, Departure_time, Arrival_time, AirwayID, Status_FL)
values
(123,1,'14:00','05:40','H-N','O'),
(456,2,'14:30','07:56','S-D','D'),
(789,3,'15:00','08:12','N-C','C'),
(852,4,'16:50','08:45','J-H','D'),
(776,5,'17:52','10:50','L-S','O')

INSERT INTO Booking (ID, PassengerID, FlightID, BookingDate, SeatNumber) 
VALUES
(10, 1, 123, '01-Jan-24', 'A1'),
(11, 2, 456, '02-Jan-24', 'A2'),
(12, 3, 789, '03-Jan-24', 'A8'),
(13, 4, 852, '04-Jan-24', 'A9'),
(14, 5, 776, '05-Jan-24', 'A10'),
(15, 6, 123, '06-Jan-24', 'A11'),
(16, 7, 456, '07-Jan-24', 'A12'),
(17, 8, 789, '08-Jan-24', 'A13'),
(18, 9, 852, '09-Jan-24', 'A14'),
(19, 10, 776, '10-Jan-24', 'A15'),
(20, 11, 123, '11-Jan-24', 'A16'),
(21, 12, 456, '12-Jan-24', 'A17'),
(22, 13, 789, '13-Jan-24', 'A18'),
(23, 14, 852, '14-Jan-24', 'A19'),
(24, 15, 776, '15-Jan-24', 'A20'),
(25, 16, 123, '16-Jan-24', 'A21'),
(26, 17, 456, '17-Jan-24', 'A22'),
(27, 18, 789, '18-Jan-24', 'A23'),
(28, 19, 852, '19-Jan-24', 'A24'),
(29, 20, 776, '20-Jan-24', 'B1'),
(30, 21, 123, '21-Jan-24', 'B2'),
(31, 22, 456, '22-Jan-24', 'B3'),
(32, 23, 789, '23-Jan-24', 'B4'),
(33, 24, 852, '24-Jan-24', 'B5'),
(34, 25, 776, '25-Jan-24', 'B6'),
(35, 26, 123, '29-Jan-24', 'B7'),
(36, 27, 456, '12-Jan-24', 'B8'),
(37, 28, 789, '11-Jan-24', 'B9'),
(38, 29, 852, '14-Jan-24', 'B10'),
(39, 30, 776, '15-Jan-24', 'C1'),
(40, 31, 123, '16-Jan-24', 'C2'),
(41, 32, 456, '17-Jan-24', 'C3'),
(42, 33, 789, '18-Jan-24', 'C4'),
(43, 34, 852, '19-Jan-24', 'C5'),
(44, 35, 776, '20-Jan-24', 'C6'),
(45, 36, 123, '21-Jan-24', 'C7'),
(46, 37, 456, '22-Jan-24', 'C8'),
(47, 38, 789, '23-Jan-24', 'C9'),
(48, 39, 852, '24-Jan-24', 'C10'),
(49, 40, 776, '25-Jan-24', 'C11'),
(50, 41, 123, '26-Jan-24', 'C12'),
(51, 42, 456, '27-Jan-24', 'C13'),
(52, 43, 789, '28-Jan-24', 'C14'),
(53, 44, 852, '29-Jan-24', 'C15'),
(54, 45, 776, '30-Jan-24', 'D1'),
(55, 46, 123, '21-Jan-24', 'D2'),
(56, 47, 456, '17-Jan-24', 'D3'),
(57, 48, 789, '16-Jan-24', 'D4'),
(58, 49, 852, '19-Jan-24', 'D5'),
(59, 50, 776, '20-Jan-24', 'D6'),
(60, 40, 123, '21-Jan-24', 'D7'),
(61, 10, 456, '22-Jan-24', 'D8'),
(62, 15, 789, '23-Jan-24', 'D9'),
(63, 12, 852, '24-Jan-24', 'D10'),
(64, 13, 776, '25-Jan-24', 'D11'),
(65, 18, 123, '26-Jan-24', 'D12'),
(66, 20, 456, '27-Jan-24', 'D13'),
(67, 40, 789, '28-Jan-24', 'D14')

Insert into Airport(ID,Country,Nameairport,Terminals,City)
values
('HAN','Vi?t Nam','Sân bay Qu?c t? N?i Bài',4,'Hà N?i'),
('SGN','Vi?t Nam','Sân bay Qu?c t? Tân S?n Nh?t',4,'Thành ph? H? Chí Minh'),
('NRT','Nh?t B?n','Sân bay Qu?c t? Narita',3,'Tokyo'),
('JFK','M?','Sân bay Qu?c t? John F. Kennedy',5,'New York'),
('LHR','Anh','Sân bay Heathrow',4,'London'),
('DAD','Vi?t Nam','Sân bay Qu?c t? ?à N?ng',5,'?à N?ng'),
('CXR','Vi?t Nam','Sân bay Qu?c t? Cam Ranh',3,'Khánh Hòa'),
('HUI','Vi?t Nam','Sân bay Phú Bài',2,'Hu?'),
('VCA','Vi?t Nam','	Sân bay Qu?c t? C?n Th?',3,'C?n Th?')

INSERT INTO Maintenance_record ( ID, AircraftID, MaintenanceDate , PerformedBy)
VALUES 
('ABZ1482', 1, '14-Feb-24', 'Flyteam'),
('GIK5214', 2, '23-may-23', 'Mtpteam'),
('SPY6541', 3, '12-jan-21', 'Linteam'),
('MAR3125', 4, '20-jul-23', 'Katteam'),
('AWE2385', 5, '8-jun-20', 'Kicteam')

Insert into Flight_service(ServiceID,FlightID)
values
(1,123),
(2,456),
(3,789),
(4,852),
(5,776)

insert into Employee( ID, FlightID, Lastname, Firstname, Role_employee, HireYear)
values
('0974980528',123,'Bui','Anh Tuan','Pilot',1994),
('0383529885',456,'Vo','Ha Linh','Flight Attendant',1995),
('0789305097',789,'Vu','Minh Anh','Ground Crew',2004),
('0789456879',852,'Nguyen','Tuan Anh','Purser',2006),
('0365789087',776,'Dang','Hoai An','Pilot',2005),
('0965459733',852,'Tran','Manh Tuan','Ground Crew',1999),
('0789456876',789,'Vuong','Manh Hiep','Flight Attendant',1998),
('0984978502',456,'Pham','Thi Hanh','Purser',1987),
('0965456722',123,'Vu','Van Tien','Pilot',2001),
('0968549528',776,'Do','Manh Dung','first officer',2005),
('0879502097',456,'Pham','Thi Nhung','Flight Attendant',2004),
('0974193233',776,'Vu','Thi Huong','first officer',1992),
('0862200069',123,'Vu','Quang Huy','Pilot',2005),
('0367400118',456,'Le','Tran Anh Dung','Ground Crew',1998),
('0389260595',789,'Tran','The Truong','first officer',2012),
('0862260093',852,'Nhu' ,'Dieu Linh','Pilot',2008),
('0975794467',776,'Tran','Ngoc Hung','Purser',2009),
('0598485229',852,'Nguyen','Thu Ha','first officer',2010),
('0375973372',456,'Do','Thao Nguyen','Flight Attendant',1996),
('0931728737',123,'Pham','Thi Chinh','Ground Crew',1998)

Insert into Airway_Airport(AirwayID, AirportID)
values
('H-N','HAN'),
('S-D','SGN'),
('N-C','NRT'),
('J-H','JFK'),
('S-D',	'LHR'),
('N-C','DAD'),
('J-H','CXR'),
('H-N','HUI'),
('S-D','VCA')

select * from Airway_Airport; 

select B.FlightID, B.Seatnumber, P.ID, P.Firstname
from Booking B inner join Passenger P on B.PassengerID = P.ID
where P.Firstname = 'Mono';

SELECT * FROM Passenger;

CREATE PROCEDURE uspFlightInfor 
@ID int
as
begin
select *
from flight
Where ID = @ID;
End;

Execute uspFlightInfor @ID=123

select B.FlightID, B.ID, P.ID, P.Firstname, P.Lastname, P.PassportNumber
from Booking B inner join Passenger P on B.PassengerID = P.ID
where B.FlightID=123;

Select P.ID, P.Nameairport, P.Country, P.Terminals, count(A.AirwayID) number_airway
from Airway_Airport A inner join Airport P on P.ID = A.AirportID
Group by P.ID, P.Nameairport, P.Country, P.Terminals having count(A.AirwayID) >=1
Order by number_airway DESC;

select B.FlightID, B.PassengerID, P.ID, P.Firstname
from Booking B inner join Passenger P on P.ID = B.PassengerID
where P.Firstname like '%a%'
Group by B.FlightID, B.PassengerID, P.ID, P.Firstname
Order by B.FlightID ASC;

SELECT p.FirstName, p.LastName, p.Contact_detail
FROM Passenger p
WHERE p.ID IN (
    SELECT b.PassengerID
    FROM Booking b
    WHERE b.FlightID = 123
);

select A.ID, A.Model, M.ID, M.MaintenanceDate, M.Performedby
from Maintenance_record M inner join Aircraft A on A.ID = M.AircraftID

Select F.ID, F.AircraftID, F.AirwayID, F.Departure_time, Count(B.PassengerID) number_Passenger
from Flight F inner join Booking B on F.ID = B.FlightID
Group by F.ID, F.AircraftID, F.AirwayID, F.Departure_time
Order by number_Passenger DESC, F.Departure_time ASC;
Drop function udrealdurationtime
CREATE FUNCTION udrealdurationtime(
    @Arrival TIME,
    @Departure TIME
)
RETURNS TIME
AS
BEGIN 
    DECLARE @Duration TIME;
    DECLARE @DurationSeconds INT = DATEDIFF(SECOND, @Departure, @Arrival);
	SET @Duration = CONVERT(TIME, DATEADD(SECOND, @DurationSeconds, '00:00:00'));
	Return @Duration;
END;

Select dbo.udrealdurationtime('05:40', '14:00') DurationTime;

