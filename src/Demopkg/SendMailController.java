package Demopkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendMailController
 */
@WebServlet("/SendMailController")
public class SendMailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendMailController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		// TODO Auto-generated method stub
		try {
		ServletContext context = getServletContext();

		boolean b = SendEmail.sendEmail(context.getInitParameter("user"), context.getInitParameter("pass"),
					context.getInitParameter("host"), context.getInitParameter("port"),
					context.getInitParameter("user"), request.getParameter("txt_to").toString().toLowerCase().trim(),
					request.getParameter("txt_Subject").toString().trim(),
					request.getParameter("txt_Msg").toString().trim());

		if(b){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Email Send Successfully ..');window.location='./ComposeMail.jsp'");
			out.println("</script>");

		}else{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Email Undelivered. Check Your Internate Connection. \n Please Try Again.');window.location='./ComposeMail.jsp'");
			out.println("</script>");
		}
		} catch (Exception e)
		{
			e.printStackTrace();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Email Undelivered. Check Email Address \n Please Try Again.');window.location='./ComposeMail.jsp'");
			out.println("</script>");
		}
	}

}
