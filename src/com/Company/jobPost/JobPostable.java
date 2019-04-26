package com.Company.jobPost;

import java.sql.SQLException;
import java.util.ArrayList;

import com.Authenticate.AuthenticateModel;


public interface JobPostable 
{
	public boolean save(JobPostModel  comp);
	   public boolean update(JobPostModel comp,String Id);
	   public boolean delete(Integer id);
	   public JobPostModel viewById(AuthenticateModel am,String Query)throws SQLException;
       public ArrayList<JobPostModel> ViewAllJobDetils(AuthenticateModel am) throws SQLException;
       public ArrayList<JobPostModel> ViewAllJobDetils(AuthenticateModel am,String query) throws SQLException;

}
