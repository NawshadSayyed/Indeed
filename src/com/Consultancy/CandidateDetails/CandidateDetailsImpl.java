package com.Consultancy.CandidateDetails;

import java.sql.SQLException;
import java.util.ArrayList;

import com.Authenticate.AuthenticateModel;
import com.ConProvider.ConnectionProvider;
import com.ConProvider.ConnectionProviderSingleTone;

public class CandidateDetailsImpl implements CandidateDetailsInf
{

	@Override
	public boolean save(CandidateDetailsModel cdm) {
		try {
			String sql = "{call sp_insert_candidate_details(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setInt(1, cdm.getjob_app_id());
			ConnectionProvider.csmt.setString(2, cdm.getCand_first_name());
			ConnectionProvider.csmt.setString(3, cdm.getCand_mid_name());
			ConnectionProvider.csmt.setString(4, cdm.getCand_last_name());
			ConnectionProvider.csmt.setString(5, cdm.getCand_email());
			ConnectionProvider.csmt.setString(6, cdm.getCand_phone());
			ConnectionProvider.csmt.setInt(7, cdm.getCand_exp_year());
			ConnectionProvider.csmt.setInt(8, cdm.getCand_exp_month());
			ConnectionProvider.csmt.setString(9, cdm.getCand_skils());
			ConnectionProvider.csmt.setString(10, cdm.getlocation());
			ConnectionProvider.csmt.setBlob(11, cdm.getCand_resume());
			ConnectionProvider.csmt.setString(12, cdm.getApp_date());
			System.out.println(cdm.getConsultancy_id());
			if(cdm.getConsultancy_id() > 1)
			{	ConnectionProvider.csmt.setInt(13, cdm.getConsultancy_id());
			}else
			{
				ConnectionProvider.csmt.setInt(13, 1);
			}

			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) {
				System.out.println("Successfully Inserted");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			try 
			{
				ConnectionProvider.CloseAllGlobConnection();
			}
			catch (SQLException e1) 
			{
				e1.printStackTrace();
			}

		}

		return false;
	}

	@Override
	public boolean update(CandidateDetailsModel cdm, String Id) {

	
		String sql = "{call sp_update_candidate_details(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		try {

			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setInt(1, cdm.getjob_app_id());
			ConnectionProvider.csmt.setString(2, cdm.getCand_first_name());
			ConnectionProvider.csmt.setString(3, cdm.getCand_mid_name());
			ConnectionProvider.csmt.setString(4, cdm.getCand_last_name());
			ConnectionProvider.csmt.setString(5, cdm.getCand_email());
			ConnectionProvider.csmt.setString(6, cdm.getCand_phone());
			ConnectionProvider.csmt.setInt(7, cdm.getCand_exp_year());
			ConnectionProvider.csmt.setInt(8, cdm.getCand_exp_month());
			ConnectionProvider.csmt.setString(9, cdm.getCand_skils());
			ConnectionProvider.csmt.setString(10, cdm.getlocation());
			ConnectionProvider.csmt.setBlob(11, cdm.getCand_resume());
			ConnectionProvider.csmt.setString(12, cdm.getApp_date());
			ConnectionProvider.csmt.setInt(13, cdm.getCandidate_id());
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) {
				System.out.println("Successfully Inserted");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ConnectionProvider.CloseAllGlobConnection();
				System.gc();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return false;
	}

