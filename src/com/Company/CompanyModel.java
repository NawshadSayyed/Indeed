package com.Company;

public class CompanyModel 
{
	public CompanyModel(String uname, String upass, String fname, String lname, String m_number, String w_number,
			String email, String organization_name, String c_date, String e_date, String street, String city,
			String state, String country, String zipcode) { 
		super();
		this.uname = uname;
		this.upass = upass;
		this.fname = fname;
		this.lname = lname;
		this.m_number = m_number;
		this.w_number = w_number;
		this.email = email;
		this.organization_name = organization_name;
		this.c_date = c_date;
		this.e_date = e_date;
		this.street = street;
		this.city = city;
		this.state = state;
		this.country = country;
		this.zipcode = zipcode;
	}
	public CompanyModel() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "CompanyModel [uname=" + uname + ", upass=" + upass + ", fname=" + fname + ", lname=" + lname
				+ ", m_number=" + m_number + ", w_number=" + w_number + ", email=" + email + ", organization_name="
				+ organization_name + ", c_date=" + c_date + ", e_date=" + e_date + ", street=" + street + ", city="
				+ city + ", state=" + state + ", country=" + country + ", zipcode=" + zipcode + "]";
	}
	
	
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getM_number() {
		return m_number;
	}
	public void setM_number(String m_number) {
		this.m_number = m_number;
	}
	public String getW_number() {
		return w_number;
	}
	public void setW_number(String w_number) {
		this.w_number = w_number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOrganization_name() {
		return organization_name;
	}
	public void setOrganization_name(String organization_name) {
		this.organization_name = organization_name;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	private String uname;
	private String upass;
	private String fname;
	private String lname;
	private String m_number;
	private String w_number;
    private String email;
    private String organization_name;
    private String c_date;
    private String e_date;
    private String street;
    private String city;
    private String state;
    private String country;
    private String zipcode;
    
}
