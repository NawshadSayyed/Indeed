package com.Callisto.Utilitypkg;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
 


import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * A utility class for sending e-mail message with attachment.
 * @author www.codejava.net
 *
 */
public class EmailUtility {
	
	/**
	 * Sends an e-mail message from a SMTP host with a list of attached files. 
	 * 
	 */
	public static void sendEmailWithAttachment(String host, String port,
			final String userName, final String password, String toAddress,
			String subject, String message, List<File> attachedFiles)
					throws AddressException, MessagingException {
		// sets SMTP server properties
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.user", userName);
		properties.put("mail.password", password);

		// creates a new session with an authenticator
		Authenticator auth = new Authenticator() 
		{
			public PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(userName, password);
			}
			
		};
		Session session = Session.getInstance(properties, auth);
		
	    // creates a new e-mail message
		Message msg = new MimeMessage(session);

		msg.setFrom(new InternetAddress(userName));
		InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
		msg.setRecipients(Message.RecipientType.TO, toAddresses);
		msg.setSubject(subject);
		msg.setSentDate(new Date());

		String project = null;
		String projectname = null;
		String Severity = null;
		String Priority = null;
		String Status = null;
		String demo = "demo";
		
		// project = session.getAttribute("AsiTo");
		
		// creates message part
		MimeMessage MessagePart = new MimeMessage(session);
/*		messageBodyPart.setContent("<html>\n"+
				"<script>\n"+
	            "document.getElementById("+demo+").innerHTML = Date();" +
	            "</script>\n" +
                "<body>\n" +
                "\n" +
                "The following issue has been SUBMITTED <br> " +
                "====================================================================== <br>" +
                "Reported By:                administrator <br>"+
                "Assigned To:                 "+project+"             <br>" +
                "====================================================================== <br>" +
                "Project:                    "+projectname+"  <br>" +
                "Severity:                   "+Severity+"     <br>"+
                "Priority:                   "+Priority+"     <br>" +
                "Status:                     "+Status+"       <br> " +
                "====================================================================== <br>" +
                "Date Submitted:             <p id="+demo+"></p>  <br> " +
                "====================================================================== <br>" +
                " Summary:                    <br>"+
                " Description:<br>" +
                "====================================================================== <br>" +
                "This email is a service from callisto IT solutions.<br>" +
                "</body>\n" +
                "</html>","text/html");
*/
		
		
		
		MessagePart.setContent("this is body part","text/html");
		
		
		// Set Subject: subject of the email 
		MessagePart.setSubject("This is Suject"); 
 
        // set body of the email. 
		MessagePart.setText("This is a test mail"); 
 
		
		
		
			// sends the e-mail
		Transport.send(MessagePart);
	}
}