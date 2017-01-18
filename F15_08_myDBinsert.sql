------------F15_08_RESTAURANT----------------------------------------
delete from F15_08_RESTAURANT;
insert into F15_08_RESTAURANT values ('R001', 'Kerby Street', 'Arlington', 'Texas', '76013', 10.00, 22.00, 60);
insert into F15_08_RESTAURANT values ('R002', 'North Collins Street', 'Arlington', 'Texas', '76011', 11.00, 22.00, 70);
insert into F15_08_RESTAURANT values ('R003', 'Lafayette Avenu', 'New York City', 'New York', '10001', 10.00, 22.00, 50);
insert into F15_08_RESTAURANT values ('R004', 'Qwest Cross', 'Seattle', 'Washigton', '98101', 11.00, 22.00, 50);

------------F15_08_EMPLOYEE----------------------------------------
delete from F15_08_EMPLOYEE;
insert into F15_08_EMPLOYEE values (1000, 'David', 'Vinta Maz', 'Dallas', 'Texas', '75252', DATE'2013-12-01', 7000, '682', '8029119', 'Chef', 'R001',1006, DATE'2013-01-13');
insert into F15_08_EMPLOYEE values (1001, 'Frank Dunn', 'North Avenue', 'Dallas', 'Texas', '75242', DATE'2014-02-11', 6539.50, '682', '8109110', 'Chef', 'R001',1006, DATE'2013-01-13');
insert into F15_08_EMPLOYEE values (1002, 'Frank Dunn', 'Kerby Street', 'Arlington', 'Texas', '76013', DATE'2014-08-19', 6599.50, '682', '8108880', 'Chef', 'R001',1006, DATE'2013-01-13');
insert into F15_08_EMPLOYEE values (1003, 'Bruce Thomas', 'Vinta Maz', 'Dallas', 'Texas', '75242', DATE'2013-12-10', 4000.50, '682', '5834715', 'Waiter', 'R001',1006, DATE'2013-01-13');
insert into F15_08_EMPLOYEE values (1004, 'Frank Jr', 'Cooper Street', 'Arlington', 'Texas', '76014', DATE'2014-02-25', 4060.50, '682', '5514715', 'Waiter', 'R001',1006, DATE'2013-01-13');
insert into F15_08_EMPLOYEE values (1005, 'Robert Gil', 'North Collins Street', 'Arlington', 'Texas', '76011', DATE'2014-08-09', 4999.10, '682', '8101472', 'Waiter', 'R001',1006, DATE'2013-01-13');
insert into F15_08_EMPLOYEE values (1006, 'Ed Dunn', 'South Collins Stree', 'Arlington', 'Texas', '76012', DATE'2013-01-13', 10000.78, '630', '5830042', 'Manager', 'R001',NULL,NULL);

insert into F15_08_EMPLOYEE values (1011, 'Harry Jr', 'Vinta Maz', 'Dallas', 'Texas', '75252', DATE'2014-11-11', 7000, '682', '8129119', 'Chef', 'R002',1017,DATE'2015-01-14');
insert into F15_08_EMPLOYEE values (1012, 'Daniel', 'North Avenue', 'Dallas', 'Texas', '75242', DATE'2015-02-11', 6539.50, '682', '8119110', 'Chef', 'R002',1017,DATE'2015-01-14');
insert into F15_08_EMPLOYEE values (1013, 'Monica Dunn', 'Kerby Street', 'Arlington', 'Texas', '76013', DATE'2014-06-26', 6599.50, '682', '8128880', 'Chef', 'R002',1017,DATE'2015-01-14');
insert into F15_08_EMPLOYEE values (1014, 'Bob Thomas', 'Vinta Maz', 'Dallas', 'Texas', '75242', DATE'2014-12-11', 4000.50, '682', '5814715', 'Waiter', 'R002',1017,DATE'2015-01-14');
insert into F15_08_EMPLOYEE values (1015, 'Christopher', 'Cooper Street', 'Arlington', 'Texas', '76014', DATE'2014-07-15', 4060.50, '682', '5504715', 'Waiter', 'R002',1017,DATE'2015-01-14');
insert into F15_08_EMPLOYEE values (1016, 'Carol', 'North Collins Street', 'Arlington', 'Texas', '76011', DATE'2014-07-11', 4999.10, '682', '8171472', 'Waiter', 'R002',1017,DATE'2015-01-14');
insert into F15_08_EMPLOYEE values (1017, 'Patrik Gil', 'South Collins Stree', 'Arlington', 'Texas', '76012', DATE'2015-01-14', 10000.78, '630', '5820042', 'Manager', 'R002',NULL,NULL);

