package com.Company.jobPost;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Authenticate.AuthenticateModel;
import com.ConProvider.ConnectionProvider;
import com.ConProvider.ConnectionProviderSingleTone;

/**
 * Servlet implementation class JobPostController
 */
@WebServlet("/JobPostController")
public class JobPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JobPostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String btn = request.getParameter("btn_PostJob").toString().trim();
		PrintWriter out = response.getWriter();
		HttpSession hs = request.getSession();
		try {
			JobPostable jobPostable = null;
			if (btn.equalsIgnoreCase("Edit")) {
				jobPostable = new JobPostableImplement();
				String Edit_id = null;
				if (request.getParameter("Edit_id") != null) {
					Edit_id = request.getParameter("Edit_id").toString().trim();
					hs.setAttribute("Edit_id", Edit_id);
					response.sendRedirect("./PostJob.jsp?Edit_id=" + Edit_id);
				}

			} else if (btn.equalsIgnoreCase("Delete")) {

				jobPostable = new JobPostableImplement();
				String Edit_id = request.getParameter("Edit_id");
				Boolean result = jobPostable.delete(Integer.parseInt(Edit_id));
				if (result) {
					System.out.println("Delete Successfully..");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Delete Successfully..');window.location='./ViewPostJob.jsp'");
					out.println("</script>");

				}
			} else if (btn.equalsIgnoreCase("Apply")) {

				if (request.getParameter("Edit_id") != null) {
					String Edit_id = request.getParameter("Edit_id");
					response.sendRedirect("./AddCandidateDetails.jsp?Apply_iob_id=" + Edit_id);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession hs = request.getSession();
		PrintWriter out = response.getWriter();
		JobPostable jobPostable = null;

		try {
			String btn = request.getParameter("btn_PostJob").toString().trim();
			if (btn.equalsIgnoreCase("Post")) {
				jobPostable = new JobPostableImplement();
				JobPostModel jpm = setAttributes(request);
				Boolean b = jobPostable.save(jpm);
				if (b) {
					System.out.println("successfully inserted...");
				
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Job Post Successfully..');window.location='./ViewPostJob.jsp'");
					out.println("</script>");
				}
			} else if (btn.equalsIgnoreCase("Update")) {
				String id = hs.getAttribute("Edit_id").toString().trim();
				jobPostable = new JobPostableImplement();
				JobPostModel jpm = setAttributes(request);
				Boolean b = jobPostable.update(jpm, id);
				if (b) {
					System.out.println("successfully Updated.");
				
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Job Post Updated Successfully..');window.location='./ViewPostJob.jsp'");
					out.println("</script>");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (jobPostable != null) {
				jobPostable = null;
			}
		}

	}

	private JobPostModel setAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession();
		AuthenticateModel am = (AuthenticateModel) session.getAttribute("AuthenticateModel");
		JobPostModel jpm = new JobPostModel();
		jpm.setTxt_job_Title(request.getParameter("txt_job_Title").toString().trim());
		jpm.setTxt_Company_Name(request.getParameter("txt_Company_Name").toString().trim());
		jpm.setTxt_job_location(request.getParameter("txt_job_location").toString().trim());
		jpm.setDdl_Job_Type(request.getParameter("ddl_Job_Type").toString().trim());
		jpm.setTxt_Sal_From(Double.parseDouble(request.getParameter("txt_Sal_From").trim()));
		jpm.setTxt_Sal_To(Double.parseDouble(request.getParameter("txt_Sal_To").trim()));
		jpm.setDdl_Salary_Type(request.getParameter("ddl_Salary_Type").toString().trim());
		jpm.setTxt_JobSummary(request.getParameter("txt_JobSummary").toString().trim());
		jpm.setTxt_Job_Responsibility(request.getParameter("txt_Job_Responsibility").toString().trim());
		jpm.setTxt_Exp_qulif_skills(request.getParameter("txt_Exp_qulif_skills").toString().trim());
		jpm.setDdl_Min_Qualification(request.getParameter("ddl_Min_Qualification").toString().trim());
		jpm.setDdl_Exp_Type(request.getParameter("ddl_Exp_Type").toString().trim());
		jpm.setTxt_Total_Exp(Integer.parseInt(request.getParameter("txt_Total_Exp").trim()));
		jpm.setDdl_Post_Status(request.getParameter("ddl_Post_Status").toString().trim());
		jpm.setTxt_job_post_date(request.getParameter("txt_job_post_date").toString().trim());
		jpm.setTxt_txt_post_by(request.getParameter("txt_txt_post_by").toString().trim());
		jpm.setTxt_txt_No_vacancies(Integer.parseInt(request.getParameter("txt_txt_No_vacancies").trim()));
		jpm.setDdl_job_category(request.getParameter("ddl_Job_category").toString().trim());
		if (am.getResgis_id() > 0) {
			jpm.setEmployer_id(am.getResgis_id());
		}
		return jpm;
	}

}
