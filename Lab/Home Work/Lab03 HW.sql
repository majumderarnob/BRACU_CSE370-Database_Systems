
Create table orders(
    order_no int, 
    purchase_amt int,
    order_date date,
    customer_id int,
    salesman_id int);


insert into orders value(101, 1515, '2020/05/04', 301, 401),
(102, 1816, "2019/12/04", 309, 405),
(103, 1920, '2021/05/09', 306, 402),
(104, 1515, '2021/04/10', 302, 410),
(105, 2555,'2019/02/28', 307, 401),
(106, 1785, '2018/01/02', 306, 403),
(107, 3560,'2017/02/02', 302, 404),
(108, 1120, '2012/01/15', 303, 410),
(109, 1654, '2012/02/17',301, 405),
(110, 3577, '2012/02/27',310, 408);


1a) SELECT order_no FROM orders WHERE purchase_amt > (SELECT AVG (purchase_amt) FROM orders);

1b) select order_no from orders where salesman_id = all(select salesman_id from orders where customer_id = 309);

1c) select order_no, order_date from orders where order_date between '2021-01-01' and '2021-12-31' and purchase_amt > ALL(select purchase_amt from orders where order_date between '2020-01-01' and '2020-12-31');



###########################################



Create table employees(
    employee_id int, 
    first_name char(20),
    last_name char(10),
    job_id int,
    salary double,
	department_id int);


insert into employees value(101, "melena", "elite", 201, 1515, 301),
(102, 'hello','john',202, 1816, 301),
(103, "data", "elina", 203,1920, 369),
(104, 'alen', 'shuva', 204, 1515, 391),
(105,'barry', 'nikki',205, 2555, 369),
(106, "helen", 'keller',206, 1785, 391),
(107, 'elena', 'jonson',207, 3560, 388),
(108, 'messi', 'leo', 208, 1120, 388),
(109, 'jimmi','bington', 209, 1654, 301),
(110, 'shelly', 'thomas', 210, 3577, 391);


2a) select * from employees where salary between (select min(salary) from employees) and 2500;

2b) select first_name, last_name, department_id from employees where salary = (select min(salary) from employees); 

2c) select first_name, last_name, salary, department_id from employees where (department_id, salary) in (select department_id, min(salary) from employees group by department_id);


##############################################

Create table final_marks(
    student_id int, 
    name char(20),
    dept char(10),
    lab_marks double,
    theory_marks double ,
	cgpa decimal(3,2));
	

insert into final_marks value(101, "melena", 'CSE', 15, 15, 3.75),
(102, 'hello','CSE', 18,16, 3.81),
(103, "data", "CSE", 16.2,19, 3.69),
(104, 'alen', 'BBS', 19.6, 15.5, 3.91),
(105,'barry', 'BBS',12, 17, 3.56),
(106, "helen", 'ENH', 17, 17.5, 3.86),
(107, 'elena', 'ENH', 19, 20, 3.88),
(108, 'messi', 'CS', 11, 20, 3.73),
(109, 'jimmi','CS', 14.8, 16.4, 3.24),
(110, 'shelly', 'CSE', 15, 17, 3.99);


3a) SELECT student_id, name from final_marks where lab_marks=(SELECT min(lab_marks) from final_marks);

3b) select student_id,name,cgpa from final_marks where (theory_marks) in (select max(theory_marks) from final_marks group by dept having count(*)>2);

3c) SELECT name FROM final_marks WHERE dept ='BBS' and cgpa>ANY (SELECT cgpa FROM final_marks WHERE dept='ENH');

3d) select name, student_id, lab_marks from final_marks where dept='CSE' and theory_marks > All (SELECT theory_marks FROM final_marks WHERE dept='CS');