package com.Interview.Schedulespkg.feedback;

import java.util.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import com.ConProvider.ConnectionProvider;
import com.ConProvider.ConnectionProviderSingleTone;
import com.Interview.Schedulespkg.SchedulesInterModel;

public class FeedbackInfImpl implements FeedbackInf{

	@Override
	public Boolean save(FeedbackModel fm) throws SQLException {
		try {
			Date dt1 = new Date();
			java.sql.Date dt = new java.sql.Date(dt1.getTime());
			//Consultant_id1 , Candidate_id1 , schedules_id1 , technical_knowledge1 , practical_knowlede1 , communication_skill1 ,
			//body_language1 , Remark1 , feedback_date1 
			String sql = "{call sp_insert_feedback(?,?,?,?,?,?,?,?,?)}";

			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setInt(1, fm.getConsultant_id());//Consultant_id1
			ConnectionProvider.csmt.setInt(2, fm.getConsultant_id());//Candidate_id1
			ConnectionProvider.csmt.setInt(3, fm.getSchedules_id());//schedules_id1
			ConnectionProvider.csmt.setString(4, fm.getTechnical_knowledge());//technical_knowledge1
			ConnectionProvider.csmt.setString(5, fm.getPractical_knowlede());//practical_knowlede1
			ConnectionProvider.csmt.setString(6, fm.getCommunication_skill());//communication_skill1 
			ConnectionProvider.csmt.setString(7, fm.getBody_language());//body_language1
			ConnectionProvider.csmt.setString(8, fm.getRemark());//Remark1
			ConnectionProvider.csmt.setDate(9, dt);//feedback_date1
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) 
			{
				System.out.println("MSG IMPL: Successfully Inserted");
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
	public Boolean Updatae(FeedbackModel fm) throws SQLException {
		try {
			Date dt1 = new Date();
			java.sql.Date dt = new java.sql.Date(dt1.getTime());
			//Consultant_id1 , Candidate_id1 , schedules_id1 , technical_knowledge1 , practical_knowlede1 , communication_skill1 ,
			//body_language1 , Remark1 , feedback_date1 
			String sql = "{call sp_update_feedback(?,?,?,?,?,?,?,?,?,?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setInt(1, fm.getConsultant_id());//Consultant_id1
			ConnectionProvider.csmt.setInt(2, fm.getConsultant_id());//Candidate_id1
			ConnectionProvider.csmt.setInt(3, fm.getSchedules_id());//schedules_id1
			ConnectionProvider.csmt.setString(4, fm.getTechnical_knowledge());//technical_knowledge1
			ConnectionProvider.csmt.setString(5, fm.getPractical_knowlede());//practical_knowlede1
			ConnectionProvider.csmt.setString(6, fm.getCommunication_skill());//communication_skill1 
			ConnectionProvider.csmt.setString(7, fm.getBody_language());//body_language1
			ConnectionProvider.csmt.setString(8, fm.getRemark());//Remark1
			ConnectionProvider.csmt.setDate(9, dt);//feedback_date1
			ConnectionProvider.csmt.setInt(10, fm.getFeed_id());//feedback_date1
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) 
			{
				System.out.println("MSG IMPL:Update Successfully");
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
	public Boolean Delete(FeedbackModel fm) throws SQLException {
		try {
			
			String sql = "{call sp_delete_feedback(?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
			ConnectionProvider.csmt.setInt(1, fm.getFeed_id());//id
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) 
			{
				System.out.println("MSG IMPL: Delete Successfully");
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
	public SchedulesInterModel viewById(Integer id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<FeedbackModel> ViewAll() throws SQLException {
		
		return null;
	}

	@Override
	public ArrayList<FeedbackModel> ViewAllQuery(String query) throws SQLException {
		return null;
	}


	@Override
	public StringBuilder ViewAllResult() throws SQLException {
		return null;
	}

	@Override
	public StringBuilder ViewAllQuery(String Columns_name, String Columns_value) throws SQLException {
		String Temp_Column_name ="";
		System.out.println("Column_name"+Columns_name+","+"Column_Value"+Columns_value);
		switch (Columns_name) {
		case "Name":
			Temp_Column_name ="Candidate_Name";
			break;
		case "Email":
			Temp_Column_name ="cand_email";
			break;
		case "Candidate Phone":
			Temp_Column_name ="cand_phone";
			break;
		
		case "Interview Name":
			Temp_Column_name ="Interview_Name";
			break;
		
		default:
			System.out.println("Please Try Again Columns Value Not Match...");
			break;
		}
		
		StringBuilder sb = new StringBuilder();
		ArrayList<SchedulesInterModel>  SIM = new  ArrayList<SchedulesInterModel>();
		SchedulesInterModel sSim = new SchedulesInterModel();
		try {
			String qquery="select * from interviewresult where "+Temp_Column_name+" like '%"+Columns_value+"%'" ;
			ConnectionProvider.rs = ConnectionProvider.SelectData( qquery );
			int a =1;
			while (ConnectionProvider.rs.next()) {
				sb.append("<tr>"
						+ "<td>"+a+"</td>"+
			             "<td>"+ConnectionProvider.rs.getString("Candidate_Name") +"</td>"
						+"<td>"+ConnectionProvider.rs.getString("cand_email") +"</td>"+
			             "<td>"+ConnectionProvider.rs.getString("cand_phone") +"</td>"+
						"<td>"+ConnectionProvider.rs.getString("Interview_Name") +"</td>"+
			            "<td>"+ConnectionProvider.rs.getString("technical_knowledge") +"</td>"+
						"<td>"+ConnectionProvider.rs.getString("practical_knowlede") +"</td>"+
			            "<td>"+ConnectionProvider.rs.getString("communication_skill") +"</td>"+
						"<td>"+ConnectionProvider.rs.getString("body_language") +"</td>"
						+"<td>"+ConnectionProvider.rs.getString("Remark") +"</td>"
						+"</tr>");
				
				a += ++a;
			}
//technical_knowledge, practical_knowlede, communication_skill, body_language,
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			ConnectionProvider.CloseAllGlobConnection();
			System.gc();
		}

		return sb;
	}

}