insert into F15_08_EMPLOYEE values (1018, 'Jason Jr', 'Hudson Yard', 'New York City', 'New York', '10001', DATE'2015-03-11', 7100, '888', '6905247', 'Chef', 'R003', 1469, DATE'2014-12-22');
insert into F15_08_EMPLOYEE values (1121, 'Arren', 'Mid Town', 'New York City', 'New York', '10001', DATE'2015-02-10', 6539.50, '800', '8119110', 'Chef', 'R003', 1469, DATE'2014-12-22');
insert into F15_08_EMPLOYEE values (1019, 'Aaliyah', 'Gold Street', 'New York City', 'New York', '10038', DATE'2014-08-26', 6599.50, '800', '2348880', 'Chef', 'R003', 1469, DATE'2014-12-22');
insert into F15_08_EMPLOYEE values (1020, 'Alexandra', 'South Willian Street', 'New York City', 'New York', '10004', DATE'2014-09-11', 4010.50, '888', '5814715', 'Waiter', 'R003', 1469, DATE'2014-12-22');
insert into F15_08_EMPLOYEE values (1021, 'Ashton', 'Nassau Street', 'New York City', 'New York', '10038', DATE'2015-03-15', 4061.50, '888', '4054715', 'Waiter', 'R003', 1469, DATE'2014-12-22');
insert into F15_08_EMPLOYEE values (1022, 'Sharon Lee', 'Ann Street', 'New York City', 'New York', '10004', DATE'2015-07-11', 4989.10, '888', '2058144', 'Waiter', 'R003', 1469, DATE'2014-12-22');
insert into F15_08_EMPLOYEE values (1469, 'Patrik Brown', 'Beekman Street', 'New York City', 'New York', '10021', DATE'2014-12-22', 10010.78, '800', '9970042', 'Manager', 'R003',NULL,NULL);

insert into F15_08_EMPLOYEE values (1030, 'Donald Jr', 'Qwest Cross', 'Seattle', 'Washigton', '98101', DATE'2013-03-11', 7100, '206', '6904247', 'Chef', 'R004', 1436, DATE'2013-12-22');
insert into F15_08_EMPLOYEE values (1031, 'Peter', 'Pine Street', 'Seattle', 'Washigton', '98101', DATE'2014-02-10', 6539.50, '206', '8118110', 'Chef', 'R004', 1436, DATE'2013-12-22');
insert into F15_08_EMPLOYEE values (1032, 'Rahul', 'Stewart Street', 'Seattle', 'Washigton', '98101', DATE'2013-08-26', 6599.50, '206', '2347880', 'Chef', 'R004', 1436, DATE'2013-12-22');
insert into F15_08_EMPLOYEE values (1033, 'Rachel', 'West Ave', 'Seattle', 'Washigton', '98102', DATE'2012-10-11', 4010.50, '206', '5813715', 'Waiter', 'R004', 1436, DATE'2013-12-22');
insert into F15_08_EMPLOYEE values (1034, 'Anil', 'Fremont', 'Seattle', 'Washigton', '98102', DATE'2014-03-15', 4061.50, '206', '4052715', 'Waiter', 'R004', 1436, DATE'2013-12-22');
insert into F15_08_EMPLOYEE values (1035, 'Pam Lee', 'Madison Street', 'Seattle', 'Washigton', '98103', DATE'2015-07-11', 4989.10, '206', '2057144', 'Waiter', 'R004', 1436, DATE'2013-12-22');
insert into F15_08_EMPLOYEE values (1436, 'Tom Brown', 'Yesler Way', 'Seattle', 'Washigton', '98106', DATE'2013-12-22', 10010.78, '206', '9971042', 'Manager', 'R004', NULL, NULL);
------------------------------F15_08_CUSTOMER-----------------------
Delete from F15_08_CUSTOMER;
insert into F15_08_CUSTOMER values (001,'Sam Billings','SamB17@gmail.com','1/2 Itty Drive,Arlington,TX,76012','682-802-9100');
insert into F15_08_CUSTOMER values (002,'Jack','JackBill17@gmail.com','#42 Spark Ave,Arlington,TX,76013','682-801-9101');
insert into F15_08_CUSTOMER values (003,'Peter Burg','Burg@gmail.com','#432 Kerby Street,Arlington,TX,76013','682-812-9100');
insert into F15_08_CUSTOMER values (004,'Nisha Asthana','Nisha_Asthana17@yahoo.com','Vinta Maz,Dallas,TX,75252','682-802-8000');
insert into F15_08_CUSTOMER values (005,'Pooja Khanna','pooja_khanna140@yahoo.com','North Avenue,Dallas,TX,75242','682-812-8000');

