use lab_mysql;

select * from cars;
select * from sales;
select * from customers;
select * from invoices;

INSERT INTO cars VALUES(0,'3K096I98581DHSNUP', 'Volkswagen','Tiguan', '2019', 'Blue'),
(1,'ZM8G7BEUQZ97IH46V','Peugeot','Rifter',	2019 ,'Red'),
(2,'RKXVNNIHLVVZOUB4M' ,'Ford', 'Fusion', 2018 ,'White'),
(3,'HKNDGS7CU31E9Z7JW','Toyota', 'RAV4',2018,'Silver'),
(4,'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019 ,	'Gray'),
(5,'DAM41UDN3CHU2WVF6', 'Volvo' ,'V60 Cross Coun', 2019,'Gray');

insert into sales (staff_id, Name, store_id)
values (00001, "Petey Cruiser", "Madrid"),
(00002, "Anna Sthesia", "Barcelona"),
(00003,"Paul Molive","Berlin"),
(00004, "Gail Forcewind","Paris"),
(00005, "Paige Turner","Mimia"),
(00006, "Bob Frapples", "Mexico City"),
(00007, "Walter Melon", "Amsterdam"),
(00008, "Shonda Leer", "São Paulo");

insert into customers 
values (10001,"PabloPic",34636176382,"-","Paseo de la Chopera, 14", "Madrid","Madrid","Spa",28045),
(20001,"AbrahamL", 13059077086,"-","120 SW 8th St","Miami","Florida","Usa",33130),
(30001,"NapoléonB",33179754000,"-","40 Rue du Colisée","Paris","Ile-de-France","Fra",75008);

insert into invoices (invoice_id, inv_date, car_id, cust_id, sales_name)
values ("852399038", "2018-08-22", 0, 1, 3), ("731166526", "2018-12-31", 3, 0, 5), ("271135104","2019-01-22", 2, 2, 7);

#BONUS CHALLENGE
#1. Now you find an error you need to fix in your existing data - in the Salespersons table, you mistakenly spelled Miami as Mimia for Paige Turner.
update sales
set store_id="Miami"
where store_id="Mimia";

#2. Also, you received the email addresses of the three customers
update customers
set email = "ppicasso@gmail.com"
where name ="PabloPic";
select * from customers;

update customers
set email = "lincoln@us.gov"
where name ="AbrahamL";

update customers
set email = "hello@napoleon.me"
where name ="NapoléonB";

#3. In addition, you also find a duplicated car entry for VIN DAM41UDN3CHU2WVF6. You want to delete car ID #4 from the database. Create delete.sql to perform the deletion.
delete from cars 
where car_id=4;
select * from cars;