	@Override
	public boolean delete(Integer id) {
		String sql = "{call sp_delerte_candidate_details(?)}";
		try {
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setInt(1, id);
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
		} finally {
			try {
				ConnectionProvider.CloseAllGlobConnection();
				System.gc();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public CandidateDetailsModel viewById(AuthenticateModel am, String Query) throws SQLException {
		CandidateDetailsModel cdm = null;
		try {
			if(am.getUserType().equalsIgnoreCase("Consultant")){
				ConnectionProvider.rs = ConnectionProvider
						.SelectData("select * from candidate_details where candidate_id=" + Query +" and id="+am.getResgis_id());
					
			}else{
			ConnectionProvider.rs = ConnectionProvider
					.SelectData("select * from candidate_details where candidate_id=" + Query);
			}if (ConnectionProvider.rs.next()) {
				cdm = new CandidateDetailsModel();
				cdm.setCandidate_id(ConnectionProvider.rs.getInt("candidate_id"));
				cdm.setjob_app_id(ConnectionProvider.rs.getInt("job_app_id"));
				cdm.setCand_first_name(ConnectionProvider.rs.getString("cand_first_name"));
				cdm.setCand_mid_name(ConnectionProvider.rs.getString("cand_mid_name"));
				cdm.setCand_last_name(ConnectionProvider.rs.getString("cand_last_name"));
				cdm.setCand_email(ConnectionProvider.rs.getString("cand_email"));
				cdm.setCand_phone(ConnectionProvider.rs.getString("cand_phone"));
				cdm.setCand_exp_year(ConnectionProvider.rs.getInt("cand_exp_year"));
				cdm.setCand_exp_month(ConnectionProvider.rs.getInt("cand_exp_month"));
				cdm.setCand_skils(ConnectionProvider.rs.getString("cand_skils"));
				cdm.setlocation(ConnectionProvider.rs.getString("location"));
				cdm.setApp_date(ConnectionProvider.rs.getString("app_date"));
				// cand_resume
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			ConnectionProvider.CloseAllGlobConnection();
		}

		return cdm;
	}

	@Override
	public ArrayList<CandidateDetailsModel> ViewAllJobDetils(AuthenticateModel am) throws SQLException {
		ArrayList<CandidateDetailsModel> al = new ArrayList<>();
		try {
			if(am.getUserType().equalsIgnoreCase("Consultant")){
				ConnectionProvider.rs = ConnectionProvider.SelectData("select * from candidate_details where consultancy_id= "+am.getResgis_id()+" and Candidate_Status =0 " );
			}else{
				ConnectionProvider.rs = ConnectionProvider.SelectData("select * from candidate_details where Candidate_Status =0 ");
			}
			while (ConnectionProvider.rs.next()) {
				CandidateDetailsModel cdm = new CandidateDetailsModel();
				cdm = new CandidateDetailsModel();
				cdm.setCandidate_id(ConnectionProvider.rs.getInt("candidate_id"));
				cdm.setjob_app_id(ConnectionProvider.rs.getInt("job_app_id"));
				cdm.setCand_first_name(ConnectionProvider.rs.getString("cand_first_name"));
				cdm.setCand_mid_name(ConnectionProvider.rs.getString("cand_mid_name"));
				cdm.setCand_last_name(ConnectionProvider.rs.getString("cand_last_name"));
				cdm.setCand_email(ConnectionProvider.rs.getString("cand_email"));
				cdm.setCand_phone(ConnectionProvider.rs.getString("cand_phone"));
				cdm.setCand_exp_year(ConnectionProvider.rs.getInt("cand_exp_year"));
				cdm.setCand_exp_month(ConnectionProvider.rs.getInt("cand_exp_month"));
				cdm.setCand_skils(ConnectionProvider.rs.getString("cand_skils"));
				cdm.setlocation(ConnectionProvider.rs.getString("location"));
				cdm.setApp_date(ConnectionProvider.rs.getString("app_date"));
				al.add(cdm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally 
		{
			ConnectionProvider.CloseAllGlobConnection();
			System.gc();
		}
		return al;

	}

	@Override
	public ArrayList<CandidateDetailsModel> ViewAllJobDetils(AuthenticateModel am,String query) throws SQLException {
		ArrayList<CandidateDetailsModel> al = new ArrayList<>();
		try {
			String qQuery="";
if(am.getUserType().equalsIgnoreCase("Consultant")){
				
				qQuery="SELECT * FROM candidate_details  where consultancy_id = "+am.getResgis_id() +" and Candidate_Status = 0 "+" and ( cand_first_name like '%"+query+"%' or cand_mid_name like '%"+query+"%' or cand_last_name like '%"+query+
						"%' or cand_email like '%"+query+"%' or cand_phone like '%"+query+"%' or candidate_id like '%"+query+"%' or cand_skils like '%"+query+"%' or location like '%"+query+"%') order by app_date desc";
					
					
			}else
			{
				qQuery="SELECT * FROM candidate_details  where Candidate_Status = 0 and ( cand_first_name like '%"+query+"%' or cand_mid_name like '%"+query+"%' or cand_last_name like '%"+query+
						"%' or cand_email like '%"+query+"%' or cand_phone like '%"+query+"%' or candidate_id like '%"+query+"%' or cand_skils like '%"+query+"%' or location like '%"+query+"%') order by app_date desc";
			
			}
			
			
			ConnectionProvider.rs = ConnectionProvider.SelectData(qQuery);
			while (ConnectionProvider.rs.next()) {
				CandidateDetailsModel cdm = new CandidateDetailsModel();
				cdm = new CandidateDetailsModel();
				cdm.setCandidate_id(ConnectionProvider.rs.getInt("candidate_id"));
				cdm.setjob_app_id(ConnectionProvider.rs.getInt("job_app_id"));
				cdm.setCand_first_name(ConnectionProvider.rs.getString("cand_first_name"));
				cdm.setCand_mid_name(ConnectionProvider.rs.getString("cand_mid_name"));
				cdm.setCand_last_name(ConnectionProvider.rs.getString("cand_last_name"));
				cdm.setCand_email(ConnectionProvider.rs.getString("cand_email"));
				cdm.setCand_phone(ConnectionProvider.rs.getString("cand_phone"));
				cdm.setCand_exp_year(ConnectionProvider.rs.getInt("cand_exp_year"));
				cdm.setCand_exp_month(ConnectionProvider.rs.getInt("cand_exp_month"));
				cdm.setCand_skils(ConnectionProvider.rs.getString("cand_skils"));
				cdm.setlocation(ConnectionProvider.rs.getString("location"));
				cdm.setApp_date(ConnectionProvider.rs.getString("app_date"));
				al.add(cdm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionProvider.CloseAllGlobConnection();
			System.gc();
		}
		return al;

	}

	@Override
	public CandidateDetailsModel viewByIdRejectedCandidate(AuthenticateModel am, String Query) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<CandidateDetailsModel> ViewAllJobDetilsRejectedCandidate(AuthenticateModel am)
			throws SQLException {
		ArrayList<CandidateDetailsModel> al = new ArrayList<>();
		try {
			if(am.getUserType().equalsIgnoreCase("Consultant")){
				ConnectionProvider.rs = ConnectionProvider.SelectData("select * from candidate_details where consultancy_id= "+am.getResgis_id()+" and Candidate_Status =1 " );
			}else{
				ConnectionProvider.rs = ConnectionProvider.SelectData("select * from candidate_details where Candidate_Status =1 ");
			}
			while (ConnectionProvider.rs.next()) {
				CandidateDetailsModel cdm = new CandidateDetailsModel();
				cdm = new CandidateDetailsModel();
				cdm.setCandidate_id(ConnectionProvider.rs.getInt("candidate_id"));
				cdm.setjob_app_id(ConnectionProvider.rs.getInt("job_app_id"));
				cdm.setCand_first_name(ConnectionProvider.rs.getString("cand_first_name"));
				cdm.setCand_mid_name(ConnectionProvider.rs.getString("cand_mid_name"));
				cdm.setCand_last_name(ConnectionProvider.rs.getString("cand_last_name"));
				cdm.setCand_email(ConnectionProvider.rs.getString("cand_email"));
				cdm.setCand_phone(ConnectionProvider.rs.getString("cand_phone"));
				cdm.setCand_exp_year(ConnectionProvider.rs.getInt("cand_exp_year"));
				cdm.setCand_exp_month(ConnectionProvider.rs.getInt("cand_exp_month"));
				cdm.setCand_skils(ConnectionProvider.rs.getString("cand_skils"));
				cdm.setlocation(ConnectionProvider.rs.getString("location"));
				cdm.setApp_date(ConnectionProvider.rs.getString("app_date"));
				al.add(cdm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally 
		{
			ConnectionProvider.CloseAllGlobConnection();
			System.gc();
		}
		return al;
	}

	@Override
	public ArrayList<CandidateDetailsModel> ViewAllJobDetilsRejectedCandidate(AuthenticateModel am, String query)
			throws SQLException {
		ArrayList<CandidateDetailsModel> al = new ArrayList<>();
		try {
			String qQuery="";
if(am.getUserType().equalsIgnoreCase("Consultant")){
				
				qQuery="SELECT * FROM candidate_details  where consultancy_id = "+am.getResgis_id() +" and Candidate_Status = 1 "+" and ( cand_first_name like '%"+query+"%' or cand_mid_name like '%"+query+"%' or cand_last_name like '%"+query+
						"%' or cand_email like '%"+query+"%' or cand_phone like '%"+query+"%' or candidate_id like '%"+query+"%' or cand_skils like '%"+query+"%' or location like '%"+query+"%') order by app_date desc";
				
				System.out.println(qQuery);
					
			}else
			{
				qQuery="SELECT * FROM candidate_details  where Candidate_Status = 1 and ( cand_first_name like '%"+query+"%' or cand_mid_name like '%"+query+"%' or cand_last_name like '%"+query+
						"%' or cand_email like '%"+query+"%' or cand_phone like '%"+query+"%' or candidate_id like '%"+query+"%' or cand_skils like '%"+query+"%' or location like '%"+query+"%') order by app_date desc";
			
			}
			
			
			ConnectionProvider.rs = ConnectionProvider.SelectData(qQuery);
			while (ConnectionProvider.rs.next()) {
				CandidateDetailsModel cdm = new CandidateDetailsModel();
				cdm = new CandidateDetailsModel();
				cdm.setCandidate_id(ConnectionProvider.rs.getInt("candidate_id"));
				cdm.setjob_app_id(ConnectionProvider.rs.getInt("job_app_id"));
				cdm.setCand_first_name(ConnectionProvider.rs.getString("cand_first_name"));
				cdm.setCand_mid_name(ConnectionProvider.rs.getString("cand_mid_name"));
				cdm.setCand_last_name(ConnectionProvider.rs.getString("cand_last_name"));
				cdm.setCand_email(ConnectionProvider.rs.getString("cand_email"));
				cdm.setCand_phone(ConnectionProvider.rs.getString("cand_phone"));
				cdm.setCand_exp_year(ConnectionProvider.rs.getInt("cand_exp_year"));
				cdm.setCand_exp_month(ConnectionProvider.rs.getInt("cand_exp_month"));
				cdm.setCand_skils(ConnectionProvider.rs.getString("cand_skils"));
				cdm.setlocation(ConnectionProvider.rs.getString("location"));
				cdm.setApp_date(ConnectionProvider.rs.getString("app_date"));
				al.add(cdm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionProvider.CloseAllGlobConnection();
			System.gc();
		}
		return al;

	}

}
