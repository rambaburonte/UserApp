package pack1;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect implements DBInfo {
		public static Connection getCon() {
			Connection con=null;
			try {
				Class.forName(driver);
				con=DriverManager.getConnection(Dburl,Dbun,dbpass);
			}
			
			catch(Exception e) {
				e.printStackTrace();
			}return con;
			
			
		}
}
