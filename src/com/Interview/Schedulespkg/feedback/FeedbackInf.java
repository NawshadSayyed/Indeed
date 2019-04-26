package com.Interview.Schedulespkg.feedback;

import java.sql.SQLException;
import java.util.ArrayList;

import com.Interview.Schedulespkg.SchedulesInterModel;

public interface FeedbackInf 
{
	public Boolean save(FeedbackModel fm )throws SQLException;
	public Boolean Updatae(FeedbackModel fm)throws SQLException;
	public Boolean Delete(FeedbackModel fm)throws SQLException;
	public SchedulesInterModel viewById(Integer id )throws SQLException;
	public ArrayList<FeedbackModel> ViewAll()throws SQLException;
	public ArrayList<FeedbackModel> ViewAllQuery(String query)throws SQLException;
	public StringBuilder ViewAllResult()throws SQLException;
	public StringBuilder ViewAllQuery(String Columns_name,String Columns_value)throws SQLException;
}
