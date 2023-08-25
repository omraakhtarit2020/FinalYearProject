package com.marvel.publishedbooks;

public class PublishedBooksData {
	private String teacherName, bookTitle, paperTitle, titleOfProceedingsOfTheConference, publicationYear, ISBN_ISSN, sameAffilatingInstitution, publisherName;
	
	public PublishedBooksData() {
		super();
	}
		
	public PublishedBooksData(String ISBN_ISSN, String bookTitle, String paperTitle, String titleOfProceedingsOfTheConference, String publicationYear, String sameAffilatingInstitution, String publisherName, String teacherName) {
		this.ISBN_ISSN=ISBN_ISSN;
		this.bookTitle=bookTitle;
		this.paperTitle=paperTitle;
		this.titleOfProceedingsOfTheConference=titleOfProceedingsOfTheConference;
		this.publicationYear=publicationYear;
		this.sameAffilatingInstitution=sameAffilatingInstitution;
		this.publisherName=publisherName;
		this.teacherName=teacherName;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getPaperTitle() {
		return paperTitle;
	}

	public void setPaperTitle(String paperTitle) {
		this.paperTitle = paperTitle;
	}

	public String getTitleOfProceedingsOfTheConference() {
		return titleOfProceedingsOfTheConference;
	}

	public void setTitleOfProceedingsOfTheConference(String titleOfProceedingsOfTheConference) {
		this.titleOfProceedingsOfTheConference = titleOfProceedingsOfTheConference;
	}

	public String getPublicationYear() {
		return publicationYear;
	}

	public void setPublicationYear(String publicationYear) {
		this.publicationYear = publicationYear;
	}

	public String getISBN_ISSN() {
		return ISBN_ISSN;
	}

	public void setISBN_ISSN(String iSBN_ISSN) {
		ISBN_ISSN = iSBN_ISSN;
	}

	public String getSameAffilatingInstitution() {
		return sameAffilatingInstitution;
	}

	public void setSameAffilatingInstitution(String sameAffilatingInstitution) {
		this.sameAffilatingInstitution = sameAffilatingInstitution;
	}

	public String getPublisherName() {
		return publisherName;
	}

	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}
	
	
}
