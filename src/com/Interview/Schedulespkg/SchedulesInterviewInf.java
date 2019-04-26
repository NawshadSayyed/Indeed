package com.Interview.Schedulespkg;

import java.sql.SQLException;
import java.util.ArrayList;

public interface SchedulesInterviewInf 
{
public Boolean save(SchedulesInterModel SIM )throws SQLException;
public Boolean Updatae(SchedulesInterModel SIM)throws SQLException;
public Boolean Delete(SchedulesInterModel SIM)throws SQLException;
public SchedulesInterModel viewById(Integer id )throws SQLException;
public ArrayList<SchedulesInterModel> ViewAll()throws SQLException;
public ArrayList<SchedulesInterModel> ViewAllQuery(String query)throws SQLException;
public StringBuilder ViewAllQuery(String Column_name,String column_Value) throws SQLException;	
public StringBuilder ViewScheduledInterView()throws SQLException;
public Boolean UpdataeStatus(int id)throws SQLException;
	
	
}
