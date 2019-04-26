package com.Interview.Schedulespkg;

import java.util.Date;

import com.ConProvider.ConnectionProvider;


public class SchedulesInterModel {
	private int Candidate_Id;
	private String Candidate_Name;
	private String Contact_person_name;
	private String Contact_person_number;
	private Date Interview_Date;
	private java.sql.Time Interview_end_time;
	private java.sql.Time Interview_start_time;
	private int Job_id;
	private int Schedules_Id;
	private String Vanue_Details;

	public SchedulesInterModel() {
	}

	public SchedulesInterModel(int schedules_Id, int candidate_Id, String candidate_Name, String contact_person_name,
			String contact_person_number, Date interview_Date, java.sql.Time interview_end_time, java.sql.Time interview_start_time,
			int job_id, String vanue_Details) {
		super();
		Schedules_Id = schedules_Id;
		Candidate_Id = candidate_Id;
		Candidate_Name = candidate_Name;
		Contact_person_name = contact_person_name;
		Contact_person_number = contact_person_number;
		Interview_Date = interview_Date;
		Interview_end_time = interview_end_time;
		Interview_start_time = interview_start_time;
		Job_id = job_id;
		Vanue_Details = vanue_Details;
	}

	public int getCandidate_Id() {
		return Candidate_Id;
	}

	public String getCandidate_Name() {
		return Candidate_Name;
	}

	public String getContact_person_name() {
		return Contact_person_name;
	}

	public String getContact_person_number() {
		return Contact_person_number;
	}

	public Date getInterview_Date() {
		return Interview_Date;
	}

	public java.sql.Time getInterview_end_time() {
		return Interview_end_time;
	}

	public java.sql.Time getInterview_start_time() {
		return Interview_start_time;
	}

	public int getJob_id() {
		return Job_id;
	}

	public int getSchedules_Id() {
		return Schedules_Id;
	}

	public long getTime() {
		return Interview_Date.getTime();
	}

	public String getVanue_Details() {
		return Vanue_Details;
	}

	public void setCandidate_Id(int candidate_Id) {
		Candidate_Id = candidate_Id;
	}

	public void setCandidate_Name(String candidate_Name) {
		Candidate_Name = candidate_Name;
	}

	public void setContact_person_name(String contact_person_name) {
		Contact_person_name = contact_person_name;
	}

	public void setContact_person_number(String contact_person_number) {
		Contact_person_number = contact_person_number;
	}

	public void setInterview_Date(Date interview_Date) {
		Interview_Date = interview_Date;
	}

	public void setInterview_end_time(String interview_end_time) {
		Interview_end_time =  ConnectionProvider.StringToTimeConvertion(interview_end_time)  ;
	}

	public void setInterview_start_time(String interview_start_time) {
		Interview_start_time = ConnectionProvider.StringToTimeConvertion(interview_start_time);
	}

	public void setJob_id(int job_id) {
		Job_id = job_id;
	}

	public void setSchedules_Id(int schedules_Id) {
		Schedules_Id = schedules_Id;
	}

	public void setVanue_Details(String vanue_Details) {
		Vanue_Details = vanue_Details;
	}

	@Override
	public String toString() {
		return "SchedulesInterModel [Schedules_Id=" + Schedules_Id + ", Candidate_Id=" + Candidate_Id
				+ ", Candidate_Name=" + Candidate_Name + ", Contact_person_name=" + Contact_person_name
				+ ", Contact_person_number=" + Contact_person_number + ", Interview_Date=" + Interview_Date
				+ ", Interview_end_time=" + Interview_end_time + ", Interview_start_time=" + Interview_start_time
				+ ", Job_id=" + Job_id + ", Vanue_Details=" + Vanue_Details + "]";
	}

}