insert into F15_08_CUSTOMER values (006,'David Billings','David01@gmail.com','1/2 Reeve Drive,Arlington,TX,76012','682-802-7100');
insert into F15_08_CUSTOMER values (007,'Brian','Great_Brian@gmail.com','#42 Spark Ave,Arlington,TX,76013','682-801-7101');
insert into F15_08_CUSTOMER values (008,'Mike','Mike@gmail.com','#432 Apple Street,Arlington,TX,76013','682-812-7100');
insert into F15_08_CUSTOMER values (009,'Ricky','Ricky17@yahoo.com','Vintage Maz,Dallas,TX,75252','682-802-7000');
insert into F15_08_CUSTOMER values (010,'Nathan','Nathan_Xing@yahoo.com','North Avenue,Dallas,TX,75242','682-812-7000');

insert into F15_08_CUSTOMER values (011,'Tuyen','Tuyen09@gmail.com','Port Morris,New York City,NY,10001','888-802-7100');
insert into F15_08_CUSTOMER values (012,'Brian King','Brian_King@gmail.com','#42 Locust Point,New York City,NY,10002','888-801-7101');
insert into F15_08_CUSTOMER values (013,'Ben Washington','Ben@gmail.com','#432 Westchester Square,New York City,NY,10003','888-812-7100');
insert into F15_08_CUSTOMER values (014,'Andy','Andy17@yahoo.com','Olinville,New York City,NY,10004','888-802-7000');
insert into F15_08_CUSTOMER values (015,'Martin','Martin@yahoo.com','Greenwood Heights,New York City,NY,10005','888-812-7000');

insert into F15_08_CUSTOMER values (016,'Suzane Parker','Suz_parker09@gmail.com','Green Wood,Seattle,,98101','206-802-7100');
insert into F15_08_CUSTOMER values (017,'Melody','Melody_Rutgers@gmail.com','#42 North Point,Seattle,NY,98102','206-801-7101');
insert into F15_08_CUSTOMER values (018,'Jackson','Jack@gmail.com','#432 Meadow Brook Square,Seattle,NY,98101','206-812-7100');
insert into F15_08_CUSTOMER values (019,'Micheal','Micheal17@yahoo.com','View Ridge,Seattle,NY,98102','206-802-7000');
insert into F15_08_CUSTOMER values (020,'Nitin','Nitin@yahoo.com','Roosevelt,Seattle,NY,98101','206-812-7000');

--------------------F15_08_CUST_REST_VISIT--------------------------------------
delete from F15_08_CUST_REST_VISIT;
insert into F15_08_CUST_REST_VISIT values (001,'R001');
insert into F15_08_CUST_REST_VISIT values (002,'R001');
insert into F15_08_CUST_REST_VISIT values (003,'R001');
insert into F15_08_CUST_REST_VISIT values (004,'R001');
insert into F15_08_CUST_REST_VISIT values (005,'R001');

insert into F15_08_CUST_REST_VISIT values (006,'R002');
insert into F15_08_CUST_REST_VISIT values (007,'R002');
insert into F15_08_CUST_REST_VISIT values (008,'R002');
insert into F15_08_CUST_REST_VISIT values (009,'R002');
insert into F15_08_CUST_REST_VISIT values (010,'R002');

insert into F15_08_CUST_REST_VISIT values (011,'R003');
insert into F15_08_CUST_REST_VISIT values (012,'R003');
insert into F15_08_CUST_REST_VISIT values (013,'R003');
insert into F15_08_CUST_REST_VISIT values (014,'R003');
insert into F15_08_CUST_REST_VISIT values (015,'R003');

