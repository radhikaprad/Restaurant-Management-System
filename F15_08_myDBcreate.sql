CREATE TABLE F15_08_RESTAURANT
        (       Restaurant_Id   VARCHAR(15),
                Street          VARCHAR(25),
                City            VARCHAR(25),
                State           VARCHAR(25),
                Zip_Code        CHAR(6),
                Open_Time       DECIMAL(4,2)    NOT NULL,
                Close_Time      DECIMAL(4,2)    NOT NULL,
                Capacity        NUMBER          NOT NULL,
        PRIMARY KEY (Restaurant_Id));


CREATE TABLE F15_08_EMPLOYEE
        (       Emp_Id   NUMBER(11),
                Name     VARCHAR(25)             NOT NULL,
                Street   VARCHAR(25),
                City     VARCHAR(25),
                State    VARCHAR(25),
                Zip_Code CHAR(6),
                Doj      DATE,
                Salary   NUMBER(8,2) CHECK(Salary > 1000),
                Phone_Area_Code CHAR(3)         NOT NULL,
                Phone_Number    VARCHAR(15)     NOT NULL,
                Designation     VARCHAR(16)     NOT NULL,
                Restaurant_Id   VARCHAR(15),
                Manager_Id      NUMBER(11),
                Start_Date      DATE,
        PRIMARY KEY (Emp_Id),
        FOREIGN KEY (Restaurant_Id) references F15_08_RESTAURANT(Restaurant_Id) on delete set NULL);


CREATE TABLE F15_08_CUSTOMER
	(	Customer_Id	   NUMBER(11),
		Customer_Name	   VARCHAR(40)      NOT NULL,
		Email	           VARCHAR(30),
		Address	           VARCHAR(50)      NOT NULL,
                Phone_Number	   VARCHAR(15)      NOT NULL,
	PRIMARY KEY (Customer_Id));



CREATE TABLE F15_08_CUST_REST_VISIT
        (       Customer_Id      NUMBER(11),
                Restaurant_Id    VARCHAR(15),
        PRIMARY KEY (Customer_Id,Restaurant_Id),
        FOREIGN KEY (Customer_Id) references F15_08_CUSTOMER(Customer_Id)
        On delete CASCADE,
        FOREIGN KEY (Restaurant_Id) references F15_08_RESTAURANT(Restaurant_Id)
        On delete CASCADE);


CREATE TABLE F15_08_CUST_REST_VISIT_DET
	(	Customer_Id      NUMBER(11)        NOT NULL,
		Restaurant_Id	 VARCHAR(15)       NOT NULL,
                Walk_In_Date    Date              NOT NULL,
                Walk_In_Time    Decimal(4,2)       NOT NULL,
                Walk_Out_Time   Decimal(4,2)       NOT NULL,
                People_Count    NUMBER            DEFAULT 1,
	PRIMARY KEY (Customer_Id,Restaurant_Id,Walk_In_Date,Walk_In_Time,Walk_Out_Time,People_Count),
        FOREIGN KEY (Customer_Id) references F15_08_CUSTOMER(Customer_Id)
        On delete CASCADE,
        FOREIGN KEY (Restaurant_Id) references F15_08_RESTAURANT(Restaurant_Id)
        On delete CASCADE);
--------------------------------------II-------------------------------------

CREATE TABLE F15_08_MENU
	(	Item_Name        VARCHAR(25),
		Item_Type        VARCHAR(25)     NOT NULL,
                Description      VARCHAR(256) 	 NOT NULL,
		Qty_Price_Small  NUMBER(5,2)     NOT NULL, 
                Qty_Price_Medium NUMBER(5,2)	 NOT NULL,
        	Qty_Price_Large	 NUMBER(5,2) 	 NOT NULL,
        PRIMARY KEY (Item_Name));

CREATE TABLE F15_08_COOKS
	(	Emp_Id           NUMBER(11),
                Item_Name        VARCHAR(25)     NOT NULL,
	PRIMARY KEY (Emp_Id,Item_Name),
        FOREIGN KEY (Emp_Id) references F15_08_EMPLOYEE(Emp_Id)
        on delete CASCADE,
        FOREIGN KEY (Item_Name) references F15_08_MENU(Item_Name)
        on delete CASCADE);

CREATE TABLE F15_08_ORDERS
	(	Emp_Id           NUMBER(11),
                Customer_Id	 NUMBER(11)   NOT NULL,
                Item_Name        VARCHAR(25)  NOT NULL,
                Order_Date       DATE         NOT NULL,
                Qty_Ordered      NUMBER       NOT NULL,
                Placed_Time      Decimal(4,2)  NOT NULL,
                Fullfilled_Time  Decimal(4,2)  NOT NULL,
                Food_Rating      NUMBER,
                Service_Rating   NUMBER,
	PRIMARY KEY (Emp_Id,Customer_Id,Item_Name),
        FOREIGN KEY (Emp_Id) references F15_08_EMPLOYEE(Emp_Id)
        On delete CASCADE,
        FOREIGN KEY (Customer_Id) references F15_08_CUSTOMER(Customer_Id)
        On delete CASCADE,
        FOREIGN KEY (Item_Name) references F15_08_MENU(Item_Name)
        On delete CASCADE);
--------------------------------------III--------------------------------------
CREATE TABLE F15_08_INGREDIENTS
	(	Ingredient_Name	 VARCHAR(25),
                Unit             NUMBER       NOT NULL,
                Food_Category    VARCHAR(25)  NOT NULL,
                Unit_Price       NUMBER       NOT NULL,
                PRIMARY KEY (Ingredient_Name));

CREATE TABLE F15_08_MENU_INGREDIENT
	(	Item_Name	 VARCHAR(25),
                Ingredient_Name	 VARCHAR(25),
                Qty_Small        NUMBER       NOT NULL,
                Qty_Medium       NUMBER       NOT NULL,
                Qty_Large        NUMBER       NOT NULL,
                PRIMARY KEY (Item_Name,Ingredient_Name),
        FOREIGN KEY (Item_Name) references F15_08_MENU(Item_Name)
        On delete CASCADE,
        FOREIGN KEY (Ingredient_Name) references F15_08_INGREDIENTS(Ingredient_Name)
        On delete CASCADE);

CREATE TABLE F15_08_RESTAURANT_PHONE
	(	Restaurant_Id	   VARCHAR(15)     NOT NULL,
                Area_Code       CHAR(3)         NOT NULL,
                Phone_Number    VARCHAR(15)     NOT NULL,
                PRIMARY KEY (Restaurant_Id,Area_Code,Phone_number),
        FOREIGN KEY (Restaurant_Id) references F15_08_RESTAURANT(Restaurant_Id)
        On delete CASCADE);