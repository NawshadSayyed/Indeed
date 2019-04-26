package com.Company.jobPost;

public class JobPostModel {
	private String ddl_Exp_Type;
	private String ddl_job_category;
	private String ddl_Job_Type;
	private String ddl_Min_Qualification;
	private String ddl_Post_Status;
	private String ddl_Salary_Type;
	private int employer_id;
	private String txt_Company_Name;
	private String txt_Exp_qulif_skills;
	private int txt_job_id;
	private String txt_job_location;
	private String txt_job_post_date;
	private String txt_Job_Responsibility;
	private String txt_job_Title;
	private String txt_JobSummary;
	private double txt_Sal_From;
	private double txt_Sal_To;
	private int txt_Total_Exp;
	private int txt_txt_No_vacancies;
	private String txt_txt_post_by;
	
	public JobPostModel()
	{
		//DEFAULT CONSTRUCTOR
	}
	public JobPostModel(int txt_job_id, String txt_job_Title, String txt_Company_Name, String txt_job_post_date,
			String txt_txt_post_by, int txt_txt_No_vacancies, String txt_job_location, String ddl_Job_Type,
			double txt_Sal_From, double txt_Sal_To, String ddl_Salary_Type, String txt_JobSummary,
			String txt_Job_Responsibility, String txt_Exp_qulif_skills, String ddl_Min_Qualification,
			String ddl_Exp_Type, int txt_Total_Exp, String ddl_Post_Status ,String ddl_job_category,int employer_id) {
		super();
		this.txt_job_id = txt_job_id;
		this.txt_job_Title = txt_job_Title;
		this.txt_Company_Name = txt_Company_Name;
		this.txt_job_post_date = txt_job_post_date;
		this.txt_txt_post_by = txt_txt_post_by;
		this.txt_txt_No_vacancies = txt_txt_No_vacancies;
		this.txt_job_location = txt_job_location;
		this.ddl_Job_Type = ddl_Job_Type;
		this.txt_Sal_From = txt_Sal_From;
		this.txt_Sal_To = txt_Sal_To;
		this.ddl_Salary_Type = ddl_Salary_Type;
		this.txt_JobSummary = txt_JobSummary;
		this.txt_Job_Responsibility = txt_Job_Responsibility;
		this.txt_Exp_qulif_skills = txt_Exp_qulif_skills;
		this.ddl_Min_Qualification = ddl_Min_Qualification;
		this.ddl_Exp_Type = ddl_Exp_Type;
		this.txt_Total_Exp = txt_Total_Exp;
		this.ddl_Post_Status = ddl_Post_Status;
		this.ddl_job_category =ddl_job_category;
		this.employer_id =employer_id;
	
	}
	public String getDdl_Exp_Type() {
		return ddl_Exp_Type;
	}
	public String getDdl_job_category() {
		return ddl_job_category;
	}
	public String getDdl_Job_Type() {
		return ddl_Job_Type;
	}
	public String getDdl_Min_Qualification() {
		return ddl_Min_Qualification;
	}
	public String getDdl_Post_Status() {
		return ddl_Post_Status;
	}
	public String getDdl_Salary_Type() {
		return ddl_Salary_Type;
	}
	public int getEmployer_id() {
		return employer_id;
	}
	public String getTxt_Company_Name() {
		return txt_Company_Name;
	}
	public String getTxt_Exp_qulif_skills() {
		return txt_Exp_qulif_skills;
	}
	public int getTxt_job_id() {
		return txt_job_id;
	}
	public String getTxt_job_location() {
		return txt_job_location;
	}
	public String getTxt_job_post_date() {
		return txt_job_post_date;
	}
	public String getTxt_Job_Responsibility() {
		return txt_Job_Responsibility;
	}
	public String getTxt_job_Title() {
		return txt_job_Title;
	}
	public String getTxt_JobSummary() {
		return txt_JobSummary;
	}
	public double getTxt_Sal_From() {
		return txt_Sal_From;
	}
	public double getTxt_Sal_To() {
		return txt_Sal_To;
	}
	public int getTxt_Total_Exp() {
		return txt_Total_Exp;
	}
	public int getTxt_txt_No_vacancies() {
		return txt_txt_No_vacancies;
	}
	public String getTxt_txt_post_by() {
		return txt_txt_post_by;
	}
	public void setDdl_Exp_Type(String ddl_Exp_Type) {
		this.ddl_Exp_Type = ddl_Exp_Type;
	}
	public void setDdl_job_category(String ddl_job_category) {
		this.ddl_job_category = ddl_job_category;
	}
	public void setDdl_Job_Type(String ddl_Job_Type) {
		this.ddl_Job_Type = ddl_Job_Type;
	}
	public void setDdl_Min_Qualification(String ddl_Min_Qualification) {
		this.ddl_Min_Qualification = ddl_Min_Qualification;
	}
	public void setDdl_Post_Status(String ddl_Post_Status) {
		this.ddl_Post_Status = ddl_Post_Status;
	}
	public void setDdl_Salary_Type(String ddl_Salary_Type) {
		this.ddl_Salary_Type = ddl_Salary_Type;
	}
	public void setEmployer_id(int employer_id) {
		this.employer_id = employer_id;
	}
	public void setTxt_Company_Name(String txt_Company_Name) {
		this.txt_Company_Name = txt_Company_Name;
	}
	public void setTxt_Exp_qulif_skills(String txt_Exp_qulif_skills) {
		this.txt_Exp_qulif_skills = txt_Exp_qulif_skills;
	}
	public void setTxt_job_id(int txt_job_id) {
		this.txt_job_id = txt_job_id;
	}
	public void setTxt_job_location(String txt_job_location) {
		this.txt_job_location = txt_job_location;
	}
	public void setTxt_job_post_date(String txt_job_post_date) {
		this.txt_job_post_date = txt_job_post_date;
	}
	public void setTxt_Job_Responsibility(String txt_Job_Responsibility) {
		this.txt_Job_Responsibility = txt_Job_Responsibility;
	}
	public void setTxt_job_Title(String txt_job_Title) {
		this.txt_job_Title = txt_job_Title;
	}
	public void setTxt_JobSummary(String txt_JobSummary) {
		this.txt_JobSummary = txt_JobSummary;
	}
	public void setTxt_Sal_From(double txt_Sal_From) {
		this.txt_Sal_From = txt_Sal_From;
	}
	public void setTxt_Sal_To(double txt_Sal_To) {
		this.txt_Sal_To = txt_Sal_To;
	}
	public void setTxt_Total_Exp(int txt_Total_Exp) {
		this.txt_Total_Exp = txt_Total_Exp;
	}
	public void setTxt_txt_No_vacancies(int txt_txt_No_vacancies) {
		this.txt_txt_No_vacancies = txt_txt_No_vacancies;
	}
	public void setTxt_txt_post_by(String txt_txt_post_by) {
		this.txt_txt_post_by = txt_txt_post_by;
	}
	@Override
	public String toString() {
		return "JobPostModel [ddl_Exp_Type=" + ddl_Exp_Type + ", ddl_Job_Type=" + ddl_Job_Type
				+ ", ddl_Min_Qualification=" + ddl_Min_Qualification + ", ddl_Post_Status=" + ddl_Post_Status
				+ ", ddl_Salary_Type=" + ddl_Salary_Type + ", txt_Company_Name=" + txt_Company_Name
				+ ", txt_Exp_qulif_skills=" + txt_Exp_qulif_skills + ", txt_job_id=" + txt_job_id
				+ ", txt_job_location=" + txt_job_location + ", txt_job_post_date=" + txt_job_post_date
				+ ", txt_Job_Responsibility=" + txt_Job_Responsibility + ", txt_job_Title=" + txt_job_Title
				+ ", txt_JobSummary=" + txt_JobSummary + ", txt_Sal_From=" + txt_Sal_From + ", txt_Sal_To=" + txt_Sal_To
				+ ", txt_Total_Exp=" + txt_Total_Exp + ", txt_txt_No_vacancies=" + txt_txt_No_vacancies
				+ ", txt_txt_post_by=" + txt_txt_post_by + ", ddl_job_category=" + ddl_job_category + ", employer_id="
				+ employer_id + "]";
	}
	

}
