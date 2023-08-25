package com.marvel.program;

public class ProgramData {
	private String conductingYear,programName,participantsNumber,startDate,endDate,link;
		
	public ProgramData() {
		super();
	}
		
	public ProgramData(String conductingYear,String programName, String participantsNumber, String startDate,String endDate, String link ) {
		this.conductingYear=conductingYear;
		this.programName=programName;
		this.participantsNumber=participantsNumber;
		this.startDate=startDate;
		this.endDate=endDate;
		this.link=link;
	}

	public String getConductingYear() {
		return conductingYear;
	}

	public void setConductingYear(String conductingYear) {
		this.conductingYear = conductingYear;
	}

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}

	public String getParticipantsNumber() {
		return participantsNumber;
	}

	public void setParticipantsNumber(String participantsNumber) {
		this.participantsNumber = participantsNumber;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
}
