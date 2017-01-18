import java.sql.*;
import java.util.Date;
import java.io.*;
import java.util.*;
import java.lang.*;

public class Rest {
	public static Connection conn=null;
    Statement stmt=null;
    
   //constructor
    public Rest(){}
    
  //Function for Database connectivity.
    public void DBConnection()
    {
    	// Command to get SID in SQLPlus - select sys_context('userenv','db_name') from dual;
        String url = "jdbc:oracle:thin:@localhost:1521:CSE1"; // CSE1 is the SID of oracle
        String db_id ="rxy4951";    //rxy4951
        String db_pwd ="fnhn4jyo"; //fnhn4jyo
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, db_id, db_pwd);
            System.out.println("Connection Open - Successful!!!");
            
           }
        catch(ClassNotFoundException e)
        {
            System.out.println("LOADING ERROR:"+e.toString());
        }
        catch(SQLException se)
        {
            System.out.println("FAIL OF DB CONNECTION  : "+se.toString());               
        }
        catch(Exception ee)
        {
            System.out.println("Exception in connection : "+ee.toString());
        }
    }
  //Function to check if user exists
    public int  does_user_exist(String Emp_Id,String name)
    {
        int flag=0;
        try 
        {
            // Create a result set containing all data from my_table
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM F15_08_EMPLOYEE");
            
            // Fetch each row from the result set
            while (rs.next()) 
            {
                // Get the data from the row using the column index
                
                if(rs.getString(1).equals(Emp_Id))
                {
                    
		          if(rs.getString(2).equals(name))
                  {
                       flag=1;
                       break;
                       }
                   
                }
    
            }
            stmt.close();
        } 
        catch (SQLException e) 
        {
        }     
        return flag;
    }
