package com.Interview.Schedulespkg;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ConProvider.ConnectionProvider;
import com.ConProvider.ConnectionProviderSingleTone;


public class SchedulesImplements implements SchedulesInterviewInf {

	@Override
	public Boolean save(SchedulesInterModel SIM) throws SQLException {
		try {
			java.sql.Date dt = new Date(SIM.getInterview_Date().getTime());
			String sql = "{call sp_sch_int_insert_candidate(?,?,?,?,?,?,?,?,?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setInt(1, SIM.getJob_id());//Job_id1
			ConnectionProvider.csmt.setInt(2, SIM.getCandidate_Id());//Candidate_Id1
			ConnectionProvider.csmt.setString(3, SIM.getCandidate_Name());//Candidate_Name1
			ConnectionProvider.csmt.setDate(4, dt);//Interview_Date1
			ConnectionProvider.csmt.setTime(5, SIM.getInterview_start_time());//Interview_start_time1 
			ConnectionProvider.csmt.setTime(6, SIM.getInterview_end_time());//Interview_end_time1
			ConnectionProvider.csmt.setString(7, SIM.getContact_person_name());//Contact_person_name1
			ConnectionProvider.csmt.setString(8, SIM.getContact_person_number());//Contact_person_number1
			ConnectionProvider.csmt.setString(9, SIM.getVanue_Details());//Vanue_Details1
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) 
			{
				System.out.println("Successfully Inserted");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
		ConnectionProvider.CloseAllGlobConnection();System.gc();
		}

		return false;
	}

