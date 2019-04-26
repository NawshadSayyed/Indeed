package com.Company;
import java.sql.SQLException;
import com.ConProvider.ConnectionProvider;
import com.ConProvider.ConnectionProviderSingleTone;

public class CompanyImplements implements Company {

	@Override
	public boolean save(CompanyModel comp) {

		try {
			/*
			 * String
			 * qQuery="insert into companydetails(uname, upass, fname, lname, mnumber, wnumber, email, org_name, cdate, edate, street, city, state, country, zipcode)"
			 * +"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			 */

			String qQuery = "{call sp_InserEmployer(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(qQuery);
			ConnectionProvider.csmt.setString(1, comp.getUname());
			ConnectionProvider.csmt.setString(2, comp.getUpass());
			ConnectionProvider.csmt.setString(3, comp.getFname());
			ConnectionProvider.csmt.setString(4, comp.getLname());
			ConnectionProvider.csmt.setString(5, comp.getM_number());
			ConnectionProvider.csmt.setString(6, comp.getW_number());
			ConnectionProvider.csmt.setString(7, comp.getEmail());
			ConnectionProvider.csmt.setString(8, comp.getOrganization_name());
			ConnectionProvider.csmt.setString(9, comp.getC_date());
			ConnectionProvider.csmt.setString(10, comp.getE_date());
			ConnectionProvider.csmt.setString(11, comp.getStreet());
			ConnectionProvider.csmt.setString(12, comp.getCity());
			ConnectionProvider.csmt.setString(13, comp.getState());
			ConnectionProvider.csmt.setString(14, comp.getCountry());
			ConnectionProvider.csmt.setString(15, comp.getZipcode());
			ConnectionProvider.csmt.setString(16, "Employer");
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) {
				System.out.println("Successfully Inserted..");
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				ConnectionProvider.csmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} 
		return false;
	}

	@Override
	public boolean update(CompanyModel comp, String Id) {
		try {
			String qQuery = "{call sp_upd_company(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(qQuery);
			ConnectionProvider.csmt.setString(1, comp.getUname());
			ConnectionProvider.csmt.setString(2, comp.getUpass());
			ConnectionProvider.csmt.setString(3, comp.getFname());
			ConnectionProvider.csmt.setString(4, comp.getLname());
			ConnectionProvider.csmt.setString(5, comp.getM_number());
			ConnectionProvider.csmt.setString(6, comp.getW_number());
			ConnectionProvider.csmt.setString(7, comp.getEmail());
			ConnectionProvider.csmt.setString(8, comp.getOrganization_name());
			ConnectionProvider.csmt.setString(9, comp.getC_date());
			ConnectionProvider.csmt.setString(10, comp.getE_date());
			ConnectionProvider.csmt.setString(11, comp.getStreet());
			ConnectionProvider.csmt.setString(12, comp.getCity());
			ConnectionProvider.csmt.setString(13, comp.getState());
			ConnectionProvider.csmt.setString(14, comp.getCountry());
			ConnectionProvider.csmt.setString(15, comp.getZipcode());
			ConnectionProvider.csmt.setString(16, Id);
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) {
				System.out.println("Successfully Updated..");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally{
			try {
				ConnectionProvider.csmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}  
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		try {
			String qQuery = "{call sp_delete_company(?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(qQuery);
			ConnectionProvider.csmt.setInt(1, id);
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) {
				System.out.println("Delete Successfully");
				return true;
			}else{
				System.out.println("Try Again..");
					
			}
		} catch (Exception x) {
			x.printStackTrace();
			return false;
		}finally{
			try {
				ConnectionProvider.csmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} 

		return false;
	}

	

	public CompanyModel viewById(String qQuery) throws SQLException {

		CompanyModel cmd = new CompanyModel();
		try {
			ConnectionProvider.rs = ConnectionProvider.SelectData("select * from companydetails where id=" + qQuery);
			if (ConnectionProvider.rs.next()) {
				cmd.setUname(ConnectionProvider.rs.getString("uname").toString());
				cmd.setUpass(ConnectionProvider.rs.getString("upass").toString());
				cmd.setFname(ConnectionProvider.rs.getString("fname").toString());
				cmd.setLname(ConnectionProvider.rs.getString("lname").toString());
				cmd.setM_number(ConnectionProvider.rs.getString("mnumber").toString());
				cmd.setW_number(ConnectionProvider.rs.getString("wnumber").toString());
				cmd.setEmail(ConnectionProvider.rs.getString("email").toString());
				cmd.setOrganization_name(ConnectionProvider.rs.getString("org_name").toString());
				cmd.setC_date(ConnectionProvider.rs.getString("cdate").toString());
				cmd.setE_date(ConnectionProvider.rs.getString("edate").toString());
				cmd.setStreet(ConnectionProvider.rs.getString("street").toString());
				cmd.setCity(ConnectionProvider.rs.getString("city").toString());
				cmd.setState(ConnectionProvider.rs.getString("state").toString());
				cmd.setCountry(ConnectionProvider.rs.getString("country").toString());
				cmd.setZipcode(ConnectionProvider.rs.getString("zipcode").toString());
			}
			return cmd;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
			
		} 

	}
}