insert into F15_08_CUST_REST_VISIT values (016,'R004');
insert into F15_08_CUST_REST_VISIT values (017,'R004');
insert into F15_08_CUST_REST_VISIT values (018,'R004');
insert into F15_08_CUST_REST_VISIT values (019,'R004');
insert into F15_08_CUST_REST_VISIT values (020,'R004');
insert into F15_08_CUST_REST_VISIT values (011,'R004');
--------------------F15_08_CUST_REST_VISIT_DET-------------------------------------
delete from F15_08_CUST_REST_VISIT_DET;
insert into F15_08_CUST_REST_VISIT_DET values (001,'R001', DATE'2015-12-01', 12.00, 13.00,3);
insert into F15_08_CUST_REST_VISIT_DET values (002,'R001', DATE'2014-12-01', 11.30, 11.45,1);
insert into F15_08_CUST_REST_VISIT_DET values (003,'R001', DATE'2015-12-01', 20.10, 21.35,4);
insert into F15_08_CUST_REST_VISIT_DET values (004,'R001', DATE'2015-07-11', 19.30, 20.30,5);
insert into F15_08_CUST_REST_VISIT_DET values (005,'R001', DATE'2013-07-01', 20.30, 21.45,6);

insert into F15_08_CUST_REST_VISIT_DET values (006,'R002', DATE'2015-12-02', 12.00, 13.00,3);
insert into F15_08_CUST_REST_VISIT_DET values (007,'R002', DATE'2014-10-10', 11.30, 11.45,1);
insert into F15_08_CUST_REST_VISIT_DET values (008,'R002', DATE'2015-10-01', 14.30, 15.45,4);
insert into F15_08_CUST_REST_VISIT_DET values (009,'R002', DATE'2015-07-11', 16.30, 17.00,5);
insert into F15_08_CUST_REST_VISIT_DET values (010,'R002', DATE'2015-06-01', 20.30, 21.45,6);

insert into F15_08_CUST_REST_VISIT_DET values (011,'R003', DATE'2015-12-02', 12.00, 13.00, 4);
insert into F15_08_CUST_REST_VISIT_DET values (012,'R003', DATE'2014-12-12', 20.00,21.30, 6);
insert into F15_08_CUST_REST_VISIT_DET values (013,'R003', DATE'2015-12-11',  13.30,15.00,5);
insert into F15_08_CUST_REST_VISIT_DET values (014,'R003', DATE'2015-05-11', 16.30,17.00, 4);
insert into F15_08_CUST_REST_VISIT_DET values (015,'R003', DATE'2015-04-01', 19.30,21.45, 10);

insert into F15_08_CUST_REST_VISIT_DET values (016,'R004', DATE'2015-12-02', 11.45, 12.40,4);
insert into F15_08_CUST_REST_VISIT_DET values (017,'R004', DATE'2014-12-13', 20.00, 21.30, 6);
insert into F15_08_CUST_REST_VISIT_DET values (018,'R004', DATE'2015-12-09', 13.30, 15.00, 5);
insert into F15_08_CUST_REST_VISIT_DET values (019,'R004', DATE'2015-04-11', 15.30, 17.00, 4);
insert into F15_08_CUST_REST_VISIT_DET values (020,'R004', DATE'2015-04-01', 19.30, 21.45, 10);
insert into F15_08_CUST_REST_VISIT_DET values (011,'R004', DATE'2015-04-01', 19.35, 21.45, 10);


-------------F15_08_Menu---------------------
delete from f15_08_menu;
insert into f15_08_menu values('idli','entree','indian rice cake','2.00','3.00','4.00');
insert into f15_08_menu values('dosa','entree','indian rice crepe','6.00','7.00','8.00');
insert into f15_08_menu values('filter coffee','beverages','expresso shots with milk', '5.00','6.00','7.00');
insert into f15_08_menu values('masala chai','beverages','indian spices in tea','2.00','3.00','4.00');
insert into f15_08_menu values('upma','appetizer','semolina with baked vegetables','3.50','4.50','7.00');
insert into f15_08_menu values('chappathi','entree','wheat bread','2.50','5.00','6.50');
insert into f15_08_menu values('vegetable curry','entree','indian rice cake','12.00','13.00','14.00');
insert into f15_08_menu values('jamun','dessert','fried flour dough in sugar syrp','5.00','6.50','7.00');
insert into f15_08_menu values('kesari','dessert','semolina with fried cashews','4.00','5.00','6.00');
insert into f15_08_menu values('pulao','entree','indian rice','10.00','11.00','14.00');
insert into f15_08_menu values('samosa','appetizer', 'fried dough with stuffed vegetables','2.00','3.00','4.00');
insert into f15_08_menu values('paneer curry', 'entree','creamy tomato sauce with cottage cheese','10.00','11.00','12.00');
insert into f15_08_menu values('pakora','appetizer','indian vegetables fried in chickpea batter','2.50','3.50','4.50');
insert into f15_08_menu values('kulfi','dessert','indian icecream','4.00','5.00','6.00');

