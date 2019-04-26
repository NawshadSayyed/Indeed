package com.ConProvider;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionProviderSingleTone {

	public static Connection temp;
	public static String ConnUri;
	public static String uname;
	public static String upass;
	public static String driver;
	

	private ConnectionProviderSingleTone() {

	}

	public static Connection getInstance() throws SQLException, ClassNotFoundException {
		if (temp == null) {
			Class.forName(driver);
			// for server Connection Con =
	//		Connection Con = DriverManager.getConnection("jdbc:mysql://199.79.62.23:3306/Consult_DB","Consult_Admin","Callisto@123");
			Connection Con = DriverManager.getConnection(ConnUri, uname, upass);
			//Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/consult_db", "root", "root");

			temp = Con;
			return temp;
		} else {
			return temp;
		}
	}

	public static void closeConnection() 
	{
		try {
			ConnectionProviderSingleTone.temp.close();
			ConnectionProviderSingleTone.temp = null;
			System.out.println("Connection is Closed");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void TruncateDatabase(){
		
		String sql="{call sp_truncate_db()}";
		try {
			 ConnectionProvider.csmt =getInstance().prepareCall(sql);
			 int a = ConnectionProvider.csmt.executeUpdate();
			if(a>0)
			{
				System.out.println("Successfully Truncated..");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	

}
