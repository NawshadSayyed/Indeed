package com.Authenticate;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ConProvider.ConnectionProvider;
import com.ConProvider.ConnectionProviderSingleTone;

public class AuthenticateDao {
	/* private static Connection con =null; */
	private static CallableStatement smt = null;
	private static ResultSet rs = null;

	public static ArrayList<AuthenticateModel> getauthenticate(String UserName, String UserPass) throws SQLException {
		ArrayList<AuthenticateModel> am = new ArrayList<>();

		try {
			String sql = "{call sp_authanticate(?,?)}";
			smt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			smt.setString(1, UserName);
			smt.setString(2, UserPass);
			rs = smt.executeQuery();
			if (rs.next()) {
				AuthenticateModel aAm = new AuthenticateModel();
				aAm.setAuth_id(rs.getInt("id"));
				aAm.setUname(rs.getString("uname"));
				aAm.setUpass(rs.getString("upass"));
				aAm.setUserType(rs.getString("UserType"));
				aAm.setResgis_id(rs.getInt("regis_id"));
				am.add(aAm);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			ConnectionProvider.rstcloser(rs);
			if (smt != null) {
				smt.close();
				smt = null;
			}
		}

		return am;
	}

}
