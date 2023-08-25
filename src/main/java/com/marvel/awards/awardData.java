package com.marvel.awards;

public class awardData {
	private String awardActivity, awardName, awardGovBody, awardYear;

	public awardData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public awardData(String awardActivity, String awardName, String awardGovBody, String awardYear) {
		super();
		this.awardActivity = awardActivity;
		this.awardName = awardName;
		this.awardGovBody = awardGovBody;
		this.awardYear = awardYear;
	}

	public String getAwardActivity() {
		return awardActivity;
	}

	public void setAwardActivity(String awardActivity) {
		this.awardActivity = awardActivity;
	}

	public String getAwardName() {
		return awardName;
	}

	public void setAwardName(String awardName) {
		this.awardName = awardName;
	}

	public String getAwardGovBody() {
		return awardGovBody;
	}

	public void setAwardGovBody(String awardGovBody) {
		this.awardGovBody = awardGovBody;
	}

	public String getAwardYear() {
		return awardYear;
	}

	public void setAwardYear(String awardYear) {
		this.awardYear = awardYear;
	}

}
