package com.Consultancy;
import java.sql.SQLException;
import com.ConProvider.ConnectionProvider;
import com.ConProvider.ConnectionProviderSingleTone;

public class ConsultancyImplements implements consultancy {

	@Override
	public boolean save(ConsultancyModel con) {

		try {
			String sql = "{call sp_insert_consultancy(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			/*
			 * String
			 * qQuery="insert into consultancydetails(uname, upass, fname, lname, mnumber, lnumber, email, consultancyname, c_date, street, city, state, country, zipcode,User_Type,e_date)"
			 * +"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			 */
			/*
			 * ConnectionProvider.con=ConnectionProvider.getConnection();
			 * ConnectionProvider.ps=ConnectionProvider.con.prepareStatement(
			 * qQuery);
			 */

			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setString(1, con.getCon_uname());
			ConnectionProvider.csmt.setString(2, con.getCon_upass());
			ConnectionProvider.csmt.setString(3, con.getCon_fname());
			ConnectionProvider.csmt.setString(4, con.getCon_lname());
			ConnectionProvider.csmt.setString(5, con.getCon_mnumber());
			ConnectionProvider.csmt.setString(6, con.getCon_wnumber());
			ConnectionProvider.csmt.setString(7, con.getCon_email());
			ConnectionProvider.csmt.setString(8, con.getCon_consultancyname());
			ConnectionProvider.csmt.setString(9, con.getCon_date());
			ConnectionProvider.csmt.setString(10, con.getCon_street());
			ConnectionProvider.csmt.setString(11, con.getCon_city());
			ConnectionProvider.csmt.setString(12, con.getCon_state());
			ConnectionProvider.csmt.setString(13, con.getCon_country());
			ConnectionProvider.csmt.setString(14, con.getCon_zipcode());
			ConnectionProvider.csmt.setString(15, con.getCon_e_date());
			ConnectionProvider.csmt.setString(16, "Consultant");
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) {
				System.out.println("Successfully Inserted");
				ConnectionProvider.CloseAllGlobConnection();
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.gc();

		}

		return false;
	}

	@Override
	public boolean update(ConsultancyModel con, String id) {

		try {
			String qquery = "{call sp_upd_consultancy(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(qquery);
			ConnectionProvider.csmt.setString(1, con.getCon_uname());
			ConnectionProvider.csmt.setString(2, con.getCon_upass());
			ConnectionProvider.csmt.setString(3, con.getCon_fname());
			ConnectionProvider.csmt.setString(4, con.getCon_lname());
			ConnectionProvider.csmt.setString(5, con.getCon_mnumber());
			ConnectionProvider.csmt.setString(6, con.getCon_wnumber());
			ConnectionProvider.csmt.setString(7, con.getCon_email());
			ConnectionProvider.csmt.setString(8, con.getCon_consultancyname());
			ConnectionProvider.csmt.setString(9, con.getCon_date());
			ConnectionProvider.csmt.setString(10, con.getCon_street());
			ConnectionProvider.csmt.setString(11, con.getCon_city());
			ConnectionProvider.csmt.setString(12, con.getCon_state());
			ConnectionProvider.csmt.setString(13, con.getCon_country());
			ConnectionProvider.csmt.setString(14, con.getCon_zipcode());
			ConnectionProvider.csmt.setString(15, "Consultant");
			ConnectionProvider.csmt.setString(16, con.getCon_e_date());
			ConnectionProvider.csmt.setString(17, id);
			int a = ConnectionProvider.csmt.executeUpdate();

			if (a > 0) {
				System.out.println("Successfully Updated");
				return true;
			} else {
				System.out.println("Request is abended.. Please Try Again..");
				return false;
			}

			/*
			 * String
			 * qQuery="update consultancydetails uname='"+con.getCon_uname()
			 * +"', upass='"+con.getCon_upass()+"', fname='"+con.getCon_fname()
			 * +"', "+ "lname='"+con.getCon_lname()
			 * +"', mnumber='"+con.getCon_mnumber()
			 * +"', lnumber='"+con.getCon_wnumber()
			 * +"', email='"+con.getCon_email() +"', "+
			 * "consultancyname='"+con.getCon_consultancyname()
			 * +"', date='"+con.getCon_date() +"', street='"+con.getCon_street()
			 * +"', city='"+con.getCon_city() +"'"+
			 * ", state='"+con.getCon_state()
			 * +"', country='"+con.getCon_country()
			 * +"', zipcode='"+con.getCon_zipcode() +"'";
			 * 
			 * boolean b= ConnectionProvider.UpdateData("consultancydetails",
			 * qQuery, "id="+id);
			 */

		} catch (Exception e) {
			e.printStackTrace();
			System.gc();

		} finally {
			try {
				ConnectionProvider.CloseAllGlobConnection();
			} catch (SQLException e1) {
			}
		}

		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id) {
		String sql = "{call sp_delete_consultancy(?)}";
		try {
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setInt(1, Integer.parseInt(id));
			int b = ConnectionProvider.csmt.executeUpdate();
			if (b > 0) {
				System.out.println("Delete Successfully ..");
				return true;
			} else {
				System.out.println("Request Abandoned. Please Try Again.. ");
				return false;

			}

		} catch (Exception e) {
			e.printStackTrace();
			System.gc();
		} finally {
			try {
				ConnectionProvider.CloseAllGlobConnection();
			} catch (Exception ex) {
			}
		}

		return false;
	}

	@Override
	public ConsultancyModel viewById(String Query) throws SQLException {

		ConsultancyModel con = new ConsultancyModel();
		try {
			ConnectionProvider.rs = ConnectionProvider.SelectData("select * from consultancydetails where id=" + Query);
			if (ConnectionProvider.rs.next()) {
				con.setCon_uname(ConnectionProvider.rs.getString("uname"));
				con.setCon_upass(ConnectionProvider.rs.getString("upass"));
				con.setCon_fname(ConnectionProvider.rs.getString("fname"));
				con.setCon_lname(ConnectionProvider.rs.getString("lname"));
				con.setCon_mnumber(ConnectionProvider.rs.getString("mnumber"));
				con.setCon_wnumber(ConnectionProvider.rs.getString("lnumber"));
				con.setCon_email(ConnectionProvider.rs.getString("email"));
				con.setCon_consultancyname(ConnectionProvider.rs.getString("consultancyname"));
				con.setCon_date(ConnectionProvider.rs.getString("c_date"));
				con.setCon_street(ConnectionProvider.rs.getString("street"));
				con.setCon_city(ConnectionProvider.rs.getString("city"));
				con.setCon_state(ConnectionProvider.rs.getString("state"));
				con.setCon_country(ConnectionProvider.rs.getString("country"));
				con.setCon_zipcode(ConnectionProvider.rs.getString("zipcode"));
				con.setCon_e_date(ConnectionProvider.rs.getString("e_Date"));
				con.setUserType(ConnectionProvider.rs.getString("User_Type"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionProvider.CloseAllGlobConnection();
			
		}
		
return con;
	}

	public void finalize() throws Throwable {
		System.out.println("gc is Called..");
		ConnectionProvider.CloseAllGlobConnection();
	}
}