----------------F15_08_RESTAURANT_PHONE-----------------
delete from F15_08_RESTAURANT_PHONE;
insert into F15_08_RESTAURANT_PHONE values ('R001','682','8192637');
insert into F15_08_RESTAURANT_PHONE values ('R001','682','8192636');
insert into F15_08_RESTAURANT_PHONE values ('R002','617','8192678');
insert into F15_08_RESTAURANT_PHONE values ('R002','617','8182678');
insert into F15_08_RESTAURANT_PHONE values ('R003','888','8192987');
insert into F15_08_RESTAURANT_PHONE values ('R003','888','8193987');
insert into F15_08_RESTAURANT_PHONE values ('R004','206','1627873');
-----------------------------f15_08_ingredients values-------------------------------------
delete from f15_08_ingredients;
insert into f15_08_ingredients values ('tomato',100,'veg',200);
insert into f15_08_ingredients values ('onion',150,'veg',300);
insert into f15_08_ingredients values ('potato',70,'veg',150);
insert into f15_08_ingredients values ('garlic',20,'veg',75);
insert into f15_08_ingredients values ('coconut',50,'veg',300);
insert into f15_08_ingredients values ('curry leaves',30,'veg',85);
insert into f15_08_ingredients values ('milk',500,'diary',1000); 
insert into f15_08_ingredients values ('curd',200,'diary',500);
insert into f15_08_ingredients values ('aubergine',100,'veg',350);
insert into f15_08_ingredients values ('cauliflower',100,'veg',250);
insert into f15_08_ingredients values ('beans',100,'veg',200);
insert into f15_08_ingredients values ('semolina',100,'flour',250);
insert into f15_08_ingredients values ('carrot',120,'veg',400);
insert into f15_08_ingredients values ('mango',40,'fruit',100);
insert into f15_08_ingredients values ('coffee',20,'beverage',80);
insert into f15_08_ingredients values ('cottage cheese',125,'diary',375);
insert into f15_08_ingredients values ('lentil',50,'gram',150);
insert into f15_08_ingredients values ('rice',70,'gram',200);
insert into f15_08_ingredients values ('wheat',85,'flour',135);
---------------------f15_08_menu_ingredient-------------------------------------------
delete from f15_08_menu_ingredient;
insert into f15_08_menu_ingredient values ('idli','rice',1,2,3);
insert into f15_08_menu_ingredient values ('idli','lentil',0.5,1,1.5);
insert into f15_08_menu_ingredient values ('dosa','rice',1,2,2.5);
insert into f15_08_menu_ingredient values ('filter coffee','milk',0.5,1,1.5);
insert into f15_08_menu_ingredient values ('masala chai','milk',1.5,1.75,2);
insert into f15_08_menu_ingredient values ('vegetable curry','tomato',2,3,4);
insert into f15_08_menu_ingredient values ('vegetable curry','onion',0.5,1,1.5);
insert into f15_08_menu_ingredient values ('vegetable curry','potato',1,1.5,1.75);
insert into f15_08_menu_ingredient values ('vegetable curry','cauliflower',1,2,3);
insert into f15_08_menu_ingredient values ('vegetable curry','curry leaves',1.75,2.1,3);
insert into f15_08_menu_ingredient values ('chappathi','wheat',0.5,1,1.5);
insert into f15_08_menu_ingredient values ('paneer curry','tomato',2,3,4);
insert into f15_08_menu_ingredient values ('paneer curry','onion',0.5,1,1.5);
insert into f15_08_menu_ingredient values ('paneer curry','potato',1,1.5,1.75);
insert into f15_08_menu_ingredient values ('paneer curry','cauliflower',1,2,3);
insert into f15_08_menu_ingredient values ('paneer curry','beans',1,2,3);
insert into f15_08_menu_ingredient values ('paneer curry','curry leaves',1.5,2.5,3.5);
insert into f15_08_menu_ingredient values ('paneer curry','cottage cheese',1,2,3);
insert into f15_08_menu_ingredient values ('jamun','milk',0.5,1,1.5);
insert into f15_08_menu_ingredient values ('jamun','wheat',1.5,1.75,2.5);
insert into f15_08_menu_ingredient values ('kesari','semolina',1.5,1.75,2.5);
insert into f15_08_menu_ingredient values ('kulfi','milk',2.5,3.15,3.5);
---------------------f15_08_cooks-------------------------------------------------------------------
delete from f15_08_cooks;
insert into f15_08_cooks values('1000','idli');
insert into f15_08_cooks values('1000','dosa');
insert into f15_08_cooks values('1000','chappathi');
insert into f15_08_cooks values('1000','vegetable curry');
insert into f15_08_cooks values('1000','pulao');
insert into f15_08_cooks values('1000','paneer curry');
insert into f15_08_cooks values('1001','masala chai');
insert into f15_08_cooks values('1001','filter coffee');

