package com.Callisto.Utilitypkg;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ConProvider.ConnectionProvider;

@MultipartConfig()
/**
 * Servlet implementation class DisplayPhotoServlet
 */

@WebServlet("/CandidateResume")
public class DisplayPhotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
			String Candidate_id=null;
    	        try {  
    	        	ConnectionProvider.CloseAllGlobConnection();
			            if(request.getParameter("Candidate_id")!=null){
		          		Candidate_id =	request.getParameter("Candidate_id");
		          	

			           ConnectionProvider.rs =ConnectionProvider.SelectData("SELECT cand_resume  FROM candidate_details where candidate_id ="+Candidate_id); //
			        	while(ConnectionProvider.rs.next())
			            {
			            Blob  b = ConnectionProvider.rs.getBlob("cand_resume");
			            response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
			            response.setContentLength( (int) b.length());
			            InputStream is = b.getBinaryStream();
			            OutputStream os = response.getOutputStream();
			            byte buf[] = new byte[(int) b.length()];
			            is.read(buf);
			            os.write(buf);
			            os.flush();
			            os.close();
			            }
		          	
		          	}
    	        	
		        }
		        catch(Exception ex) {
		             System.out.println(ex.getMessage());
		        }
		    } 

		    @Override
		    protected void doGet(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		        processRequest(request, response);
		    } 
		    @Override
		    protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		        processRequest(request, response);
		    }
		}
