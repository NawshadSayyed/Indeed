package com.Consultancy;

import java.sql.SQLException;

import com.Consultancy.ConsultancyModel;

public interface consultancy 
{
	   public boolean save(ConsultancyModel con);
	   public boolean update(ConsultancyModel con,String id);
	   public boolean delete(String id);
	   public ConsultancyModel viewById(String Query)throws SQLException;

}
