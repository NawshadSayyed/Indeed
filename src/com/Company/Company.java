package com.Company;

import java.sql.SQLException;


import com.Company.CompanyModel;

public interface Company
{
	public boolean save(CompanyModel comp);
	   public boolean update(CompanyModel comp,String Id);
	   public boolean delete(Integer id);
	   public CompanyModel viewById(String Query)throws SQLException;
	   
}