//if waiter
    public int view_designationISwaiter(String Emp_ID)
    {
    //int y=-1;
    int y=0;
    try
    {
    stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM f15_08_EMPLOYEE");

    while(rs.next())
    {
    if(rs.getString(1).equals(Emp_ID))
    {
    if (rs.getString(11).equals("Waiter"))
    {
    y=1;

    }
    }
    }
    }
    catch(Exception e)
    {
    }
    return y;
    }
  //Function to check if an emp is a manager
    public int view_designationISmanager(String Emp_ID)
    {
    //int y=-1;
    int y=0;
    try
    {
    stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM f15_08_EMPLOYEE");

    while(rs.next())
    {
    if(rs.getString(1).equals(Emp_ID))
    {
    if (rs.getString(11).equals("Manager"))
    {
    y=1;

    }
    }
    }
    }
    catch(Exception e)
    {
    }
    return y;
    }
    //Function to check if an emp is a chef
    public int view_designationISchef(String Emp_ID)
    {
    //int y=-1;
    int y=0;
    try
    {
    stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM f15_08_EMPLOYEE");

    while(rs.next())
    {
    if(rs.getString(1).equals(Emp_ID))
    {
    if (rs.getString(11).equals("Chef"))
    {
    y=1;

    }
    }
    }
    }
    catch(Exception e)
    {
    }
    return y;
    }
   //Function to View Menu Details
    public void menu_display()
    {
    try
    {
     stmt = conn.createStatement();
     String value[]=new String[100];
                ResultSet rs = stmt.executeQuery("SELECT * FROM f15_08_MENU");
    System.out.println("Item Name\t\tItem Type\t\tSmall Price\t\tMedium Price\t\t Large Price ");
    System.out.println("***********************************************************************************");
    while(rs.next())
    {
     value = rs.getString(1).split(" ");
    System.out.println(""+value[0]+"\t\t\t"+rs.getString(2)+"\t\t\t"+rs.getString(4)+"\t\t\t"+rs.getString(5)+"\t\t\t"+rs.getString(6));
    //System.out.println(""+rs.getString(2));
    //System.out.println(""+rs.getString(3));
    //System.out.println(""+rs.getString(4));
    //System.out.println(""+rs.getString(5));
    //System.out.println(""+rs.getString(6));
    }
    stmt.close();

    }
    catch(Exception e)
    {
    System.out.println(""+e.toString());
    }
    }
    //function to cancel order
    public void cancel_cust_order(String cust_id)
    {
    BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
    String str;
    int flag2=0;
    try{
    ResultSet rs = stmt.executeQuery("SELECT * FROM f15_08_orders");
    while(rs.next())
    {
    if(rs.getString(2).equals(cust_id))
    {
    flag2=1;
    }
    }
    if(flag2==1)
    {
    stmt = conn.createStatement();
    str="DELETE FROM f15_08_orders where CUSTOMER_ID='"+cust_id+"'";
    System.out.println("Deleted the orders of customer "+cust_id);
    stmt.executeQuery(str);
    stmt.close();
    }
    else
    {
    System.out.println("This customer is not available in the database.Please create an account");
    }
    }
    catch(Exception e)
    {
    }
    }
 //function to cancel an item
    public void cancel_item(String id,String name)
    {
    BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
    String sql1;
    int flag3=0;
    int flag4=0;
    try{
    ResultSet rs = stmt.executeQuery("SELECT o.customer_id,o.item_name,m.item_name FROM f15_08_orders o, f15_08_menu m where o.item_name=m.item_name");

    while(rs.next()){
    if(rs.getString(1).equals(id) && rs.getString(2).equals(name) && rs.getString(3).equals(name)){
    flag3=1;
    }
    }
    if(flag3==1)
    {
    sql1="DELETE FROM f15_08_orders where CUSTOMER_ID='"+id+"'";
    stmt.executeQuery(sql1);
    System.out.println("Customer has been deleted");
    stmt.close();
    }
    else{
    System.out.println("Please check your order details");
    }
    }
    catch(Exception e)
    {
    }
    }

    //Taking Order for a customer
    public void take_order(String Emp_Id)
    {
    BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
    String[] str=new String[20];
    String sql;
    int i=1;
    int flag1=0;
    try
    {
    stmt = conn.createStatement();
    System.out.println("Enter the Customer Id");
    str[1]=input.readLine();
    System.out.println(str[1]);
    ResultSet rs = stmt.executeQuery("SELECT * FROM F15_08_CUSTOMER");
    //rs.next();
    //System.out.println(rs.getString(1));
    while(rs.next())
    {
    if(rs.getString(1).equals(str[1])) //if(rs.getString(1).equals(Cust_ID))
    {
    flag1=1;
    //System.out.println(flag1);
    }
    }
    if (flag1==1)
    {
    System.out.println("Enter Order details details");
    for (i=2;i<9;i++){
    str[i]=input.readLine();
    }
    System.out.println("");
    
    
   sql = "insert into f15_08_orders values("
    +Emp_Id+","+str[1]+",'"+str[2]+"',"+"date'"+str[3]+"',"+str[4]+","+str[5]+","+str[6]+","+str[7]+","+str[8]+")";
    /*sql = "INSERT INTO f15_08_orders values('"+Emp_Id+"','"+str[1]+"','"+str[2]+"','"+str[3]+"','"+str[4]+"','"+str[5]+"','"+str[6]+"','"+str[7]+"','"+str[8]+"')";*/
    stmt.executeQuery(sql);
    System.out.println("Order Taken");
    stmt.close();
    }

    }

    catch(Exception e)
    {
    }
    }
   //Customer_Visit
    public void Customer_Visit(String date1,String date2)
    {
    try
    {
     stmt = conn.createStatement();
		
		String comma = ",";
		String sql = "SELECT C.Restaurant_Id"
				+ comma
				+ "COUNT(*) AS Number_of_ppl_visited FROM F15_08_CUST_REST_VISIT_DET C"
				+ comma
				+ "F15_08_Restaurant R WHERE C.Restaurant_Id = R.Restaurant_Id AND Walk_In_Date BETWEEN '"
				+ date1 + "' AND '" + date2
				+ "' GROUP BY Rollup(C.Restaurant_Id)";
     
                ResultSet rs = stmt.executeQuery(sql);
                System.out.println("Customer Visit between given dates");  
    while(rs.next())
    {
    System.out.print(""+rs.getString(1));
    System.out.println(" "+rs.getString(2));
    }
    stmt.close();

    }
    catch(Exception e)
    {
    System.out.println(""+e.toString());
    }
    }
  //Customer_max_Visit
    public void Customer_Max_visit_Rest()
    {
    try
    {
     stmt = conn.createStatement();
		
		String comma = ",";
		String sql = "SELECT temp.Rest_Id,MAX(temp.PPL_COUNT) AS MAX_NUM FROM ( select a.Restaurant_Id AS Rest_Id"
				+ comma
				+ "count(*) AS PPL_COUNT FROM F15_08_CUST_REST_VISIT_DET a Group BY a.Restaurant_Id order by PPL_COUNT desc) temp where rownum=1 Group BY temp.Rest_Id";
                ResultSet rs = stmt.executeQuery(sql);
                System.out.println("Restaurant with maximum customer visit");
    while(rs.next())
    {
    System.out.print(""+rs.getString(1));
    System.out.println(" "+rs.getString(2));
    }
    stmt.close();

    }
    catch(Exception e)
    {
    System.out.println(""+e.toString());
    }
    }
