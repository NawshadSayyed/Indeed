package com.Authenticate;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ConProvider.ConnectionProviderSingleTone;

import Demopkg.SendEmail;

/**
 * Servlet implementation class ForgetPass
 */
@WebServlet("/ForgetPass")
public class ForgetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession hs = request.getSession();
		PrintWriter out= response.getWriter();
		Random rand = new Random(); 
		int value = rand.nextInt(10000);
		String paramEmail =  request.getParameter("Uname").toString().trim();
		try {
			PreparedStatement ps = ConnectionProviderSingleTone.getInstance().prepareStatement("select * from register where uname= '"+paramEmail+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				if(paramEmail.equals(rs.getString("uname").toString().trim()))
				{
					ServletContext context = getServletContext();
					boolean b=	SendEmail.sendEmail(context.getInitParameter("user"), context.getInitParameter("pass"),
								context.getInitParameter("host"), context.getInitParameter("port"),
								context.getInitParameter("user"), paramEmail.trim().toLowerCase(),
								"Reset Jobber Loggin Password","Hi \n Reset Jobber Loggin Password \n  Reset Code:"+value+"");
					
					if(b)
					{
						hs.setAttribute("userName", paramEmail);
						hs.setAttribute("ResetCode", value);
						hs.setAttribute("user_id", rs.getString("id").toString().trim());
						hs.setAttribute("UserType", rs.getString("UserType").toString().trim());
						response.sendRedirect("./ResetPassword.jsp");
					}
					else{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Email Undelivered. Check Email Address \n Please Try Again.');window.location='./Home.jsp'");
						out.println("</script>");
					//	response.sendRedirect("./Home.jsp");
					}
					
				}
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error Occured "+e+"');window.location='./Home.jsp'");
			out.println("</script>");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try{
			HttpSession hs = request.getSession();
			PrintWriter out = response.getWriter();
			String Code = hs.getAttribute("ResetCode").toString().trim();
			String user_id = hs.getAttribute("user_id").toString().trim();
			String UserType = hs.getAttribute("UserType").toString().trim();
			String reset_code =request.getParameter("txt_resetCode").toString().trim();
			String new_pass =request.getParameter("Confirm_pass").toString().trim();		
			String paramEmail=hs.getAttribute("userName").toString().trim();
			
			if(Code.equals(reset_code))
			{
					
			try{int tableA=0,tableB=0,table=0; 
			PreparedStatement ps = ConnectionProviderSingleTone.getInstance().prepareStatement("update register set upass='"+new_pass+"' where id= '"+user_id+"'");
			table=ps.executeUpdate();
				if(UserType.equals("Employer")){
						
					PreparedStatement ps1 = ConnectionProviderSingleTone.getInstance().prepareStatement("update companydetails set upass ='"+new_pass+"' where uname='"+paramEmail+"'");
					tableA=ps1.executeUpdate();	
				}
				else{
					
					PreparedStatement ps1 = ConnectionProviderSingleTone.getInstance().prepareStatement("update consultancydetails set upass ='"+new_pass+"' where uname='"+paramEmail+"'");
					tableB=ps1.executeUpdate();			
				}
				if(table==tableA || table==tableB){
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Password Reset Successfully.');window.location='./Home.jsp'");
					out.println("</script>");
				}
				
			}catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Error in Code "+e+".');window.location='./Home.jsp'");
				out.println("</script>");
			}	
				
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		
		
		
	}

}
