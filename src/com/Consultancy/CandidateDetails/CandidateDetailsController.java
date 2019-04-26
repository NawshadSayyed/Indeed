package com.Consultancy.CandidateDetails;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.http.Part;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.Authenticate.AuthenticateModel;
import com.Company.Company;
import com.Company.CompanyImplements;
import com.Company.CompanyModel;
import com.Company.jobPost.JobPostModel;
import com.Company.jobPost.JobPostable;
import com.Company.jobPost.JobPostableImplement;
import com.ConProvider.ConnectionProvider;

import Demopkg.SendEmail;

/**
 * Servlet implementation class CandidateDetailsController
 */
@WebServlet("/CandidateDetailsController")
@MultipartConfig(maxFileSize = 16177215)
public class CandidateDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CandidateDetailsController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CandidateDetailsInf cdi = null;
		PrintWriter out = response.getWriter();
		System.out.println("Hello controller");
		if (request.getParameter("Edit_id") != null) {

			String btn_value = request.getParameter("btn_PostJob").toString().trim();
			if (btn_value.equalsIgnoreCase("Delete"))
			{
				cdi = new CandidateDetailsImpl();
				Boolean result = cdi.delete(Integer.parseInt(request.getParameter("Edit_id").toString().trim()));
				if (result)
				{
					System.out.println("Controller :Candidate Information Delete Successfully..");
					out.println("<script type=\"text/javascript\">");
					out.println(
							"alert('Candidate Information Delete Successfully..');window.location='./Edit_App_Candidate_Deatils.jsp'");
					out.println("</script>");
				} else {
					out.println("<script type=\"text/javascript\">");
					out.println(
							"alert('Candidate Information Delete Unsuccessfull Please Try Again..');window.location='./Edit_App_Candidate_Deatils.jsp'");
					out.println("</script>");

				}

			}

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CandidateDetailsInf cdi = null;
		PrintWriter out = response.getWriter();
		ServletContext  context= getServletContext(); 
		HttpSession hs =  request.getSession();
		try {

			if (request.getParameter("btn_PostJob") != null) {
				String btn_submit = request.getParameter("btn_PostJob").toString().trim();

				if (btn_submit.equalsIgnoreCase("Add Candidate")) {
					cdi = new CandidateDetailsImpl();
					CandidateDetailsModel cdm =setCandidatedetails(request);
					Boolean result = cdi.save(cdm);
					if (result) {
						System.out.println("Controller :Candidate Information Send Successfully..");
						// used for get user id and user type
						AuthenticateModel am=	(AuthenticateModel)hs.getAttribute("AuthenticateModel");
						// used for getting Job details
						JobPostable jp = new JobPostableImplement();
						JobPostModel jpm= jp.viewById(am, cdm.getjob_app_id().toString());
						// used for getting employer details
						Company cmp = new CompanyImplements();
						CompanyModel comp= cmp.viewById(String.valueOf(jpm.getEmployer_id()));
						// used fro current date
						Date dt = new Date();
						// used for sending email 
						String msg= "Date:-"+dt + "\n Candidate Applied for the Post of   \n "+jpm.getTxt_job_Title()+"\n\n Candidate Name :-"+cdm.getCand_first_name()+ " "+cdm.getCand_last_name() +
								" \n Email Id :-"+cdm.getCand_email()+"\n  Candidate Phone :-"+cdm.getCand_phone() +" Having Experiance Year  "+cdm.getCand_exp_year()+" Month "+cdm.getCand_exp_month();
						System.out.println(context.getInitParameter("user")+context.getInitParameter("pass")+ context.getInitParameter("host")+
								context.getInitParameter("port")+ context.getInitParameter("user")+
								comp.getEmail()+ "Account Register Successfully"+ msg);
						SendEmail.sendEmail(context.getInitParameter("user"),context.getInitParameter("pass"), context.getInitParameter("host"),
								context.getInitParameter("port"), context.getInitParameter("user"),
								comp.getEmail(), "Account Register Successfully", msg);
						out.println("<script type=\"text/javascript\">");
						out.println(
								"alert('Information Send Successfully..');window.location='./Edit_App_Candidate_Deatils.jsp'");
						out.println("</script>");
					}
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally 
		{
			try {
				ConnectionProvider.CloseAllGlobConnection();
			} catch (SQLException e) {
			}
		}

	}
	public CandidateDetailsModel setCandidatedetails(HttpServletRequest request) 
	{
		CandidateDetailsModel cdm = null;
		try {
			InputStream inputStream = null;
			Part filePart = request.getPart("file_Resume");
			if (filePart != null) {
				inputStream = filePart.getInputStream();
			}
             HttpSession hs = request.getSession();
             AuthenticateModel am =(AuthenticateModel) hs.getAttribute("AuthenticateModel");
			cdm = new CandidateDetailsModel();
			cdm.setCandidate_id(0);
			cdm.setjob_app_id(Integer.parseInt(request.getParameter("hdn_job_id").toString().trim()));
			cdm.setCand_first_name(request.getParameter("txt_First_Name"));
			cdm.setCand_mid_name(request.getParameter("txt_Middle_Name"));
			cdm.setCand_last_name(request.getParameter("txt_Last_Name"));
			cdm.setCand_email(request.getParameter("txt_Email"));
			cdm.setCand_phone(request.getParameter("txt_Phone"));
			cdm.setCand_exp_year(ConnectionProvider.StringToIntConv(request.getParameter("txt_Experience_Year")));
			cdm.setCand_exp_month(ConnectionProvider.StringToIntConv(request.getParameter("txt_Experience_Month")));
			cdm.setCand_skils(request.getParameter("txt_Skils"));
			cdm.setlocation(request.getParameter("txt_Location"));
			cdm.setApp_date(ConnectionProvider.getCurrentDate());
			cdm.setCand_resume(inputStream);
			if(am.getResgis_id()>0){
			cdm.setConsultancy_id(am.getResgis_id());
			}else{
				cdm.setConsultancy_id(1);
			}
			} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ConnectionProvider.CloseAllGlobConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return cdm;
	}

}
