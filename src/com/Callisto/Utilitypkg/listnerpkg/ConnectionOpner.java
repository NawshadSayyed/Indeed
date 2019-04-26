package com.Callisto.Utilitypkg.listnerpkg;

import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import com.ConProvider.ConnectionProviderSingleTone;

@WebListener
public class ConnectionOpner implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ConnectionOpner() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
   

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent ctx)  { 
      ServletContext context = ctx.getServletContext();
      ConnectionProviderSingleTone.driver = context.getInitParameter("driverName");
      ConnectionProviderSingleTone.ConnUri= context.getInitParameter("conURL");
      ConnectionProviderSingleTone.uname = context.getInitParameter("Uname");
      ConnectionProviderSingleTone.upass = context.getInitParameter("Upass");
      System.out.println("Driver Name : - "+ConnectionProviderSingleTone.driver);
      System.out.println("URL : - "+ConnectionProviderSingleTone.ConnUri);
      System.out.println("Uname : - "+ConnectionProviderSingleTone.uname);
      System.out.println("Upass : - "+ConnectionProviderSingleTone.upass);
      
      
 /*     ConnectionProviderSingleTone.driver = context.getInitParameter("driverName");
      ConnectionProviderSingleTone.ConnUri= context.getInitParameter("conURL");
      ConnectionProviderSingleTone.uname = context.getInitParameter("Uname");
      ConnectionProviderSingleTone.upass = context.getInitParameter("Upass");*/
      
      
      /*System.out.println("Driver Name"+ConnectionProviderSingleTone.driver);
      System.out.println("URL"+ConnectionProviderSingleTone.ConnUri);
      System.out.println("Uname"+ConnectionProviderSingleTone.ConnUri);
      System.out.println("Upass"+ConnectionProviderSingleTone.upass);*/
    }
	
    
    public void contextDestroyed(ServletContextEvent ctxEvt)  
    { 
     	ServletContext ctx = ctxEvt.getServletContext();
    	    	ConnectionProviderSingleTone.closeConnection();
    	System.out.println("Database connection closed for Application.");
    	
    	
        
        	
       
    	
    	
    	
    }
}
    