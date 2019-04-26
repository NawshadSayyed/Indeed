package Demopkg;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class SendEmail {
	
	public static boolean sendEmail(String uname,String upass,String host,String Port,String from, String to, String subject,String msgbody)
	{
	  	Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", Port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.user", from);
		properties.put("mail.password", upass);
		SmtpAuthenticator authentication = new SmtpAuthenticator(uname,upass);
		javax.mail.Message message = new MimeMessage(Session
		                    .getDefaultInstance(properties, authentication));
	      try {
	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));
	         // Set To: header field of the header.
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	         // Set Subject: header field
	         message.setSubject(subject);
	         // Now set the actual message
	         message.setText(msgbody);
	         // Send message
	         Transport.send(message);
	         System.out.println("Sent message successfully....");
	         return true;
	      } catch (MessagingException mex) {
	         mex.printStackTrace();
	         return false;
	      }

	}
	
	
	
	

/*   public static void main(String [] args) {    
      // Recipient's email ID needs to be mentioned.
      String to = "sumitsatpute21@gmail.com";

      // Sender's email ID needs to be mentioned
      String from = "infohr.diary@gmail.com";

      // Assuming you are sending email from localhost
      String host = "smtp.gmail.com";
      
  	Properties properties = new Properties();
	properties.put("mail.smtp.host", host);
	properties.put("mail.smtp.port", 587);
	properties.put("mail.smtp.auth", "true");
	properties.put("mail.smtp.starttls.enable", "true");
	properties.put("mail.user", "infohr.diary@gmail.com");
	properties.put("mail.password", "Callisto@123");
     
	
	SmtpAuthenticator authentication = new SmtpAuthenticator();
	javax.mail.Message message = new MimeMessage(Session
	                    .getDefaultInstance(properties, authentication));
	
	
      try {
         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));

         // Set To: header field of the header.
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

         // Set Subject: header field
         message.setSubject("This is the Subject Line!");

         // Now set the actual message
         message.setText("This is actual message");

         // Send message
         Transport.send(message);
         System.out.println("Sent message successfully....");
      } catch (MessagingException mex) {
         mex.printStackTrace();
      }
   }*/
}