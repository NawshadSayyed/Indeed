package Demopkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import com.ConProvider.ConnectionProvider;


public class abcd 
{

	public static void main(String[] args) {
		
		Random rand = new Random(); 
		int value = rand.nextInt(10000); 
		System.out.println(value);
		/*Connection con=null;
		try{
		
			ResultSet rs= null;
			con =  ConnectionProvider.getConnection();
			rs = ConnectionProvider.SelectData("show processlist");
			while (rs.next()) {
			System.out.println(rs.getString("id"));
			if(rs.getString("Command").equalsIgnoreCase("Sleep") &&  rs.getString("db").equalsIgnoreCase("indeed"))
			{
			PreparedStatement ps =  con.prepareStatement("kill " +rs.getString("id"));
			ps.executeQuery();
			}
			}
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			if(con!=null){
				
			try {
				con.close();
				con =null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		}
		
		*/
	}
	
	
}
