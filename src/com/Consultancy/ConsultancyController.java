package com.Consultancy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ConProvider.ConnectionProvider;

import Demopkg.SendEmail;

@WebServlet("/ConsultancyController")
public class ConsultancyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ConsultancyController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String btn = request.getParameter("btn_submit");
		HttpSession hs = request.getSession();
		if (btn.equalsIgnoreCase("Edit")) {
			String id = request.getParameter("view_id");
			hs.setAttribute("edit_id", id);
			request.getRequestDispatcher("./Consultancy.jsp?id=" + id + "").forward(request, response);
		}

		if (btn.equalsIgnoreCase("Delete")) {
			String add = request.getParameter("view_id");
			try {
				consultancy consult = new ConsultancyImplements();
				boolean b = consult.delete(add.toString().trim());
				if (b) {
					System.out.println("Delete Sucessfully");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Delete Sucessfully..');window.location='./CosultancyReport.jsp'");
					out.println("</script>");
				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Please Try Again..');window.location='./CosultancyReport.jsp'");
					out.println("</script>");
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					ConnectionProvider.CloseAllGlobConnection();
				} catch (SQLException e) {
				}
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServletContext context = getServletContext();
		HttpSession hs = request.getSession();
		PrintWriter out = response.getWriter();
		String btn = request.getParameter("btn_submit");
		ConsultancyModel con = new ConsultancyModel();
		con.setCon_uname(request.getParameter("con_uname"));
		con.setCon_upass(request.getParameter("con_upass"));
		con.setCon_fname(request.getParameter("con_fname"));
		con.setCon_lname(request.getParameter("con_lname"));
		con.setCon_mnumber(request.getParameter("con_mnumber"));
		con.setCon_wnumber(request.getParameter("con_wnumber"));
		con.setCon_email(request.getParameter("con_email"));
		con.setCon_consultancyname(request.getParameter("con_consultancy"));
		con.setCon_date(request.getParameter("con_date"));
		con.setCon_street(request.getParameter("con_street"));
		con.setCon_city(request.getParameter("con_city"));
		con.setCon_state(request.getParameter("con_state"));
		con.setCon_country(request.getParameter("con_country"));
		con.setCon_zipcode(request.getParameter("con_zipcode"));
		con.setCon_e_date(request.getParameter("edate"));

		if (btn.equalsIgnoreCase("submit")) {

			if (request.getParameter("btn_submit") != null) {
				consultancy daoemp = new ConsultancyImplements();
				Boolean reult = daoemp.save(con);
				if (reult) {
					Date dt = new Date();
					String msg = "Date:-" + dt + "\n Welcome \n " + con.getCon_fname()
							+ "\n\n It is a great honour to have you in our team. \n Congratulations and welcome. \n Your User name :-"
							+ con.getCon_uname() + " \n password :-" + con.getCon_upass()
							+ "\n Your Registraion Till \n Date :-" + con.getCon_date() + " To " + con.getCon_e_date();
					SendEmail.sendEmail(context.getInitParameter("user"), context.getInitParameter("pass"),
							context.getInitParameter("host"), context.getInitParameter("port"),
							context.getInitParameter("user"), con.getCon_email(), "Account Register Successfully", msg);
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Created Successfully..');window.location='./CosultancyReport.jsp'");
					out.println("</script>");
				}
			}

		} else {
			// System.out.println("Hello");
			// String qQuery="update consultancydetails set uname='?',
			// upass='?', fname='?',lname='?', mnumber='?' , lnumber='?',
			// email='?', consultancyname='?', date='?' , street='?'"+
			// ",city='?' , state='?', country='?' , zipcode='?' where id
			// ="+request.getParameter("EditEmpID").toString().trim()+" ";

			try {
				consultancy consult = new ConsultancyImplements();
				boolean b = consult.update(con, hs.getAttribute("edit_id").toString().trim());
				if (b) {
					System.out.println("Updated successfully..........");

					out.println("<script type=\"text/javascript\">");
					out.println("alert('Updated Successfully..');window.location='./CosultancyReport.jsp'");
					out.println("</script>");
					// response.sendRedirect("./CosultancyReport.jsp");

				} else {
					System.out.println("Try Again..");

					out.println("<script type=\"text/javascript\">");
					out.println("alert('Please Try Again..');window.location='./CosultancyReport.jsp'");
					out.println("</script>");

				}

			} catch (Exception e) {

				out.println("<script type=\"text/javascript\">");
				out.println("alert('please Try Again .." + e + "');window.location='./Cosultancy.jsp'");
				out.println("</script>");
				e.printStackTrace();

			} finally {
				try {
					ConnectionProvider.CloseAllGlobConnection();
					System.gc();
				} catch (Exception e2) {
				}
			}

		}

	}

}
