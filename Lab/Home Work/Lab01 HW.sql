

Create table hw(
    Rank int,
    Name char(20),
    Initial char(5),
    Type varchar(20),
    Power int(11),
    Weapon varchar(30),
    Department char(20),
    Date date);


insert into hw value(1, "Optimus Prime", 'OP', 'Truck', 99225, "Sword of Judgement", "Artillery", "2016/01/18"),
(2, 'Bumblebee', 'OG', 'Mini-vehicle', 14808, 'Cosmic Rust Gun', 'Artillery', '2017/05/19'),
(2, "Ratchet", "NF", "Car", 10644, "Shield Cannon", "Artillery", "2018/01/09"),
(5, 'Outback', 'UW', 'Mini-vehicle', 1390, 'Primax Blade', 'Engineering', '2015/06/04'),
(5,'Huffer', 'CX', 'Mini-vehicle', 4865, 'Machine Gun', 'Medical', '2014/02/05'),
(4, "Bluestreak", 'AB', 'Car', 12438, 'Chainsaw', 'Artillery', '2015/08/16'),
(6, 'Grimlock', 'FF', 'Dinobot', 25634, "Padding Missiles", 'Intelligence', '2012/08/11'),
(2, 'Brawn', 'HI', 'Mini-vehicle', 9339, 'Shield Cannon', 'Infantry', '2017/05/22'),
(1, 'Sentinel Prime','KY', 'Truck', 65214, 'Cybertronian Sword', 'Engineering','2016/01/19'),
(3, 'Slag', 'GU', 'Dinobot', 9213, 'Shield Cannon', 'Engineering', '2017/05/19'),
(4, 'Prowl', 'OE', 'Car', 7433, 'Cosmic Rust Gun', 'Engineering', '2014/02/05'),
(5, 'Chromia' ,'IG', 'Van', 19375, 'Primax Blade', 'Infantry', '2012/03/08'),
(6, 'Cosmos', 'HR', "Mini-vehicle", 15925, 'Cybertronian Sword', 'Medical', '2016/10/29'),
(2, 'Eject', 'KN', 'Mini-cassette', 12536, 'Chainsaw', 'Medical', '17/08/14'),
(4, "Firestar", 'FA', 'Van', 3255, 'Shield Cannon', 'Infantry', '2018/01/23'),
(5, 'Hound', 'WR', 'Car', 14867, 'Shield Cannon', 'Intelligence', '2016/11/11'),
(5, 'Raindance', 'NE', 'Mini-cassette', 26283, 'Shield Cannon', 'Medical', '2017/04/23'),
(4, 'Ramhorn', 'EL', 'Mini-cassette', 19302, 'Shield Cannon', 'Artillery', '2016/03/03'),
(3, 'Skyfire', 'TM', 'Jet', 9698, 'Naginata Staff', 'Engineering', '2017/05/19');



01 
AlTER TABLE hw change column Power Base_Might int;
02
ALTER TABLE hw change column Date Autobot_Registration_Date date;
03
UPDATE hw SET Weapon="Ion Blaster" WHERE Name="Optimus Prime";
04
SELECT Name, Type, Weapon from hw WHERE Department="Engineering" and Autobot_Registration_date>"2015-12-31";
05
SELECT * from hw order by Rank asc, Weapon desc;
06
ALTER TABLE hw MODIFY column Rank char(2);
07
SELECT Name, ((Base_Might *130) / 100) + (((Rank * 3500) + 600) / 20) AS Bonus_Might from hw;
08
ALTER TABLE hw ADD Expiry_Date date;
09
DELETE from hw WHERE Base_Might<10000;
10
SELECT * from hw WHERE Name like '%a%';