package com.Consultancy.CandidateDetails;

import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ConProvider.ConnectionProvider;

public class CandidateDetailsModel {
	private String app_date;
	private String cand_email;
	private Integer cand_exp_month;
	private Integer cand_exp_year;
	private String cand_first_name;
	private String cand_last_name;
	private String cand_mid_name;
	private String cand_phone;
	private InputStream cand_resume;
	private String cand_skils;
	private Integer candidate_id;
	private Integer Consultancy_id;
	private Integer job_app_id;
	private String location;

	CandidateDetailsModel() {
	}

	public CandidateDetailsModel(Integer candidate_id, Integer job_app_id, String cand_first_name, String cand_mid_name,
			String cand_last_name, String cand_email, String cand_phone, Integer cand_exp_year, Integer cand_exp_month,
			String cand_skils, String location, InputStream cand_resume, String app_date ,Integer Consultancy_id) {
		super();
		this.candidate_id = candidate_id;
		this.job_app_id = job_app_id;
		this.cand_first_name = cand_first_name;
		this.cand_mid_name = cand_mid_name;
		this.cand_last_name = cand_last_name;
		this.cand_email = cand_email;
		this.cand_phone = cand_phone;
		this.cand_exp_year = cand_exp_year;
		this.cand_exp_month = cand_exp_month;
		this.cand_skils = cand_skils;
		this.location = location;
		this.cand_resume = cand_resume;
		this.app_date = app_date;
		this.Consultancy_id=Consultancy_id;
	}

	public String getApp_date() {
		try {
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			Date Currrentdate = ConnectionProvider.StringtoDateConvertion(this.app_date.toString().trim());
			return ft.format(Currrentdate);
		} catch (ParseException e) {
			e.printStackTrace();
			return this.app_date;
		}
	}

	public String getCand_email() {
		return cand_email;
	}

	public Integer getCand_exp_month() {
		return cand_exp_month;
	}

	public Integer getCand_exp_year() {
		return cand_exp_year;
	}

	public String getCand_first_name() {
		return cand_first_name;
	}

	public String getCand_last_name() {
		return cand_last_name;
	}

	public String getCand_mid_name() {
		return cand_mid_name;
	}

	public String getCand_phone() {
		return cand_phone;
	}

	public InputStream getCand_resume() {
		return cand_resume;
	}

	public String getCand_skils() {
		return cand_skils;
	}

	public Integer getCandidate_id() {
		return candidate_id;
	}

	public Integer getConsultancy_id() {
		return Consultancy_id;
	}

	public Integer getjob_app_id() {
		return job_app_id;
	}

	public Integer getJob_app_id() {
		return job_app_id;
	}

	public String getlocation() {
		return location;
	}

	public String getLocation() {
		return location;
	}

	public void setApp_date(String app_date) {
		this.app_date = app_date;
	}

	public void setCand_email(String cand_email) {
		this.cand_email = cand_email;
	}

	public void setCand_exp_month(Integer cand_exp_month) {
		this.cand_exp_month = cand_exp_month;
	}

	public void setCand_exp_year(Integer cand_exp_year) {
		this.cand_exp_year = cand_exp_year;
	}

	public void setCand_first_name(String cand_first_name) {
		this.cand_first_name = cand_first_name;
	}

	public void setCand_last_name(String cand_last_name) {
		this.cand_last_name = cand_last_name;
	}

	public void setCand_mid_name(String cand_mid_name) {
		this.cand_mid_name = cand_mid_name;
	}

	public void setCand_phone(String cand_phone) {
		this.cand_phone = cand_phone;
	}

	public void setCand_resume(InputStream cand_resume) {
		this.cand_resume = cand_resume;
	}

	public void setCand_skils(String cand_skils) {
		this.cand_skils = cand_skils;
	}

	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}

	public void setConsultancy_id(Integer consultancy_id) {
		Consultancy_id = consultancy_id;
	}

	public void setjob_app_id(Integer job_app_id) {
		this.job_app_id = job_app_id;
	}

	public void setJob_app_id(Integer job_app_id) {
		this.job_app_id = job_app_id;
	}

	public void setlocation(String location) {
		this.location = location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "CandidateDetailsModel [candidate_id=" + candidate_id + ", job_app_id=" + job_app_id
				+ ", cand_first_name=" + cand_first_name + ", cand_mid_name=" + cand_mid_name + ", cand_last_name="
				+ cand_last_name + ", cand_email=" + cand_email + ", cand_phone=" + cand_phone + ", cand_exp_year="
				+ cand_exp_year + ", cand_exp_month=" + cand_exp_month + ", cand_skils=" + cand_skils + ", location="
				+ location + ", cand_resume=" + cand_resume + ", app_date=" + app_date + "Consultancy_id="+Consultancy_id+"]";
	}

}
