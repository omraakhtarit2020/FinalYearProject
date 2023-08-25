package com.marvel.extension;

public class extensionData {
	private String extensionActivity, extensionAgency, extensionScheme, extensionYear, extensionNoStudent;

	public extensionData() {
		super();
	}

	public extensionData(String extensionActivity, String extensionAgency, String extensionScheme, String extensionYear,
			String extensionNoStudent) {
		super();
		this.extensionActivity = extensionActivity;
		this.extensionAgency = extensionAgency;
		this.extensionScheme = extensionScheme;
		this.extensionYear = extensionYear;
		this.extensionNoStudent = extensionNoStudent;
	}

	public String getExtensionActivity() {
		return extensionActivity;
	}

	public void setExtensionActivity(String extensionActivity) {
		this.extensionActivity = extensionActivity;
	}

	public String getExtensionAgency() {
		return extensionAgency;
	}

	public void setExtensionAgency(String extensionAgency) {
		this.extensionAgency = extensionAgency;
	}

	public String getExtensionScheme() {
		return extensionScheme;
	}

	public void setExtensionScheme(String extensionScheme) {
		this.extensionScheme = extensionScheme;
	}

	public String getExtensionYear() {
		return extensionYear;
	}

	public void setExtensionYear(String extensionYear) {
		this.extensionYear = extensionYear;
	}

	public String getExtensionNoStudent() {
		return extensionNoStudent;
	}

	public void setExtensionNoStudent(String extensionNoStudent) {
		this.extensionNoStudent = extensionNoStudent;
	}

}