//view ratings for a given restaurant
    public void view_ratings(String Rest)
    {
    try
    {
     stmt = conn.createStatement();
		
		String comma = ",";
		String sql = "select avg(service_rating) as avg_service_rating"
				+comma
				+"avg(food_rating) as avg_food_rating"
				+comma
				+"count(f15_08_orders.customer_id) as no_of_ppl"
				+comma
				+"f15_08_cust_rest_visit.restaurant_id as restaurant from f15_08_orders"
				+comma+"f15_08_cust_rest_visit where service_rating is not NULL and food_rating is not NULL and f15_08_cust_rest_visit.restaurant_id = '"+Rest+"' and f15_08_orders.customer_id= f15_08_cust_rest_visit.customer_id group by f15_08_cust_rest_visit.restaurant_id order by avg_service_rating desc";
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("Ser_Rating"+" "+"Food_Rating"+" "+"PPL_Count"+" "+"Restaurant");
    while(rs.next())
    {
    float service = Float.parseFloat(rs.getString(1));
    service=(float)Math.floor(service*100)/100;
    float food = Float.parseFloat(rs.getString(1));
    food=(float)Math.floor(food*100)/100;
    System.out.print("   "+service);
    System.out.print("    "+food);
    System.out.print("          "+rs.getString(3));
    System.out.print("          "+rs.getString(4));
    System.out.println();
    }
    stmt.close();

    }
    catch(Exception e)
    {
    System.out.println(""+e.toString());
    }
    }
  //Best Food and Service Restaurant
    public void view_BestFoodService_Rest()
    {
    try
    {
     stmt = conn.createStatement();
		
		String comma = ",";
		String sql_food = "select * from (select f15_08_restaurant.restaurant_id as rest_id"
                + comma
                +"max(total_food_rating) as avg from(select avg(food_rating) as total_food_rating"
                +comma
                +"count(f15_08_orders.customer_id) as no_of_ppl"
                +comma+
                "f15_08_cust_rest_visit.restaurant_id as rest from f15_08_orders"
                +comma+
                "f15_08_cust_rest_visit where food_rating is not NULL and f15_08_orders.customer_id= f15_08_cust_rest_visit.customer_id group by f15_08_cust_rest_visit.restaurant_id) Rest_rating"
                +comma+"f15_08_restaurant where rest=f15_08_restaurant.restaurant_id group by f15_08_restaurant.restaurant_id order by avg desc) max_table where rownum=1";
                ResultSet rs1 = stmt.executeQuery(sql_food);     
                System.out.println("*******Restaurant with Best Food rating********");
                while(rs1.next())
                {
                System.out.print(""+rs1.getString(1));
                System.out.println("     "+rs1.getString(2));
                }
                System.out.println("*******Restaurant with Best Service rating********");
                
       String sql_serv = "select * from (select f15_08_restaurant.restaurant_id as rest_id"
                        + comma
                        +"max(total_service_rating) as avg from(select avg(service_rating) as total_service_rating"
                        +comma
                        +"count(f15_08_orders.customer_id) as no_of_ppl"
                        +comma+
                        "f15_08_cust_rest_visit.restaurant_id as rest from f15_08_orders"
                        +comma+
                        "f15_08_cust_rest_visit where food_rating is not NULL and f15_08_orders.customer_id= f15_08_cust_rest_visit.customer_id group by f15_08_cust_rest_visit.restaurant_id) Rest_rating"
                        +comma+"f15_08_restaurant where rest=f15_08_restaurant.restaurant_id group by f15_08_restaurant.restaurant_id order by avg desc) max_table where rownum=1";
                        ResultSet rs2 = stmt.executeQuery(sql_serv);
   while(rs2.next())
    {
    System.out.print(""+rs2.getString(1));
    System.out.println("     "+rs2.getString(2));
    }
    stmt.close();

    }
    catch(Exception e)
    {
    System.out.println(""+e.toString());
    }
    }
    //Get most ordered food
    public void get_maxOrdered()
    {
    try
    {
     stmt = conn.createStatement();
		
		String comma = ",";
		String sql = "SELECT Item_Name"
				+comma+"COUNT(*) FROM F15_08_ORDERS GROUP BY Item_Name HAVING COUNT(*) = (SELECT MAX(A.count) FROM (SELECT COUNT(*) AS count FROM F15_08_ORDERS GROUP BY Item_Name) A)";
		       
		
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("*******Food Ordered the most along with count*******");
    while(rs.next())
    {
    System.out.print(""+rs.getString(1));
    System.out.println(" "+rs.getString(2));
    }
    stmt.close();

    }
    catch(Exception e)
    {
    System.out.println(""+e.toString());
    }
   
    }
    /*view all the menu items */
  
    public void view_cookorder(String cook_id)
    {
    try
    {
     stmt = conn.createStatement();
		
		
		 String sql = "select * from F15_08_COOKS where Emp_Id = '"+cook_id+"'"; //check for orders
		ResultSet rs = stmt.executeQuery(sql);
    while(rs.next())
    {
    System.out.print(" "+rs.getString(1));
    System.out.println(" "+rs.getString(2));
   
    }
    stmt.close();

    }
    catch(Exception e)
    {
    System.out.println(""+e.toString());
    }
   
    }
    //average speed of service at each restaurant for orders placed at each restaurant
    public void get_avgServieSpeed()
    {
    try
    {
     stmt = conn.createStatement();
		
		String comma = ",";
		String sql = "select restaurant_id, AVG(Fullfilled_Time-Placed_Time) as Timediff from F15_08_ORDERS"
				+comma+
				"F15_08_CUST_REST_VISIT where F15_08_ORDERS.Customer_Id = F15_08_CUST_REST_VISIT.Customer_Id group by restaurant_id";
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("*******average speed of service at each restaurant for orders placed*******");
    while(rs.next())
    {
    System.out.print(""+rs.getString(1));
    float temp = Float.parseFloat(rs.getString(2));
    temp= (float)Math.floor(temp*1000)/1000;
    System.out.println(" "+temp);
    }
    stmt.close();

    }
    catch(Exception e)
    {
    System.out.println(""+e.toString());
    }
    }
