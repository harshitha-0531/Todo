package factory;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconn {
	static Connection con=null;
	public static Connection getConn() {
		try {
			if (con==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/todolist","root", "");
			
			
			System.out.print("Database connected Sucessfully");
			}
	
			
		}catch (Exception e) {
			 System.out.println("❌ Database connection failed!");
            e.printStackTrace();
        }
        return con;
	}	

}
