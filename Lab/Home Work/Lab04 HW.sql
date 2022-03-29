
create table customer (customer_id varchar(10) not null, customer_name varchar(20) not null, customer_street varchar(30), customer_city varchar(30), primary key (customer_id));


create table branch (branch_name varchar(15), branch_city varchar(30), assets int, primary key (branch_name), check (assets >= 0));


create table account(branch_name varchar(15), account_number varchar(10) not null, balance int, primary key (account_number), check (balance >= 0));


create table loan (loan_number varchar(10) not null, branch_name varchar(15), amount int, primary key (loan_number));


create table depositor (customer_id varchar(10) not null, account_number varchar(10) not null, primary key (customer_id,account_number), foreign key (customer_id) references customer(customer_id), foreign key (account_number) references account(account_number));


create table borrower (customer_id varchar(10) not null, loan_number varchar(10) not null, primary key (customer_id, loan_number), foreign key (customer_id) references customer(customer_id), foreign key (loan_number) references loan(loan_number));



insert into customer values ('C-101','Jones', 'Main', 'Harrison'), ('C-201','Smith', 'North', 'Rye'),('C-211','Hayes', 'Main', 'Harrison'), ('C-212','Curry', 'North', 'Rye'),('C-215','Lindsay', 'Park', 'Pittsfield'),('C-220','Turner', 'Putnam', 'Stamford'),('C-222','Williams', 'Nassau', 'Princeton'),('C-225','Adams', 'Spring', 'Pittsfield'),('C-226','Johnson', 'Alma', 'Palo Alto'),('C-233','Glenn', 'Sand Hill', 'Woodside'),('C-234','Brooks', 'Senator', 'Brooklyn'),('C-255','Green', 'Walnut', 'Stamford');

insert into branch values ('Downtown', 'Brooklyn',9000000), ('Redwood', 'Palo Alto',2100000), ('Perryridge', 'Horseneck',1700000), ('Mianus', 'Horseneck',400000), ('Round Hill', 'Horseneck',8000000), ('Pownal', 'Bennington',300000), ('North Town', 'Rye',3700000), ('Brighton', 'Brooklyn',7100000); 


insert into account values ('Downtown','A-101',500), ('Mianus','A-215',700) ,('Perryridge','A-102',400), ('Round Hill','A-305',350), ('Brighton','A-201',900), ('Redwood','A-222',700), ('Brighton','A-217',750);

insert into loan values ('L-17', 'Downtown', 1000),('L-23', 'Redwood', 2000), ('L-15', 'Perryridge', 1500), ('L-14', 'Downtown', 1500), ('L-93', 'Mianus', 500), ('L-11', 'Round Hill', 900), ('L-16', 'Perryridge', 1300); 

insert into depositor values ('C-226', 'A-101'), ('C-201', 'A-215'), ('C-211', 'A-102'), ('C-220', 'A-305'), ('C-226', 'A-201'), ('C-101', 'A-217'),('C-215', 'A-222');

insert into borrower values ('C-101', 'L-17'), ('C-201', 'L-23'), ('C-211', 'L-15'), ('C-226', 'L-14'), ('C-212', 'L-93'), ('C-201', 'L-11'), ('C-222', 'L-17'), ('C-225', 'L-16');




01)SELECT branch_name FROM branch WHERE assets < ALL(SELECT assets FROM branch WHERE branch_city = 011"Brooklyn");

02)SELECT C.customer_name FROM customer C,depositor D,account A WHERE C.customer_id=D.customer_id AND D.account_number=A.account_number AND C.customer_name<>'Johnson' AND A.branch_name in (SELECT A.branch_name FROM customer C,depositor D,account A WHERE C.customer_id=D.customer_id AND D.account_number=A.account_number AND C.customer_name='Johnson');

03) SELECT AVG(A.balance) FROM customer C, account A, depositor D WHERE C.customer_id = D.customer_id AND D.account_number = A.account_number AND C.customer_city = 'Palo Alto' GROUP BY C.customer_id HAVING COUNT(*) >= 2;

04)SELECT A.branch_name, COUNT(*) AS Number_Of_Customers FROM account A GROUP BY A.branch_name;

05)SELECT C.customer_name, A.account_number from customer C, depositor D, account A WHERE C.customer_id = D.customer_id AND D.account_number = A.account_number ORDER BY A.balance DESC LIMIT 2;

06)SELECT branch_name, (SUM(balance) * 4)/100 AS "Total Interest" FROM account GROUP BY branch_name;

07)SELECT c.customer_name FROM customer c, depositor d, borrower b, loan l WHERE c.customer_id=d.customer_id AND c.customer_id = b.customer_id AND b.loan_number=l.loan_number and l.branch_name="Perryridge";
   
08)SELECT a.account_number FROM (account a INNER JOIN branch b ON a.branch_name=b.branch_name) WHERE(b.branch_city, a.balance)IN (SELECT b.branch_city, max(a.balance) FROM (account a INNER JOIN branch b ON a.branch_name=b.branch_name) GROUP  BY b.branch_city);

09) SELECT C.customer_name FROM customer C,depositor D,account A WHERE C.customer_id=D.customer_id AND D.account_number=A.account_number AND A.branch_name='Perryridge' AND C.customer_id not in (SELECT B.customer_id FROM customer C,borrower B,loan L WHERE C.customer_id=B.customer_id AND B.loan_number=L.loan_number AND L.branch_name='Perryridge');

10)SELECT branch_name FROM branch WHERE assets < ALL(SELECT assets FROM branch WHERE branch_city = "Brooklyn");