/*Method to Delete Item from Menu*/
    public void delete_Item(String Item_Name)
    {
    try
    {
     stmt = conn.createStatement();
		
		String sql = "DELETE FROM F15_08_MENU WHERE Item_Name='"+Item_Name+"'";
		ResultSet rs = stmt.executeQuery(sql);
        System.out.println("\nDeletion Successful!");
        stmt.close();
    }
    catch(Exception e)
    {
    System.out.println(""+e.toString());
    }
    }
    
    /*insert menu item */
    public void insert_Item()
    {
    	BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
    	
    try
    {
    	System.out.println("\nEnter Item_Name: ");    
        String Item_Name=input.readLine();
        System.out.println("\nEnter Item_Type: "); 
        String Item_Type=input.readLine();
        System.out.println("\nEnter Description: ");
        String Description=input.readLine(); 
        System.out.println("\nEnter Qty_Price_Small: "); 
        String Qty_Price_Small=input.readLine();
        System.out.println("\nEnter Qty_Price_Medium: "); 
        String Qty_Price_Medium=input.readLine();
        System.out.println("\nEnter Qty_Price_Large: "); 
        String Qty_Price_Large=input.readLine();
        
        stmt = conn.createStatement();
        
		//String comma = ",";
		String sql = "insert into f15_08_menu values('"
				+Item_Name+
				"','"+Item_Type+"','"+Description+"',"+Qty_Price_Small+","+Qty_Price_Medium+","+Qty_Price_Large+")";
		
		System.out.println("\nInsertion Successful!");
		
		
		
        stmt.executeQuery(sql);
        stmt.close();

    }
    catch(Exception e)
    {
    System.out.println(""+e.toString());
    }
    }
