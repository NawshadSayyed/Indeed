package com.Interview.Schedulespkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.ssi.SSICommand;

import com.ConProvider.ConnectionProvider;

/**
 * Servlet implementation class SchedulesInterviewController
 */
@WebServlet("/SchedulesInterviewController")
public class SchedulesInterviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SchedulesInterviewController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Btn_value = request.getParameter("btn_Submit").toString().trim();
		if(Btn_value.endsWith("Search"))
		{
			String txt_search_by= request.getParameter("txt_search_by").toString().trim();
			String txt_search_value= request.getParameter("txt_search_value").toString().trim();
			response.sendRedirect("./ViewSchedulesInterview.jsp?search_by="+txt_search_by+"&search_value="+txt_search_value);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Btn_value = request.getParameter("btn_Submit").toString().trim();
		HttpSession hs = request.getSession();
		PrintWriter out = response.getWriter();
		try {
			if(request.getParameter("Edit_id")!=null){
				String Edit_id = request.getParameter("Edit_id").toString().trim();
			   response.sendRedirect("./Schedule_Interview.jsp?Edit_id="+Edit_id);
			}
			
			
			if (Btn_value.equalsIgnoreCase("Schedule"))
			{

				SchedulesInterviewInf sii = new SchedulesImplements();
				Boolean result = sii.save(BindRequest(request));
				if (result) {
					System.out.println("Successfully Inserted");
					out.println("<script type=\"text/javascript\">");
					out.println(
							"alert('Candidate Interview Scheduled Successfully..');window.location='./View_Applied_Candidate.jsp'");
					out.println("</script>");
				} else {
					out.println("<script type=\"text/javascript\">");
					out.println(
							"alert('Candidate Interview Scheduled Unsuccessfull.Please Try Again.....');window.location='./View_Applied_Candidate.jsp'");
					out.println("</script>");

				}

			}
			
			if(Btn_value.equalsIgnoreCase("Update")){
				SchedulesInterviewInf sii = new SchedulesImplements();
				Boolean result = sii.Updatae(BindRequest(request));
				if (result) {
					System.out.println("Successfully Updated");
					out.println("<script type=\"text/javascript\">");
					out.println(
							"alert('Candidate Interview Scheduled Updated Successfully..');window.location='./Schedule_Interview.jsp'");
					out.println("</script>");
				} else {
					out.println("<script type=\"text/javascript\">");
					out.println(
							"alert('Candidate Interview Scheduled Updated  Unsuccessfull.Please Try Again.....');window.location='./Schedule_Interview.jsp'");
					out.println("</script>");

				}
				
			}
			
			if(Btn_value.equals("Delete"))
			{
				SchedulesInterviewInf sii = new SchedulesImplements();
				Boolean result = sii.Delete(BindRequest(request));
				if (result) {
					System.out.println("Delete Successfully");
					out.println("<script type=\"text/javascript\">");
					out.println(
							"alert('Candidate Interview Scheduled Delete Successfully..');window.location='./Schedule_Interview.jsp'");
					out.println("</script>");
				} else {
					out.println("<script type=\"text/javascript\">");
					out.println(
							"alert('Candidate Interview Scheduled Updated  Delete. \n Please Try Again.....');window.location='./Schedule_Interview.jsp'");
					out.println("</script>");

				}
			}
			
			if(Btn_value.equals("Reject_Candidate"))
			{
				SchedulesInterviewInf sii = new SchedulesImplements();
				int Result = Integer.parseInt(request.getParameter("Applied_Candidate_id").trim().toString());
				Boolean result = sii.UpdataeStatus(Result);
				if (result) {
					System.out.println("Rejected Successfully");
					out.println("<script type=\"text/javascript\">");
					out.println(
							"alert('Candidate Rejected Successfully..');window.location='./View_Applied_Candidate.jsp'");
					out.println("</script>");
				} else {
					out.println("<script type=\"text/javascript\">");
					out.println(
							"alert('Candidate Not Rejected Yet. \n Please Try Again.....');window.location='./View_Applied_Candidate.jsp'");
					out.println("</script>");

				}
			}
			
			

			if (Btn_value.equalsIgnoreCase("Schedule_Interview")) 
			{
				String Applied_Candidate_id = request.getParameter("Applied_Candidate_id").toString().trim();
				
				String Applied_Candidate_Job_id = request.getParameter("Applied_Candidate_Job_id").toString().trim();
				hs.setAttribute("Applied_Candidate_id", Applied_Candidate_id);
				hs.setAttribute("Applied_Candidate_Job_id", Applied_Candidate_Job_id);
				response.sendRedirect("./Schedule_Interview.jsp");
			}

			if (Btn_value.equalsIgnoreCase("Reject_Candidate"))
			{
				String Applied_Candidate_id = request.getParameter("Applied_Candidate_id").toString().trim();
				hs.setAttribute("Applied_Candidate_id", Applied_Candidate_id);
			}
			
			
			
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	public SchedulesInterModel BindRequest(HttpServletRequest request){
		SchedulesInterModel sSim = new SchedulesInterModel();
		try{
		sSim.setJob_id(Integer.parseInt(request.getParameter("hdn_job_id").toString().trim()));
		sSim.setCandidate_Id(Integer.parseInt(request.getParameter("hdn_candidate_id").toString().trim()));
		sSim.setCandidate_Name(request.getParameter("txt_Interview_Name").toString().trim()); // it's
		sSim.setInterview_Date(ConnectionProvider.StringtoDateConvertion(request.getParameter("txt_Interview_Date").toString().trim()));
		sSim.setInterview_start_time(request.getParameter("txt_Int_Start_from").toString().trim());
		sSim.setInterview_end_time((request.getParameter("txt_Int_Start_to").toString().trim()));
		sSim.setContact_person_name((request.getParameter("txt_Contact_person").toString().trim()));
		sSim.setContact_person_number((request.getParameter("txt_Contact_Per_Number").toString().trim()));
		sSim.setVanue_Details((request.getParameter("txt_Vanue").toString().trim()));
		sSim.setSchedules_Id(ConnectionProvider.StringToIntConv(request.getParameter("hdn_schedules_id").toString().trim()));
	}catch (Exception e) {
	e.printStackTrace();
	}
		return sSim;
	}
	

}
