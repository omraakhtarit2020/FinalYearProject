package com.marvel.collaboration;

public class collabData {
	private String collabactivity, collabagency, collabparticipant, collabyear, collabduration, collablink;

	public collabData() {
		super();
	}

	public collabData(String collabactivity, String collabagency, String collabparticipant, String collabyear, String collabduration,
			  String collablink) {
		super();
		this.collabactivity = collabactivity;
		this.collabagency = collabagency;
		this.collabparticipant = collabparticipant;
		this.collabyear = collabyear;
		this.collabduration = collabduration;
		this.collablink = collablink;
	}

	public String getCollabactivity() {
		return collabactivity;
	}

	public void setCollabactivity(String collabactivity) {
		this.collabactivity = collabactivity;
	}

	public String getCollabagency() {
		return collabagency;
	}

	public void setCollabagency(String collabagency) {
		this.collabagency = collabagency;
	}

	public String getCollabparticipant() {
		return collabparticipant;
	}

	public void setCollabparticipant(String collabparticipant) {
		this.collabparticipant = collabparticipant;
	}

	public String getCollabyear() {
		return collabyear;
	}

	public void setCollabyear(String collabyear) {
		this.collabyear = collabyear;
	}

	public String getCollabduration() {
		return collabduration;
	}

	public void setCollabduration(String collabduration) {
		this.collabduration = collabduration;
	}
	


	public String getCollablink() {
		return collablink;
	}

	public void setCollablink(String collablink) {
		this.collablink = collablink;
	}

}