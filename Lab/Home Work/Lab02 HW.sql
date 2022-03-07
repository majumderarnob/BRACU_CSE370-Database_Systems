

Create table elite_customer(
    c_id int,
    name char(20),
    email varchar(100),
    credit_points int,
    start_date date,
	c_factor int);
	

insert into elite_customer value(101, "melena", 'melena@gmail.com', 1250 , "2021-04-04", 14),
(102, 'hello','hello@yahoo.com', 5231, '2020/05/04', 16),
(103, "data", "data@bubble.com", 6892, "2019/12/04", 23),
(104, 'alen', 'alen@outlook.com', 1275, '2021/05/09', 2),
(105,'barry', 'barry@yahoo.com',7848, '2021/04/10', 8),
(106, "helen", 'helen@gmail.com', 9820,'2019/02/28', 45),
(107, 'elena', 'elena@gmail.com', 9580, '2018/01/02', 2),
(108, 'messi', 'messi@yahoo.com', 3721, '2017/02/02', 23),
(109, 'jimmi','jimmi@gmail.com', 8593, '2012/01/15', 3),
(110, 'shelly', 'shelly@yahoo.com', 8640, '2012/02/17', 5);

	


01
select c_id, email, start_date from elite_customer where credit_points > 5000;
02
select distinct c_factor from elite_customer order by c_factor DESC;
03
select c_id from elite_customer where c_factor % 2 = 1;
04
select avg(length(name)) from elite_customer;
05
select c_id, email, start_date from elite_customer where start_date between '2018-01-01' and '2020-12-31';
06
select email, credit_points from elite_customer order by start_date desc limit 6;
07
select c_id, substring(email, locate('@', email)+1) from elite_customer where substring(email, locate('@', email)+1)='yahoo.com';
08
select c_id, email from elite_customer where credit_points>6000 and credit_points<9000 and start_date>'2018-06-30';
09
select c_id, email, credit_points from elite_customer where name like '%a%' or name like '%e%' or name like '%l%';
10
select c_factor, max(credit_points) from elite_customer group by c_factor having c_factor>10;
11
select c_factor, count(*) from elite_customer where start_date>'2019-12-31' group by c_factor;
12
select avg(credit_points) from elite_customer where start_date<'2020-06-01';