package com.Interview.Schedulespkg.feedback;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ConProvider.ConnectionProvider;
import com.ConProvider.ConnectionProviderSingleTone;
import com.Interview.Schedulespkg.SchedulesImplements;
import com.Interview.Schedulespkg.SchedulesInterModel;
import com.Interview.Schedulespkg.SchedulesInterviewInf;

/**
 * Servlet implementation class FeedbackController
 */
@WebServlet("/FeedbackController")
public class FeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Btn_value = request.getParameter("btn_Submit").toString().trim();
		PrintWriter out = response.getWriter();
		
			if (Btn_value.equalsIgnoreCase("Save"))
			{
				try {
					Date dt1 = new Date();
					java.sql.Date dt = new java.sql.Date(dt1.getTime());
					//Consultant_id1 , Candidate_id1 , schedules_id1 , technical_knowledge1 , practical_knowlede1 , communication_skill1 ,
					//body_language1 , Remark1 , feedback_date1 
					String sql = "{call sp_insert_feedback(?,?,?,?,?,?,?,?,?)}";
					ConnectionProvider.csmt = ConnectionProviderSingleTone.getInstance().prepareCall(sql);
					ConnectionProvider.csmt.setInt(1, Integer.parseInt(request.getParameter("hdn_consultant_id").toString().trim()));//Consultant_id1
					ConnectionProvider.csmt.setInt(2,Integer.parseInt(request.getParameter("hdn_candidate_id").toString().trim()));//Candidate_id1
					ConnectionProvider.csmt.setInt(3, Integer.parseInt(request.getParameter("hdn_schedule_id").toString().trim()));//schedules_id1
					ConnectionProvider.csmt.setString(4, request.getParameter("txt_Tech_Know").toString().trim());//technical_knowledge1
					ConnectionProvider.csmt.setString(5, request.getParameter("txt_Prac_Know").toString().trim());//practical_knowlede1
					ConnectionProvider.csmt.setString(6, request.getParameter("txt_Comm_Skill").toString().trim());//communication_skill1 
					ConnectionProvider.csmt.setString(7, request.getParameter("txt_Body_Lang").toString().trim());//body_language1
					ConnectionProvider.csmt.setString(8, request.getParameter("txt_Comm_Skill").toString().trim());//Remark1
					ConnectionProvider.csmt.setDate(9, dt);//feedback_date1
					int a = ConnectionProvider.csmt.executeUpdate();
  					if (a>0) {
						System.out.println("Successfully Inserted");
						out.println("<script type=\"text/javascript\">");
						out.println(
								"alert('Candidate Interview Scheduled Successfully..');window.location='./FeedbackForm.jsp'");
						out.println("</script>");
					} else {
						out.println("<script type=\"text/javascript\">");
						out.println(
								"alert('Candidate Interview Scheduled Unsuccessfull.Please Try Again.....');window.location='./FeedbackForm.jsp'");
						out.println("</script>");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally
				{
				try {
					ConnectionProvider.CloseAllGlobConnection();System.gc();
				} catch (SQLException e) {
					System.gc();
				}
				}
			}
			
	}
	

	
	public FeedbackModel BindRequest(HttpServletRequest request){
		FeedbackModel sSim = new FeedbackModel();
		try
		{
		sSim.setConsultant_id(Integer.parseInt(request.getParameter("hdn_consultant_id").toString().trim()));
		sSim.setCandidate_id(Integer.parseInt(request.getParameter("hdn_candidate_id").toString().trim()));
		sSim.setFeed_id(Integer.parseInt(request.getParameter("hdn_feedback_id").toString().trim())); // it's
		sSim.setTechnical_knowledge(request.getParameter("txt_Tech_Know").toString().trim());
		sSim.setPractical_knowlede(request.getParameter("txt_Prac_Know").toString().trim());
		sSim.setBody_language(request.getParameter("txt_Body_Lang").toString().trim());
		sSim.setRemark(request.getParameter("txt_Remark").toString().trim());
		sSim.setCommunication_skill(request.getParameter("txt_Comm_Skill").toString().trim());
		System.out.println(sSim.toString());
	}catch (Exception e) 
	{
	e.printStackTrace();
	System.out.println("binding eroor");
	}
		return sSim;
	}

}
