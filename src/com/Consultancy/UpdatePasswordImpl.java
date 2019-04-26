package com.Consultancy;

import java.sql.SQLException;

import com.Authenticate.AuthenticateModel;
import com.ConProvider.ConnectionProvider;
import com.ConProvider.ConnectionProviderSingleTone;

public class UpdatePasswordImpl {
	public static boolean check(String new_password, AuthenticateModel am) {

		try {

			if (am.getUserType().equalsIgnoreCase("Consultant")) {
				ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance()
						.prepareCall("{call sp_updateConsultancy_password(?,?,?)}");
			} else if (am.getUserType().equalsIgnoreCase("Employer")) {
				ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance()
						.prepareCall("{call sp_update_employer_password(?,?,?)}");
			}
			ConnectionProvider.csmt.setInt(1, am.getAuth_id());
			ConnectionProvider.csmt.setInt(2, am.getResgis_id());
			ConnectionProvider.csmt.setString(3, new_password);
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) {
				System.out.println("Successfully Updated");
				return true;
			} else {
				System.out.println("Try Again.....");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				ConnectionProvider.CloseAllGlobConnection();
			} catch (SQLException e) {
			}
		}

	}

}
