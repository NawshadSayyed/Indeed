package com.Consultancy.CandidateDetails;

import java.sql.SQLException;
import java.util.ArrayList;

import com.Authenticate.AuthenticateModel;


public interface CandidateDetailsInf {
	public boolean save(CandidateDetailsModel  comp);
	public boolean update(CandidateDetailsModel comp,String Id);
	public boolean delete(Integer id);
	public CandidateDetailsModel viewById(AuthenticateModel am, String Query)throws SQLException;
    public ArrayList<CandidateDetailsModel> ViewAllJobDetils(AuthenticateModel am) throws SQLException;
    public ArrayList<CandidateDetailsModel> ViewAllJobDetils(AuthenticateModel am,String query) throws SQLException;
    
    public CandidateDetailsModel viewByIdRejectedCandidate(AuthenticateModel am, String Query)throws SQLException;
    public ArrayList<CandidateDetailsModel> ViewAllJobDetilsRejectedCandidate(AuthenticateModel am) throws SQLException;
    public ArrayList<CandidateDetailsModel> ViewAllJobDetilsRejectedCandidate(AuthenticateModel am,String query) throws SQLException;

}