	@Override
	public Boolean Updatae(SchedulesInterModel SIM) throws SQLException {
		try {
			java.sql.Date dt = new Date(SIM.getInterview_Date().getTime());
			String sql = "{call sp_sch_int_update_candidate(?,?,?,?,?,?,?,?,?,?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setInt(1, SIM.getJob_id());//Job_id1
			ConnectionProvider.csmt.setInt(2, SIM.getCandidate_Id());//Candidate_Id1
			ConnectionProvider.csmt.setString(3, SIM.getCandidate_Name());//Candidate_Name1
			ConnectionProvider.csmt.setDate(4,dt);//Interview_Date1
			ConnectionProvider.csmt.setTime(5, SIM.getInterview_start_time());//Interview_start_time1 
			ConnectionProvider.csmt.setTime(6, SIM.getInterview_end_time());//Interview_end_time1
			ConnectionProvider.csmt.setString(7, SIM.getContact_person_name());//Contact_person_name1
			ConnectionProvider.csmt.setString(8, SIM.getContact_person_number());//Contact_person_number1
			ConnectionProvider.csmt.setString(9, SIM.getVanue_Details());//Vanue_Details1
			ConnectionProvider.csmt.setInt(10, SIM.getSchedules_Id());//Schedules Id
			System.out.println(ConnectionProvider.csmt);
			int a = ConnectionProvider.csmt.executeUpdate();
			
			if (a > 0) 
			{
				System.out.println("Updated Successfully");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally
		{
		ConnectionProvider.CloseAllGlobConnection();System.gc();
		}
		return false;
	}

	@Override
	public Boolean Delete(SchedulesInterModel SIM) throws SQLException {
		try {
			String sql = "{call sp_sch_delete_candidate(?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setInt(1, SIM.getSchedules_Id());//Schedules Id
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) 
			{	System.out.println("Delete Successfully");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally
		{
		ConnectionProvider.CloseAllGlobConnection();
		System.gc();
		}
		return false;
	}

	@Override
	public SchedulesInterModel viewById(Integer Query) throws SQLException {
		SchedulesInterModel sSim = new SchedulesInterModel();
		try {
			ConnectionProvider.rs = ConnectionProvider.SelectData("select * from SchedulesInterviewDetails where Schedules_id=" + Query);
			if (ConnectionProvider.rs.next()){
				sSim = new SchedulesInterModel();
				sSim.setJob_id(ConnectionProvider.rs.getInt("Job_id"));
				sSim.setCandidate_Id(ConnectionProvider.rs.getInt("Candidate_Id"));
				sSim.setCandidate_Name(ConnectionProvider.rs.getString("Candidate_Name")); 
				sSim.setInterview_Date(ConnectionProvider.rs.getDate("Interview_Date"));
				sSim.setInterview_start_time(ConnectionProvider.rs.getString("Interview_start_time"));
				sSim.setInterview_end_time(ConnectionProvider.rs.getString("Interview_end_time"));
				sSim.setContact_person_name(ConnectionProvider.rs.getString("Contact_person_name"));
				sSim.setContact_person_number(ConnectionProvider.rs.getString("Contact_person_number"));
				sSim.setVanue_Details(ConnectionProvider.rs.getString("Vanue_Details"));
				sSim.setSchedules_Id(ConnectionProvider.rs.getInt("Schedules_Id"));
					
			}
			return sSim;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			ConnectionProvider.CloseAllGlobConnection();
			System.gc();
		}
	}

	@Override
	public ArrayList<SchedulesInterModel> ViewAll() throws SQLException {
		ArrayList<SchedulesInterModel>  SIM = new  ArrayList<SchedulesInterModel>();
		SchedulesInterModel sSim = new SchedulesInterModel();
		try {
			ConnectionProvider.rs = ConnectionProvider	.SelectData("select * from SchedulesInterviewDetails" );
			while (ConnectionProvider.rs.next()) {
				sSim = new SchedulesInterModel();
				sSim.setJob_id(ConnectionProvider.rs.getInt("Job_id"));
				sSim.setCandidate_Id(ConnectionProvider.rs.getInt("Candidate_Id"));
				sSim.setCandidate_Name(ConnectionProvider.rs.getString("Candidate_Name")); 
				sSim.setInterview_Date(ConnectionProvider.rs.getDate("Interview_Date"));
				sSim.setInterview_start_time(ConnectionProvider.rs.getString("Interview_start_time"));
				sSim.setInterview_end_time(ConnectionProvider.rs.getString("Interview_end_time"));
				sSim.setContact_person_name(ConnectionProvider.rs.getString("Contact_person_name"));
				sSim.setContact_person_number(ConnectionProvider.rs.getString("Contact_person_number"));
				sSim.setVanue_Details(ConnectionProvider.rs.getString("Vanue_Details"));
				sSim.setSchedules_Id(ConnectionProvider.rs.getInt("Schedules_Id"));
				SIM.add(sSim);
				sSim = null;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionProvider.CloseAllGlobConnection();
			System.gc();
		}

		return SIM;
	}

	@Override
	public ArrayList<SchedulesInterModel> ViewAllQuery(String query) throws SQLException {
		ArrayList<SchedulesInterModel>  SIM = new  ArrayList<SchedulesInterModel>();
		SchedulesInterModel sSim = new SchedulesInterModel();
		try {
			String qquery="select * from SchedulesInterviewDetails where Candidate_Name like '%"+query+"%' or Schedules_Id like '%"+query+"%' or Candidate_Id like '%"+query+"%' or Interview_Date like '%"+query+"%' or Interview_end_time like '%"+query+"%' or Contact_person_name like '%"+query+"%' or Contact_person_number like '%"+query+"%' or Vanue_Details like '%"+query+"%' or Job_id like '%"+query+"%'" ;
			System.out.println(qquery);
			ConnectionProvider.rs = ConnectionProvider	.SelectData( qquery );
			while (ConnectionProvider.rs.next()) {
				sSim = new SchedulesInterModel();
				sSim.setJob_id(ConnectionProvider.rs.getInt("Job_id"));
				sSim.setCandidate_Id(ConnectionProvider.rs.getInt("Candidate_Id"));
				sSim.setCandidate_Name(ConnectionProvider.rs.getString("Candidate_Name")); 
				sSim.setInterview_Date(ConnectionProvider.rs.getDate("Interview_Date"));
				sSim.setInterview_start_time(ConnectionProvider.rs.getString("Interview_start_time"));
				sSim.setInterview_end_time(ConnectionProvider.rs.getString("Interview_end_time"));
				sSim.setContact_person_name(ConnectionProvider.rs.getString("Contact_person_name"));
				sSim.setContact_person_number(ConnectionProvider.rs.getString("Contact_person_number"));
				sSim.setVanue_Details(ConnectionProvider.rs.getString("Vanue_Details"));
				sSim.setSchedules_Id(ConnectionProvider.rs.getInt("Schedules_Id"));
				SIM.add(sSim);
				sSim = null;
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			ConnectionProvider.CloseAllGlobConnection();
			System.gc();
		}

		return SIM;
	}

	
	
	public StringBuilder ViewAllQuery(String Column_name,String column_Value) throws SQLException {
		String Temp_Column_name ="";
		System.out.println("Column_name"+Column_name+","+"Column_Value"+column_Value);
		switch (Column_name) {
		case "First Name":
			Temp_Column_name ="cand_first_name";
			break;
		case "Middle Name":
			Temp_Column_name ="cand_mid_name";
			break;
		case "Last Name":
			Temp_Column_name ="cand_last_name";
			break;
		case "Email":
			Temp_Column_name ="cand_email";
			break;
		case "Candidate Phone":
			Temp_Column_name ="cand_phone";
			break;
		case "Location":
			Temp_Column_name ="location";
			break;
		case "Interview Name":
			Temp_Column_name ="Candidate_Name";
			break;
		case "Company Name":
			Temp_Column_name ="Company_Name";
			break;
		case "By Job Type":
			Temp_Column_name ="job_type";
			break;
		case "Job Categories":
			Temp_Column_name ="job_category";
			break;
		default:
			System.out.println("Please Try Again Columns Value Not Match...");
			break;
		}
		
		StringBuilder sb = new StringBuilder();
		ArrayList<SchedulesInterModel>  SIM = new  ArrayList<SchedulesInterModel>();
		SchedulesInterModel sSim = new SchedulesInterModel();
		try {
			String qquery="select * from view_schedulesinterviewdetails where "+Temp_Column_name+" like   '%"+column_Value+"%'" ;
			System.out.println(qquery);
			ConnectionProvider.rs = ConnectionProvider	.SelectData( qquery );
			int a =1;
			while (ConnectionProvider.rs.next()) {
				sb.append("<form action='./FeedbackForm.jsp' method='post'>	<tr>"
						+ "<td>"+a+"<input type='hidden' name='Edit_id' value='"+ConnectionProvider.rs.getString("Schedules_Id").toString()+"' /><input type='hidden' name='candidate_id' value='"+ConnectionProvider.rs.getString("Candidate_id").toString()+"' /></td>"+
			              "<td>"+ConnectionProvider.rs.getString("cand_first_name") +" "+ ConnectionProvider.rs.getString("cand_mid_name") + " "+ConnectionProvider.rs.getString("cand_last_name") +"   <input type='hidden' name='hdn_CandidateName' value='"+ConnectionProvider.rs.getString("cand_first_name").toString() +" "+ConnectionProvider.rs.getString("cand_mid_name")+" "+ConnectionProvider.rs.getString("cand_last_name")+"' /> </td>"
						 +"<td>"+ConnectionProvider.rs.getString("cand_email") +"</td><td>"+ConnectionProvider.rs.getString("cand_phone") +"</td>"
			              +"<td>"+ConnectionProvider.rs.getString("Contact_person_name") +"</td><td>"+ConnectionProvider.rs.getString("Contact_person_number") +
			              "</td><td>"+ConnectionProvider.rs.getDate("Interview_Date")+"<input type='hidden' name='hdn_Interview_Date' value='"+ConnectionProvider.rs.getString("Interview_Date").toString()+"' /></td><td>"+ConnectionProvider.rs.getString("Interview_start_time")+"-"+ConnectionProvider.rs.getString("Interview_end_time")+
			              "</td><td>"+ConnectionProvider.rs.getString("Candidate_Name")+"</td><td>"+ConnectionProvider.rs.getString("job_category")+"<input type='hidden' name='hdn_job_category' value='"+ConnectionProvider.rs.getString("job_category").toString()+"' /></td>"+
						  "<td>"+ConnectionProvider.rs.getString("job_title")+"<input type='hidden' name='hdn_job_title' value='"+ConnectionProvider.rs.getString("job_title").toString()+"' /></td><td>"+ConnectionProvider.rs.getString("Vanue_Details")+"</td><td>"+ConnectionProvider.rs.getString("Company_Name")+
						  " </td><td class='hidetd'><button type='submit' id='btn_PostJob' name='btn_Submit' class='btn btn-warning btn-sm' value='Submit'"
						  +" alt='Submit Feedback' title='Submit Feedback'><i class='fa fa-commenting-o'></i></button></td></tr></form>");
				
				a += ++a;
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			ConnectionProvider.CloseAllGlobConnection();
			System.gc();
		}

		return sb;
	}

	@Override
	public StringBuilder ViewScheduledInterView() throws SQLException {
		ArrayList<SchedulesInterModel>  SIM = new  ArrayList<SchedulesInterModel>();
		StringBuilder sb = new StringBuilder();
		int a=1;
		try {
			ConnectionProvider.rs = ConnectionProvider	.SelectData("select * from view_schedulesinterviewdetails" );
			while (ConnectionProvider.rs.next()) {
				sb.append("<form action='./FeedbackForm.jsp' method='post'>	<tr>"
						+ "<td>"+a+"<input type='hidden' name='Edit_id' value='"+ConnectionProvider.rs.getString("Schedules_Id").toString()+"' /><input type='hidden' name='candidate_id' value='"+ConnectionProvider.rs.getString("Candidate_id").toString()+"' /></td>"+
			              "<td>"+ConnectionProvider.rs.getString("cand_first_name") +" "+ ConnectionProvider.rs.getString("cand_mid_name") + " "+ConnectionProvider.rs.getString("cand_last_name") +"   <input type='hidden' name='hdn_CandidateName' value='"+ConnectionProvider.rs.getString("cand_first_name").toString() +" "+ConnectionProvider.rs.getString("cand_mid_name")+" "+ConnectionProvider.rs.getString("cand_last_name")+"' /> </td>"
						 +"<td>"+ConnectionProvider.rs.getString("cand_email") +"</td><td>"+ConnectionProvider.rs.getString("cand_phone") +"</td>"
			              +"<td>"+ConnectionProvider.rs.getString("Contact_person_name") +"</td><td>"+ConnectionProvider.rs.getString("Contact_person_number") +
			              "</td><td>"+ConnectionProvider.rs.getDate("Interview_Date")+"<input type='hidden' name='hdn_Interview_Date' value='"+ConnectionProvider.rs.getString("Interview_Date").toString()+"' /></td><td>"+ConnectionProvider.rs.getString("Interview_start_time")+"-"+ConnectionProvider.rs.getString("Interview_end_time")+
			              "</td><td>"+ConnectionProvider.rs.getString("Candidate_Name")+"</td><td>"+ConnectionProvider.rs.getString("job_category")+"<input type='hidden' name='hdn_job_category' value='"+ConnectionProvider.rs.getString("job_category").toString()+"' /></td>"+
						  "<td>"+ConnectionProvider.rs.getString("job_title")+"<input type='hidden' name='hdn_job_title' value='"+ConnectionProvider.rs.getString("job_title").toString()+"' /></td><td>"+ConnectionProvider.rs.getString("Vanue_Details")+"</td><td>"+ConnectionProvider.rs.getString("Company_Name")+
						  " </td><td class='hidetd'><button type='submit' id='btn_PostJob' name='btn_Submit' class='btn btn-warning btn-sm' value='Submit'"
						  +" alt='Submit Feedback' title='Submit Feedback'><i class='fa fa-commenting-o'></i></button></td></tr></form>");
				}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			ConnectionProvider.CloseAllGlobConnection();
			System.gc();
		}

		return sb;
	}

	@Override
	public Boolean UpdataeStatus(int id) throws SQLException {
		try {
			String sql = "{call sp_UpdateCandidateSatus(?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setInt(1, id);//Candidate Id
			System.out.println(ConnectionProvider.csmt);
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) 
			{
				System.out.println("Sche Int IMPL: Candidate Reject Successfully");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally
		{
		ConnectionProvider.CloseAllGlobConnection();System.gc();
		}
		return false;
	
	}

	
	
	
}