/*update menu item price */
    public void update_item_price(String Item_Name,String price)
    {
        try 
        {
            
            stmt = conn.createStatement();
            stmt.executeQuery("UPDATE f15_08_menu SET Qty_Price_Small='"+price+"' WHERE Item_Name='"+Item_Name+"'");
            stmt.executeQuery("commit");
            System.out.println("\n Updation Successful!");
            stmt.close();
        } 
        catch (SQLException e) 
        {
            System.out.println(e.toString());
        }
        
    }
    /*update salaries of the employees based on designation using prepared statement*/
    public void Update_EmpSal(String Designation,Float Sal_Incrment)
    { 
    	
        try 
        {
            
            stmt = conn.createStatement();
            stmt.executeQuery("Update F15_08_EMPLOYEE set Salary = Salary +"+Sal_Incrment+" where Designation = '"+Designation+"'");
            stmt.executeQuery("commit");
            System.out.println("\n Updation Successful!");
            stmt.close();
        } 
        catch (SQLException e) 
        {
            System.out.println(e.toString());
        }
        
    }
    /*update salaries of the chef by 10*/
    public void Update_ChefSal()
    { 
    	PreparedStatement prSt = null;
    	
    	try {
    		 stmt = conn.createStatement();
    		String query = "Update F15_08_EMPLOYEE set Salary = Salary + ? where Designation = ?";
            prSt = conn.prepareStatement(query);
            prSt.setInt(1, 10);
            prSt.setString(2, "Chef");
            prSt.executeUpdate();
            stmt.executeQuery("commit");
			System.out.println("\n Updation Successful!");
			 prSt.close();
			stmt.close();
		} catch (SQLException e) {
			System.out.println(e.toString());
		}
        
    }
    /*Insert value into the cook table */
    public void Insert_Chefdet()
    {
    	BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
    	
        try
        {
        	System.out.println("\nEnter Emp_Id: ");    
            String Emp_Id=input.readLine();
            System.out.println("\nEnter Item_Name: "); 
            String Item_Name=input.readLine();
            
            stmt = conn.createStatement();
            
    		String comma = ",";
    		 
    	    String sql ="insert into f15_08_cooks values('"+Emp_Id+"','"+Item_Name+"')";
    		
    		System.out.println("\nChef_Insertion Successful!");
    		
    		
    		
            stmt.executeQuery(sql);
            stmt.close();

        }
        catch(Exception e)
        {
        System.out.println(""+e.toString());
        }
        }
    
    public void add_cust()
    {
    try
    {
    int x=0;
    int y=0;
    //boolean a=0;
    BufferedReader values = new BufferedReader(new InputStreamReader(System.in));
    String str1,cust_id,cust_name,email,add,phone;
    ResultSet rs = stmt.executeQuery("SELECT * FROM f15_08_customer");
    System.out.println("\n Please add the customer details");
    System.out.println("\n Enter the customer id");
    cust_id=values.readLine();
    x=check(cust_id);
    //a=isAlpha(cust_id);
    //if(a=1){
    //System.out.println("Contains alphabets.Please enter numerical values for customer id");

    //}
    while(x!=0){
    //if(a=1){
    //System.out.println("Contains alphabets.Please enter numerical values for customer id");
    //}
    x=check(cust_id);
    System.out.print("Enter a valid customer id");
    cust_id=values.readLine();
    }
    System.out.println("\n Enter the customer name");
    cust_name=values.readLine();
    System.out.println("\n Enter the email address");
    email=values.readLine();
    System.out.println("\n Enter the address");
    add=values.readLine();
    System.out.println("\n Enter the phone number");
    phone=values.readLine();
    str1="INSERT INTO f15_08_customer values('"+cust_id+"','"+cust_name+"','"+email+"','"+add+"','"+phone+"')";
    stmt.executeQuery(str1);
    System.out.println("\n Customer Details added");
    stmt.close();
    }
    catch(Exception e){
    }
    }
    public int check(String cust_id){
    	int y=0;
    	try{


    	ResultSet rs = stmt.executeQuery("SELECT * FROM f15_08_customer");
    	while(rs.next())
    	{
    	if(rs.getString(1).equals(cust_id)){
    	y=1;
    	}
    	}
    	}
    	catch(Exception e)
    	{
    	}
    	return y;
    	}
    

            
    //Main() method from here
    public static void main(String[] args) 
    {
    		// TODO Auto-generated method stub
    		System.out.println("Start Program");
    		Rest res = new Rest();
    		res.DBConnection();
    	
            	String Choice = "";
            	int scase = 0;
                
            	InputStreamReader i = new InputStreamReader(System.in);
            	BufferedReader stdin = new BufferedReader(i);
            
            
                
                	
       		try{
       			do{
                    System.out.println("\n **********WELCOME TO FOOD FETE RESTAURANT MANAGEMENT SYSTEM**********");
                    System.out.println("\n\n Please select from the following options : ");
                    System.out.println("\n 1. Menu Display.");
                    System.out.println("\n 2. Employee Login.");
                    System.out.println("\n 3. New Customer Registration.");
                    System.out.println("\n 4. Quit");
                    System.out.println("\n\n PLEASE ENTER YOUR CHOICE :");
                    Choice=stdin.readLine();
                    scase=Integer.parseInt(Choice);
                    
                    	switch(scase)
                    		{
    					case 1:
    						            {
                                         System.out.println("Menu Display");
                                         res.menu_display();
                                         break;
                                         }
                        			case 2:
                        				 {   System.out.println("For Employee login");
                        				     String data1, data2;
                                             int x=-1;
                                             BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
                                             System.out.println("\n\n Enter the Employee ID : ");
                                             data1=input.readLine();
                                             System.out.println("\n\n Enter the Employee Name : ");
                                             data2=input.readLine(); 
                                             //res.DBConnection();
                                             //int designation=-1;
                                             x=res.does_user_exist(data1,data2);
                                             //System.out.println(x); //if emp_exits x=1
                                             if(x==1)
                                             {   int designation = -1;
                                             designation=res.view_designationISwaiter(data1); 
                                             //System.out.println(designation); //if emp_exits x=1//if waiter designation=1
                                                    if(designation == 0){
                                            	       //System.out.println("The employee is not a Waiter");
                                            	       designation=res.view_designationISmanager(data1);
                                            	       //System.out.println(designation);
                                            	       if(designation != 0)
                                            	       { int scase1;
                                            	    	   do{
                                            	          scase1=0;
                                            	        //if employee is a manager
                                            	         System.out.println("\nHi Manager "+data2);
                                            	         System.out.println("***For Manager*** ");
                                                   	     //System.out.println("Enter your choice ");
                                                   	     System.out.println("\n1.View all Customers visiting b/n particular dates.");
                                                   	     System.out.println("\n2.Find a restaurant with max customers.");
                                                   	     System.out.println("\n3.view ratings of a particular restaurant");
                                                   	     System.out.println("\n4.View all restaurants with best food ratings and Service Ratings");
                                                   	     System.out.println("\n5.View Food Ordered the most");
                                                   	     System.out.println("\n6.View average speed of service in each restaurant");
                                                   	     System.out.println("\n7.Update Item Price");
                                                   	     System.out.println("\n8.Delete a menu Item.");
                                                   	     System.out.println("\n9.Insert a menu Item.");
                                                   	     System.out.println("\n10.Add a customer");//here
                                                   	     System.out.println("\n11.Update an employee salary");
                                                   	     System.out.println("\n12.Update an chef salary");
                                                   	     System.out.println("\n13.Exit to Login Page.");
                                                         System.out.println("\n14.Exit System.");
                                                   	     System.out.println("Enter your choice");
                                                   	     Choice=stdin.readLine();
                                                   	     scase1=Integer.parseInt(Choice);
                                                   	  switch(scase1)
                                                  	{
                                                  	     case 1:{
                                                  	    	String date1,date2 ;
                                                  	    	System.out.println("\n Enter the Date1 : ");
                                                             date1=input.readLine();
                                                            System.out.println("\n Enter the Date2 : ");
                                                             date2=input.readLine(); 
                                                             //date1="30-NOV-15";
                                                             //date2 = "31-DEC-15";
                                                  	    	 res.Customer_Visit(date1,date2);
                                                     		 break;
                                                  	     }
                                                  	     case 2:{
                                                  	    	res.Customer_Max_visit_Rest();
                                                  	    	break;

                                                   	     }
                                                  	   case 3:{
                                                  		    String Rest;
                                                  		    System.out.println("\n Enter the Restaurant Id : ");
                                                  		    Rest=input.readLine();
                                                 	    	res.view_ratings(Rest);
                                                 	    	break;

                                                  	     }
                                                  	 case 4:{
                                              	    	res.view_BestFoodService_Rest();
                                              	    	break;

                                               	     }
                                                  	case 5:{
                                              	    	res.get_maxOrdered();
                                              	    	break;

                                               	     }
                                                  	case 6:{
                                              	    	res.get_avgServieSpeed();
                                              	    	break;

                                               	     }
                                                  	case 7:{
                                                  		String Item_Name, price;
                                                        System.out.println("\n\nPlease enter Item_Name: ");
                                                        Item_Name=input.readLine();
                                                        System.out.println("\n\nPlease enter new price: ");
                                                        price=input.readLine();                                        
                                                        res.update_item_price(Item_Name,price);
                                                        break;
                                              	    	
                                              	    

                                               	     }
                                                  	case 8:{
                                              	    	
                                              	    	String Item_Name ;
                                                        System.out.println("\n\nPlease enter Item_Name: ");
                                                        Item_Name = input.readLine();                                        
                                                        res.delete_Item(Item_Name);
                                              	    	break;

                                               	     }
                                                  	case 9:
                                                  	{
                                                  		res.insert_Item();
                                                  		break;
                                                  	}
                                                  	case 10:
                                                  	{
                                                  		res.add_cust();
                                                  		break;
                                                  	}
                                                  	case 11:
                                                  	{
                                                  		//Update an employee salary;
                                                  		String Designation ;
                                                  		Float Sal_inc;
                                                        System.out.println("\n\nPlease enter Designation: ");
                                                        Designation = input.readLine();   
                                                        System.out.println("\n\nPlease enter increment for salary: ");
                                                        Sal_inc = Float.parseFloat(input.readLine());
                                                  		res.Update_EmpSal(Designation,Sal_inc);
                                                  	}
                                                  	case 12:
                                                  	{
                                                  		//Update a chef salary;
                                                  		
                                                  		res.Update_ChefSal();
                                                  		break;
                                                  	}
                                                  	case 13:
                                                    {
                                                        break;
                                                    } 
                                                  	case 14:
                                                    {   scase1=13;
                                                        scase=4;
                                                        break;
                                                    }
                                                  	    	 
                                                  	     }                                                  		 
                                            	    	   }while(scase1!=13);
                                                       }
                                            	       else
                                            	       {
                                            	    	 //if employee is not a manager
                                            	    	   designation=res.view_designationISchef(data1);
                                                	       System.out.println(designation);// if chef designation=1
                                                	       if(designation != 0)
                                                	       {
                                                	    	   int temp=0;
                                                	    	   do
                                                	    	   {
                                                	    	   
                                                   	        //if employee is a chef
                                                   	             System.out.println("***For Chef*** ");
                                                          	     System.out.println("\n1.View cook details.\n");
                                                          	     System.out.println("\n2.Main Menu.\n");
                                                          	     
                                                          	     System.out.println("Enter your choice");
                                                         	     Choice=stdin.readLine();
                                                         	     temp=Integer.parseInt(Choice);
                                                         	    switch(temp){
                                                         	    case 1:
                                                         	    {   String cook_id ;
                                                                    System.out.println("\n\nPlease enter Id: ");
                                                                    cook_id = input.readLine();
                                                         	    	res.view_cookorder(cook_id);
                                                         	    	break;
                                                         	    }
                                                         	    case 2:
                                                         	    	break;
                                                         	    
                                                         	   default:
                                                               {    
                                                                   System.out.println("\nWRONG value");
                                                                   break;
                                                               }
                                                         	    
                                                         	    }
                                                         	    }while(temp != 2);
                                                	       }
                                            	    	   
                                            	       }
                                                    }
                                                    else
                                                    { 
                                                    	//if employee is a waiter
                                                    	int scase1=0;
                                                    	do{
                                                    	System.out.println("\nHi Waiter "+data2);
                                                    	System.out.println("***For Waiter*** ");
                                                    	System.out.println("Enter your choice ");
                                                    	System.out.println("\n1.Place an order\n"); 
                                                    	System.out.println("\n2.Cancel an order\n");
                                                    	System.out.println("\n3.Insert Chef details\n");
                                                    	System.out.println("\n4.Main Menu\n");
                                                    	System.out.println("Enter your choice");
                                                    	Choice=stdin.readLine();
                                                    	scase1=Integer.parseInt(Choice);
                                                    	switch(scase1)
                                                    	{
                                                    	case 1:{
                                                    		res.take_order(data1);
                                                    		break;}
                                                    	case 2:{
                                                    		scase=0;
                                                    	do{
                                                    		System.out.println("Enter your choice ");
                                                    		System.out.println("\n\n1. Delete all the orders of a customer\n\n");
                                                    		System.out.println("\n\n2. Delete one item or more items for a customer\n\n");
                                                    		System.out.println("\n\n3. Break\n\n");
                                                    		
                                                    		BufferedReader inp = new BufferedReader(new InputStreamReader(System.in));
                                                    		Choice=stdin.readLine();
                                                    		scase=Integer.parseInt(Choice);
                                                    		switch(scase){
                                                    		case 1:
                                                    		{
                                                    		System.out.println("Enter the customer id");
                                                    		String cust_id=inp.readLine();
                                                    		res.cancel_cust_order(cust_id);
                                                    		break;
                                                    		}
                                                    		case 2:
                                                    		{
                                                    		System.out.println("Enter the customer id");
                                                    		String id=inp.readLine();
                                                    		System.out.println("Enter the item name");
                                                    		String item=inp.readLine();
                                                    		res.cancel_item(id,item);
                                                    		break;
                                                    		}
                                                    		case 3:
                                                    		{
                                                    			break;
                                                    		}


                                                    		
                                                    		}


                                                    		
                                                    	}while(scase!=3);
                                                    	break;}
                                                    	 case 3:{
                                                    	
                                                    		res.Insert_Chefdet();
                                                    		break;}
                                                    	 case 4:{
                                                         	
                                                     		
                                                     		break;}
                                                    	
                                                    	 

                                                    	}
                                                    	



                                                    	
                                                    	}while(scase1 !=4);	
                                                    }//else
                                              }
                                             else
                                             {
                                            	 System.out.println("Employee with given EmpId and Empname doesnt exit"); 
                                             }
                        				  
                        				 break;
                        				 }  
                        			case 3:
                        			{    System.out.println("Outer case3"); 
                        				 break;
                        			}
                        			case 4:
                        			{    System.out.println("this is quit"); 
                        				 break;
                        			}
                        			default:
                                    {    
                                        System.out.println("\nWRONG SELECTION");
                                        break;
                                    }
                            			 }
       		}while(scase!=4);//while
       		}
   
   

    catch(Exception e) {System.out.println(""+e.toString());}    		

    }

    }


    


