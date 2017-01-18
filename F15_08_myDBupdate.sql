----------1. Update salary for employees whose salary is less than 5000----------
update F15_08_EMPLOYEE
set Salary = 10000
where Salary < 5000;
commit;

----------2. Update price whereever the quantity size is small ---------
update F15_08_MENU
set Qty_Price_Small = 1
where Qty_Price_Small > 2;
commit;