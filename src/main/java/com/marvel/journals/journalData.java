package com.marvel.journals;

public class journalData {
	private String titleOfPaper, author, dept, nameOfJournal, yearOfPublication, issn, link;

	public journalData() {
		super();
	}

	public journalData(String titleOfPaper, String author, String dept, String nameOfJournal, String yearOfPublication,
			String issn, String link) {
		super();
		this.titleOfPaper = titleOfPaper;
		this.author = author;
		this.dept = dept;
		this.nameOfJournal = nameOfJournal;
		this.yearOfPublication = yearOfPublication;
		this.issn = issn;
		this.link = link;
	}

	public String getTitleOfPaper() {
		return titleOfPaper;
	}

	public void setTitleOfPaper(String titleOfPaper) {
		this.titleOfPaper = titleOfPaper;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getNameOfJournal() {
		return nameOfJournal;
	}

	public void setNameOfJournal(String nameOfJournal) {
		this.nameOfJournal = nameOfJournal;
	}

	public String getYearOfPublication() {
		return yearOfPublication;
	}

	public void setYearOfPublication(String yearOfPublication) {
		this.yearOfPublication = yearOfPublication;
	}

	public String getIssn() {
		return issn;
	}

	public void setIssn(String issn) {
		this.issn = issn;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

}
