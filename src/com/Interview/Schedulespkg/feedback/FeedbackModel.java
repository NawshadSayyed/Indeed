package com.Interview.Schedulespkg.feedback;

import java.util.Date;

public class FeedbackModel {

	private String body_language;
	private int Candidate_id;
	private int feed_id;
	public int getFeed_id() {
		return feed_id;
	}

	public void setFeed_id(int feed_id) {
		this.feed_id = feed_id;
	}
	private String communication_skill;
	private int Consultant_id;
	private Date feedback_date;
	private String practical_knowlede;
	private String Remark;
	private int schedules_id;
	private String technical_knowledge;

	public FeedbackModel() {
	}

	
	public FeedbackModel(String body_language, int candidate_id, int feed_id, String communication_skill,
			int consultant_id, Date feedback_date, String practical_knowlede, String remark, int schedules_id,
			String technical_knowledge) {
		super();
		this.body_language = body_language;
		Candidate_id = candidate_id;
		this.feed_id = feed_id;
		this.communication_skill = communication_skill;
		Consultant_id = consultant_id;
		this.feedback_date = feedback_date;
		this.practical_knowlede = practical_knowlede;
		Remark = remark;
		this.schedules_id = schedules_id;
		this.technical_knowledge = technical_knowledge;
	}

	public String getBody_language() {
		return body_language;
	}

	public int getCandidate_id() {
		return Candidate_id;
	}

	public String getCommunication_skill() {
		return communication_skill;
	}

	public int getConsultant_id() {
		return Consultant_id;
	}

	public Date getFeedback_date() {
		return feedback_date;
	}

	public String getPractical_knowlede() {
		return practical_knowlede;
	}

	public String getRemark() {
		return Remark;
	}

	public int getSchedules_id() {
		return schedules_id;
	}

	public String getTechnical_knowledge() {
		return technical_knowledge;
	}

	public void setBody_language(String body_language) {
		this.body_language = body_language;
	}

	public void setCandidate_id(int candidate_id) {
		Candidate_id = candidate_id;
	}

	public void setCommunication_skill(String communication_skill) {
		this.communication_skill = communication_skill;
	}
	public void setConsultant_id(int consultant_id) {
		Consultant_id = consultant_id;
	}
	public void setFeedback_date(Date feedback_date) {
		this.feedback_date = feedback_date;
	}
	public void setPractical_knowlede(String practical_knowlede) {
		this.practical_knowlede = practical_knowlede;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public void setSchedules_id(int schedules_id) {
		this.schedules_id = schedules_id;
	}
	public void setTechnical_knowledge(String technical_knowledge) {
		this.technical_knowledge = technical_knowledge;
	}

	@Override
	public String toString()
	{
		return "FeedbackModel [body_language=" + body_language + ", Candidate_id=" + Candidate_id + ", feed_id="
				+ feed_id + ", communication_skill=" + communication_skill + ", Consultant_id=" + Consultant_id
				+ ", feedback_date=" + feedback_date + ", practical_knowlede=" + practical_knowlede + ", Remark="
				+ Remark + ", schedules_id=" + schedules_id + ", technical_knowledge=" + technical_knowledge + "]";
	}
	
	

}