insert into f15_08_cooks values('1002','upma');
insert into f15_08_cooks values('1002','jamun');
insert into f15_08_cooks values('1002','kesari');
insert into f15_08_cooks values('1002','samosa');
insert into f15_08_cooks values('1002','pakora');
insert into f15_08_cooks values('1002','kulfi');
 
insert into f15_08_cooks values('1011','idli');
insert into f15_08_cooks values('1011','dosa');
insert into f15_08_cooks values('1011','chappathi');
insert into f15_08_cooks values('1011','vegetable curry');
insert into f15_08_cooks values('1011','pulao');
insert into f15_08_cooks values('1011','paneer curry');
 
insert into f15_08_cooks values('1012','masala chai');
insert into f15_08_cooks values('1012','filter coffee');
 
insert into f15_08_cooks values('1013','upma');
insert into f15_08_cooks values('1013','jamun');
insert into f15_08_cooks values('1013','kesari');
insert into f15_08_cooks values('1013','samosa');
insert into f15_08_cooks values('1013','pakora');
insert into f15_08_cooks values('1013','kulfi');
 
insert into f15_08_cooks values('1018','idli');
insert into f15_08_cooks values('1018','dosa');
insert into f15_08_cooks values('1018','chappathi');
insert into f15_08_cooks values('1018','vegetable curry');
insert into f15_08_cooks values('1018','pulao');
insert into f15_08_cooks values('1018','paneer curry');
 
insert into f15_08_cooks values('1019','masala chai');
insert into f15_08_cooks values('1019','filter coffee');
 insert into f15_08_cooks values('1121','upma');
insert into f15_08_cooks values('1121','jamun');
insert into f15_08_cooks values('1121','kesari');

-------------------f15_08_orders-----------------------------------------------
delete from f15_08_orders;
insert into f15_08_orders values(1003,001,'idli',date'2015-12-01',3,12.00,12.40,4,5);
insert into f15_08_orders values(1004,002,'idli',date'2014-02-09',4,16.00,16.30,3,4);
insert into f15_08_orders values(1005,003,'paneer curry',date'2015-07-11',5,19.30,19.50,2,3);
insert into f15_08_orders values(1014,004,'pulao',date'2014-08-09',8,23.10,23.45,4,3);

insert into f15_08_orders values(1015,003,'vegetable curry',date'2014-12-21',10,13.10,14.30,5,2);
insert into f15_08_orders values(1016,005,'jamun',date'2014-05-15',21,15.00,15.30 ,1,2);
insert into f15_08_orders values(1020,006,'jamun',date'2014-03-13',10,22.30,23.10,5,5);
insert into f15_08_orders values(1021,007,'jamun',date'2014-04-14',5,11.30,12.00,5,5);

insert into f15_08_orders values(1022,008,'kesari',date'2014-05-15',4,12.30,13.10,5,5);
insert into f15_08_orders values(1033,009,'kulfi',date'2014-06-11',2,20.30 ,21.45 ,2,3);
insert into f15_08_orders values(1034,010,'kulfi',date'2014-07-21',5,12.00,12.30,NULL,NULL);
insert into f15_08_orders values(1035,011,'filter coffee',date'2014-08-25',10,17.00,17.45,1,2);

 
COMMIT;