package com.Consultancy;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.Authenticate.AuthenticateModel;

/**
 * Servlet implementation class updatePasswordController
 */
@WebServlet(name = "UpdatePasswordController", urlPatterns = { "/UpdatePasswordController" })
public class updatePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public updatePasswordController() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs = request.getSession();
		AuthenticateModel am = (AuthenticateModel) hs.getAttribute("AuthenticateModel");
		PrintWriter out = response.getWriter();
		String old_pass =  request.getParameter("txt_old_pass");
		if(am.getUpass().equalsIgnoreCase(old_pass))
		{
			String newpass = request.getParameter("txt_confirm_pass").toString().trim();
		
		Boolean result=	UpdatePasswordImpl .check(newpass, am);
			if(result)
			{
				hs.invalidate();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Password Updated Successfully. Please Login. ');window.location='./Home.jsp'");
				out.println("</script>");

			}
			
		}
		
	}

}
