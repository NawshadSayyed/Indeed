package com.Authenticate;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ConProvider.ConnectionProvider;
import com.ConProvider.ConnectionProviderSingleTone;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs = request.getSession();
		PrintWriter out = response.getWriter();
		ArrayList<AuthenticateModel> AM =null;
		AuthenticateModel aam =null;
		String uname = request.getParameter("Uname");
		String upass = request.getParameter("Upass");
		
		try {
			aam = new AuthenticateModel();
			AM = AuthenticateDao.getauthenticate(uname, upass);
			if(AM.size()>0){
				for(AuthenticateModel temp :AM){
					aam =temp;
				}
				if(hs.getAttribute("Uname")!=null){
					hs.invalidate();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Only One User Access At a Time'); window.location='./Home.jsp'");//alert('Welcome " + uname + "');
					out.println("</script>");
				}
				
				
				System.out.println(aam.toString());
				hs.setAttribute("Uname", aam.getUname());
				hs.setAttribute("AuthenticateModel", aam);
				System.out.println(aam.getUname());
				
				out.println("<script type=\"text/javascript\">");
				out.println("window.location='./index.jsp'");//alert('Welcome " + uname + "');
				out.println("</script>");
  
			
			}
			else{
				
				String n = ConnectionProviderSingleTone.driver+" "+ConnectionProviderSingleTone.uname+" "+ConnectionProviderSingleTone.upass+" "+ ConnectionProviderSingleTone.ConnUri;
				
				System.out.println("user Name and password is not match");
				out.println("<script type=\"text/javascript\">");
				out.println(
						"alert('User Name and Password Not Match....Please Try Again Connecion string :- "+n+"');window.location='./LoginAdmin.jsp'");
				out.println("</script>");
			
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Exception Arrised");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('" + e + "');window.location='./LoginAdmin.jsp");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("./LoginAdmin.jsp");
			rd.forward(request, response);
		}
		
		
		

	}

}
