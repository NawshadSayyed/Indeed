package com.Company;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ConProvider.ConnectionProvider;

import Demopkg.SendEmail;

@WebServlet("/CompanyController")
public class CompanyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CompanyController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs = request.getSession();
		PrintWriter out = response.getWriter();
		String btn = request.getParameter("btn_submit");
		if (btn.equalsIgnoreCase("Delete")) {
			String add = request.getParameter("view_id");
			try {
				System.out.println("Value of id by Controller :" + add);
				Company comp = new CompanyImplements();
				Boolean b = comp.delete(Integer.parseInt(add));
				if (b) {
					System.out.println("Delete Successfully");
					request.getRequestDispatcher("./CompanyReport.jsp").forward(request, response);
					
				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Please Try Again..');window.location='./CompanyReport.jsp'");
					out.println("</script>");
					
				}
			} catch (Exception e) {
				
				e.printStackTrace();
			}

		}

		if (btn.equalsIgnoreCase("Edit")) {
			try {
				String view_id = request.getParameter("view_id");
				hs.setAttribute("view_id", request.getParameter("view_id"));
				RequestDispatcher rd = request.getRequestDispatcher("Company.jsp?id=" + view_id);
				rd.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext context = getServletContext();
		PrintWriter out = response.getWriter();
		String btn = request.getParameter("btn_submit");
		CompanyModel comp = new CompanyModel();
		comp.setUname(request.getParameter("uname").toString());
		comp.setUpass(request.getParameter("upass").toString());
		comp.setFname(request.getParameter("fname").toString());
		comp.setLname(request.getParameter("lname").toString());
		comp.setM_number(request.getParameter("mnumber").toString());
		comp.setW_number(request.getParameter("wnumber").toString());
		comp.setEmail(request.getParameter("email").toString());
		comp.setOrganization_name(request.getParameter("org_name").toString());
		comp.setC_date(request.getParameter("cdate").toString());
		comp.setE_date(request.getParameter("edate").toString());
		comp.setStreet(request.getParameter("street").toString());
		comp.setCity(request.getParameter("city").toString());
		comp.setState(request.getParameter("state").toString());
		comp.setCountry(request.getParameter("country").toString());
		comp.setZipcode(request.getParameter("zipcode").toString());

		if (btn.equalsIgnoreCase("Submit")) 
		{
			if (request.getParameter("btn_submit") != null) {
				Company daoemp = new CompanyImplements();
				Boolean reult = daoemp.save(comp);
				if (reult) {
					System.out.println("successfully inserted");
				
					Date dt = new Date();
					String msg= "Date:-"+dt + "\n Welcome \n "+comp.getFname()+"\n\n It is a great honour to have you in our team. \n Congratulations and welcome. \n Your User name :-"+comp.getUname()+" \n password :-"+comp.getUpass()+"\n Your Registraion Till \n Date :-"+comp.getC_date() +" To "+comp.getE_date();
					SendEmail.sendEmail(context.getInitParameter("user"),
							context.getInitParameter("pass"), context.getInitParameter("host"),
							context.getInitParameter("port"), context.getInitParameter("user"),
							comp.getEmail(), "Account Register Successfully", msg);
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Employer Registerd Successfully..');window.location='./Company.jsp'");
					out.println("</script>");
					
				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Request is Abandoned. Please Try Again....');window.location='./Company.jsp'");
					out.println("</script>");
					
				}
			}

		} else if (btn.equalsIgnoreCase("Update")) {
			Company daoemp = new CompanyImplements();
			Boolean reult = daoemp.update(comp, request.getSession().getAttribute("view_id").toString().trim());
			if (reult) {
				System.out.println("Updated successfully ");
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Employer Registerd Successfully..');window.location='./CompanyReport.jsp" + "'");
				out.println("</script>");
				
			}
			out.println("<script type=\"text/javascript\">");
			out.println(
					"alert('Request is Abandoned. Please Try Again....');window.location='./CompanyReport.jsp" + "'");
			out.println("</script>");
			
		}

	}

}
