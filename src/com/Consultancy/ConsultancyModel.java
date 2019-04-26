package com.Consultancy;

public class ConsultancyModel {

	private String con_city;
	private String con_consultancyname;
	private String con_country;
	private String con_date;
	private String con_e_date;
	private String con_email;
	private String con_fname;
	private String con_lname;
	private String con_mnumber;
	private String con_state;
	private String con_street;
	private String con_uname;
	private String con_upass;
	private String con_wnumber;
	private String con_zipcode;
	private String UserType;

	public ConsultancyModel() {

	}

	public ConsultancyModel(String con_uname, String con_upass, String con_fname, String con_lname, String con_mnumber,
			String con_wnumber, String con_email, String con_consultancyname, String con_date, String con_street,
			String con_city, String con_state, String con_country, String con_zipcode, String con_e_date,
			String userType) {
		super();
		this.con_uname = con_uname;
		this.con_upass = con_upass;
		this.con_fname = con_fname;
		this.con_lname = con_lname;
		this.con_mnumber = con_mnumber;
		this.con_wnumber = con_wnumber;
		this.con_email = con_email;
		this.con_consultancyname = con_consultancyname;
		this.con_date = con_date;
		this.con_street = con_street;
		this.con_city = con_city;
		this.con_state = con_state;
		this.con_country = con_country;
		this.con_zipcode = con_zipcode;
		this.con_e_date = con_e_date;
		UserType = userType;
	}

	public String getCon_city() {
		return con_city;
	}

	public String getCon_consultancyname() {
		return con_consultancyname;
	}

	public String getCon_country() {
		return con_country;
	}

	public String getCon_date() {
		return con_date;
	}

	public String getCon_e_date() {
		return con_e_date;
	}

	public String getCon_email() {
		return con_email;
	}

	public String getCon_fname() {
		return con_fname;
	}

	public String getCon_lname() {
		return con_lname;
	}

	public String getCon_mnumber() {
		return con_mnumber;
	}

	public String getCon_state() {
		return con_state;
	}

	public String getCon_street() {
		return con_street;
	}

	public String getCon_uname() {
		return con_uname;
	}

	public String getCon_upass() {
		return con_upass;
	}

	public String getCon_wnumber() {
		return con_wnumber;
	}

	public String getCon_zipcode() {
		return con_zipcode;
	}

	public String getUserType() {
		return UserType;
	}

	public void setCon_city(String con_city) {
		this.con_city = con_city;
	}

	public void setCon_consultancyname(String con_consultancyname) {
		this.con_consultancyname = con_consultancyname;
	}

	public void setCon_country(String con_country) {
		this.con_country = con_country;
	}

	public void setCon_date(String con_date) {
		this.con_date = con_date;
	}

	public void setCon_e_date(String con_e_date) {
		this.con_e_date = con_e_date;
	}

	public void setCon_email(String con_email) {
		this.con_email = con_email;
	}

	public void setCon_fname(String con_fname) {
		this.con_fname = con_fname;
	}

	public void setCon_lname(String con_lname) {
		this.con_lname = con_lname;
	}

	public void setCon_mnumber(String con_mnumber) {
		this.con_mnumber = con_mnumber;
	}

	public void setCon_state(String con_state) {
		this.con_state = con_state;
	}

	public void setCon_street(String con_street) {
		this.con_street = con_street;
	}

	public void setCon_uname(String con_uname) {
		this.con_uname = con_uname;
	}

	public void setCon_upass(String con_upass) {
		this.con_upass = con_upass;
	}

	public void setCon_wnumber(String con_wnumber) {
		this.con_wnumber = con_wnumber;
	}

	public void setCon_zipcode(String con_zipcode) {
		this.con_zipcode = con_zipcode;
	}

	public void setUserType(String userType) {
		UserType = userType;
	}

	@Override
	public String toString() {
		return "ConsultancyModel [con_uname=" + con_uname + ", con_upass=" + con_upass + ", con_fname=" + con_fname
				+ ", con_lname=" + con_lname + ", con_mnumber=" + con_mnumber + ", con_wnumber=" + con_wnumber
				+ ", con_email=" + con_email + ", con_consultancyname=" + con_consultancyname + ", con_date=" + con_date
				+ ", con_street=" + con_street + ", con_city=" + con_city + ", con_state=" + con_state
				+ ", con_country=" + con_country + ", con_zipcode=" + con_zipcode + ", con_e_date=" + con_e_date
				+ ", UserType=" + UserType + "]";
	}

}
