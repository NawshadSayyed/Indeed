package com.Company.jobPost;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import com.Authenticate.AuthenticateModel;
import com.ConProvider.ConnectionProvider;
import com.ConProvider.ConnectionProviderSingleTone;

public class JobPostableImplement implements JobPostable, AutoCloseable {
	@Override
	public boolean save(JobPostModel jpm) {

		try {
			/*
			 * String qQuery="insert into
			 * companydetails(job_title,Company_Name,Job_location,job_type,
			 * sal_from, sal_to,sal_type, job_summary, job_requirment,
			 * job_exp_skill_qulif, min_qulification, exp_type, exp_year,
			 * post_status, job_post_date, job_posted_by,
			 * job_no_vacancies,employer_id)"
			 * +"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			 */

			String qQuery = "{call sp_compny_insert_jobPost(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(qQuery);
			ConnectionProvider.csmt.setString(1, jpm.getTxt_job_Title());
			ConnectionProvider.csmt.setString(2, jpm.getTxt_Company_Name());
			ConnectionProvider.csmt.setString(3, jpm.getTxt_job_location());
			ConnectionProvider.csmt.setString(4, jpm.getDdl_Job_Type());
			ConnectionProvider.csmt.setDouble(5, jpm.getTxt_Sal_From());
			ConnectionProvider.csmt.setDouble(6, jpm.getTxt_Sal_To());
			ConnectionProvider.csmt.setString(7, jpm.getDdl_Salary_Type());
			ConnectionProvider.csmt.setString(8, jpm.getTxt_JobSummary());
			ConnectionProvider.csmt.setString(9, jpm.getTxt_Job_Responsibility());
			ConnectionProvider.csmt.setString(10, jpm.getTxt_Exp_qulif_skills());
			ConnectionProvider.csmt.setString(11, jpm.getDdl_Min_Qualification());
			ConnectionProvider.csmt.setString(12, jpm.getDdl_Exp_Type());
			ConnectionProvider.csmt.setDouble(13, jpm.getTxt_Total_Exp());
			ConnectionProvider.csmt.setString(14, jpm.getDdl_Post_Status());
			ConnectionProvider.csmt.setString(15, jpm.getTxt_job_post_date());
			ConnectionProvider.csmt.setString(16, jpm.getTxt_txt_post_by());
			ConnectionProvider.csmt.setDouble(17, jpm.getTxt_txt_No_vacancies());
			ConnectionProvider.csmt.setString(18, jpm.getDdl_job_category());
			ConnectionProvider.csmt.setInt(19, jpm.getEmployer_id()); //// session Id for employer id
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) {
				System.out.println("Successfully Inserted..");
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				ConnectionProvider.rstcloser(ConnectionProvider.rs);
				ConnectionProvider.callablesmt(ConnectionProvider.csmt);
				ConnectionProvider.smtcloser(ConnectionProvider.ps);
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public boolean update(JobPostModel jpm, String Id) {
		try {
			String qQuery = "{call sp_compny_update_jobPost(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";

			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(qQuery);
			ConnectionProvider.csmt.setString(1, jpm.getTxt_job_Title());
			ConnectionProvider.csmt.setString(2, jpm.getTxt_Company_Name());
			ConnectionProvider.csmt.setString(3, jpm.getTxt_job_location());
			ConnectionProvider.csmt.setString(4, jpm.getDdl_Job_Type());
			ConnectionProvider.csmt.setDouble(5, jpm.getTxt_Sal_From());
			ConnectionProvider.csmt.setDouble(6, jpm.getTxt_Sal_To());
			ConnectionProvider.csmt.setString(7, jpm.getDdl_Salary_Type());
			ConnectionProvider.csmt.setString(8, jpm.getTxt_JobSummary());
			ConnectionProvider.csmt.setString(9, jpm.getTxt_Job_Responsibility());
			ConnectionProvider.csmt.setString(10, jpm.getTxt_Exp_qulif_skills());
			ConnectionProvider.csmt.setString(11, jpm.getDdl_Min_Qualification());
			ConnectionProvider.csmt.setString(12, jpm.getDdl_Exp_Type());
			ConnectionProvider.csmt.setDouble(13, jpm.getTxt_Total_Exp());
			ConnectionProvider.csmt.setString(14, jpm.getDdl_Post_Status());
			ConnectionProvider.csmt.setString(15, jpm.getTxt_job_post_date());
			ConnectionProvider.csmt.setString(16, jpm.getTxt_txt_post_by());
			ConnectionProvider.csmt.setDouble(17, jpm.getTxt_txt_No_vacancies());
			ConnectionProvider.csmt.setString(18, jpm.getDdl_job_category());
			ConnectionProvider.csmt.setInt(19, Integer.parseInt(Id));
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) {
				System.out.println("Implementation Class Msg : Successfully Updated..");
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				ConnectionProvider.rstcloser(ConnectionProvider.rs);
				ConnectionProvider.callablesmt(ConnectionProvider.csmt);
				ConnectionProvider.smtcloser(ConnectionProvider.ps);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		try {
			String qQuery = "{call sp_compny_delete_jobPost(?)}";

			ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(qQuery);
			ConnectionProvider.csmt.setInt(1, id);
			int a = ConnectionProvider.csmt.executeUpdate();
			if (a > 0) {
				System.out.println("Delete Implementation Class MSG :Delete Successfully");
				return true;
			} else {
				System.out.println("Delete Implementation Class Error Try Again..");
			}

		} catch (Exception x) {
			x.printStackTrace();
		} finally {
			try {
				ConnectionProvider.rstcloser(ConnectionProvider.rs);
				ConnectionProvider.callablesmt(ConnectionProvider.csmt);
				ConnectionProvider.smtcloser(ConnectionProvider.ps);
			} catch (SQLException e) {
				System.gc();
			}
		}
		return false;
	}

	public JobPostModel viewById(AuthenticateModel am, String id) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		JobPostModel jpm = new JobPostModel();
		try {
			ConnectionProvider.con = null;
			if (am.getUserType().equalsIgnoreCase("Admin")) {
				ps = ConnectionProviderSingleTone.getInstance()
						.prepareStatement("select * from employer_jobpost where id = " + id);

			} else if (am.getUserType().equalsIgnoreCase("Consultant")) {
				ps = ConnectionProviderSingleTone.getInstance()
						.prepareStatement("select * from employer_jobpost where id = " + id);
			} else if (am.getUserType().equalsIgnoreCase("Employer")) {
				ps = ConnectionProviderSingleTone.getInstance().prepareStatement(
						"select * from employer_jobpost where id = " + id + " and employer_id =" + am.getResgis_id());
			}
			rs = ps.executeQuery();
			/*
			 * ConnectionProvider.rs = ConnectionProvider.SelectData();
			 */
			if (rs.next()) {
				jpm.setTxt_job_Title(rs.getString("job_title").toString().trim());
				jpm.setTxt_Company_Name(rs.getString("Company_Name").toString().trim());
				jpm.setTxt_job_location(rs.getString("Job_location").toString().trim());
				jpm.setDdl_Job_Type(rs.getString("job_type").toString().trim());
				jpm.setTxt_Sal_From(rs.getDouble("sal_from"));
				jpm.setTxt_Sal_To(rs.getDouble("sal_to"));
				jpm.setDdl_Salary_Type(rs.getString("sal_type").toString().trim());
				jpm.setTxt_JobSummary(rs.getString("job_summary").toString().trim());
				jpm.setTxt_Job_Responsibility(rs.getString("job_requirment").toString().trim());
				jpm.setTxt_Exp_qulif_skills(rs.getString("job_exp_skill_qulif").toString().trim());
				jpm.setDdl_Min_Qualification(rs.getString("min_qulification").toString().trim());
				jpm.setDdl_Exp_Type(rs.getString("exp_type").toString().trim());
				jpm.setTxt_Total_Exp(rs.getInt("exp_year"));
				jpm.setDdl_Post_Status(rs.getString("post_status").toString().trim());
				jpm.setTxt_job_post_date(rs.getString("job_post_date").toString().trim());
				jpm.setTxt_txt_post_by(rs.getString("job_posted_by").toString().trim());
				jpm.setTxt_txt_No_vacancies(rs.getInt("job_no_vacancies"));
				jpm.setDdl_job_category(rs.getString("job_category"));
				jpm.setTxt_job_id(Integer.parseInt(rs.getString("id")));
				jpm.setEmployer_id(Integer.parseInt(rs.getString("employer_id")));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("exeption in view by id method arrised");
		} finally {
			ConnectionProvider.smtcloser(ps);
			ConnectionProvider.rstcloser(rs);
			System.gc();
		}

		return jpm;
	}

	@Override
	public ArrayList<JobPostModel> ViewAllJobDetils(AuthenticateModel am) throws SQLException {
		ArrayList<JobPostModel> al = new ArrayList<>();
		try {
			ConnectionProvider.CloseAllGlobConnection();

			if (am.getUserType().equalsIgnoreCase("Admin")) {
				ConnectionProvider.rs = ConnectionProvider.SelectData("SELECT * FROM employer_jobpost");

			} else if (am.getUserType().equalsIgnoreCase("Consultant")) {
				ConnectionProvider.rs = ConnectionProvider.SelectData("SELECT * FROM employer_jobpost");
			} else if (am.getUserType().equalsIgnoreCase("Employer")) {
				ConnectionProvider.rs = ConnectionProvider
						.SelectData("SELECT * FROM employer_jobpost where employer_id =" + am.getResgis_id());
			}

			while (ConnectionProvider.rs.next()) {
				JobPostModel jpm = new JobPostModel();
				jpm.setTxt_job_Title(ConnectionProvider.rs.getString("job_title").toString().trim());
				jpm.setTxt_Company_Name(ConnectionProvider.rs.getString("Company_Name").toString().trim());
				jpm.setTxt_job_location(ConnectionProvider.rs.getString("Job_location").toString().trim());
				jpm.setDdl_Job_Type(ConnectionProvider.rs.getString("job_type").toString().trim());
				jpm.setTxt_Sal_From(ConnectionProvider.rs.getDouble("sal_from"));
				jpm.setTxt_Sal_To(ConnectionProvider.rs.getDouble("sal_to"));
				jpm.setDdl_Salary_Type(ConnectionProvider.rs.getString("sal_type").toString().trim());
				jpm.setTxt_JobSummary(ConnectionProvider.rs.getString("job_summary").toString().trim());
				jpm.setTxt_Job_Responsibility(ConnectionProvider.rs.getString("job_requirment").toString().trim());
				jpm.setTxt_Exp_qulif_skills(ConnectionProvider.rs.getString("job_exp_skill_qulif").toString().trim());
				jpm.setDdl_Min_Qualification(ConnectionProvider.rs.getString("min_qulification").toString().trim());
				jpm.setDdl_Exp_Type(ConnectionProvider.rs.getString("exp_type").toString().trim());
				jpm.setTxt_Total_Exp(ConnectionProvider.rs.getInt("exp_year"));
				jpm.setDdl_Post_Status(ConnectionProvider.rs.getString("post_status").toString().trim());
				jpm.setTxt_job_post_date(ConnectionProvider.rs.getString("job_post_date").toString().trim());
				jpm.setTxt_txt_post_by(ConnectionProvider.rs.getString("job_posted_by").toString().trim());
				jpm.setTxt_txt_No_vacancies(ConnectionProvider.rs.getInt("job_no_vacancies"));
				jpm.setDdl_job_category(ConnectionProvider.rs.getString("job_category"));
				jpm.setTxt_job_id(ConnectionProvider.rs.getInt("id"));
				al.add(jpm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionProvider.rstcloser(ConnectionProvider.rs);
			ConnectionProvider.callablesmt(ConnectionProvider.csmt);
			ConnectionProvider.smtcloser(ConnectionProvider.ps);
		}
		return al;
	}

	@Override
	public void close() throws Exception {
		ConnectionProvider.rstcloser(ConnectionProvider.rs);
		ConnectionProvider.callablesmt(ConnectionProvider.csmt);
		ConnectionProvider.smtcloser(ConnectionProvider.ps);
	}

	@Override
	public ArrayList<JobPostModel> ViewAllJobDetils(AuthenticateModel am, String query) throws SQLException {

		ArrayList<JobPostModel> al = new ArrayList<>();
		try {

			if (am.getUserType().equalsIgnoreCase("Admin")) {
				ConnectionProvider.rs = ConnectionProvider.SelectData(
						"SELECT * FROM employer_jobpost  where job_title like '%" + query + "%' or Company_Name like '%"
								+ query + "%' or Job_location like '%" + query + "%' or job_type like '%" + query
								+ "%' or id like '%" + query + "%' or post_status like '%" + query
								+ "%'  or job_category like '%" + query + "%' order by Job_post_date desc ");

			} else if (am.getUserType().equalsIgnoreCase("Consultant")) {
				ConnectionProvider.rs = ConnectionProvider.SelectData(
						"SELECT * FROM employer_jobpost  where job_title like '%" + query + "%' or Company_Name like '%"
								+ query + "%' or Job_location like '%" + query + "%' or job_type like '%" + query
								+ "%' or id like '%" + query + "%' or post_status like '%" + query
								+ "%'  or job_category like '%" + query + "%' order by Job_post_date desc ");
			} else if (am.getUserType().equalsIgnoreCase("Employer")) {
				ConnectionProvider.rs = ConnectionProvider
						.SelectData("SELECT * FROM employer_jobpost  where employer_id =" + am.getResgis_id()
								+ " and ( job_title like '%" + query + "%' or Company_Name like '%" + query
								+ "%' or Job_location like '%" + query + "%' or job_type like '%" + query
								+ "%' or id like '%" + query + "%' or post_status like '%" + query
								+ "%'  or job_category like '%" + query + "%') order by Job_post_date desc ");

				System.out.println("SELECT * FROM employer_jobpost  where employer_id =" + am.getResgis_id()
						+ " and ( job_title like '%" + query + "%' or Company_Name like '%" + query
						+ "%' or Job_location like '%" + query + "%' or job_type like '%" + query + "%' or id like '%"
						+ query + "%' or post_status like '%" + query + "%'  or job_category like '%" + query
						+ "%') order by Job_post_date desc ");

				/*
				 * ConnectionProvider.rs = ConnectionProvider.
				 * SelectData("SELECT * FROM employer_jobpost where employer_id ="
				 * +am.getResgis_id());
				 */
			}

			while (ConnectionProvider.rs.next()) 
			{
				JobPostModel jpm = new JobPostModel();
				jpm.setTxt_job_Title(ConnectionProvider.rs.getString("job_title").toString().trim());
				jpm.setTxt_Company_Name(ConnectionProvider.rs.getString("Company_Name").toString().trim());
				jpm.setTxt_job_location(ConnectionProvider.rs.getString("Job_location").toString().trim());
				jpm.setDdl_Job_Type(ConnectionProvider.rs.getString("job_type").toString().trim());
				jpm.setTxt_Sal_From(ConnectionProvider.rs.getDouble("sal_from"));
				jpm.setTxt_Sal_To(ConnectionProvider.rs.getDouble("sal_to"));
				jpm.setDdl_Salary_Type(ConnectionProvider.rs.getString("sal_type").toString().trim());
				jpm.setTxt_JobSummary(ConnectionProvider.rs.getString("job_summary").toString().trim());
				jpm.setTxt_Job_Responsibility(ConnectionProvider.rs.getString("job_requirment").toString().trim());
				jpm.setTxt_Exp_qulif_skills(ConnectionProvider.rs.getString("job_exp_skill_qulif").toString().trim());
				jpm.setDdl_Min_Qualification(ConnectionProvider.rs.getString("min_qulification").toString().trim());
				jpm.setDdl_Exp_Type(ConnectionProvider.rs.getString("exp_type").toString().trim());
				jpm.setTxt_Total_Exp(ConnectionProvider.rs.getInt("exp_year"));
				jpm.setDdl_Post_Status(ConnectionProvider.rs.getString("post_status").toString().trim());
				jpm.setTxt_job_post_date(ConnectionProvider.rs.getString("job_post_date").toString().trim());
				jpm.setTxt_txt_post_by(ConnectionProvider.rs.getString("job_posted_by").toString().trim());
				jpm.setTxt_txt_No_vacancies(ConnectionProvider.rs.getInt("job_no_vacancies"));
				jpm.setDdl_job_category(ConnectionProvider.rs.getString("job_category"));
				jpm.setTxt_job_id(ConnectionProvider.rs.getInt("id"));
				al.add(jpm);
		}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionProvider.rstcloser(ConnectionProvider.rs);
			ConnectionProvider.callablesmt(ConnectionProvider.csmt);
			ConnectionProvider.smtcloser(ConnectionProvider.ps);
		}
		return al;

	}

}
