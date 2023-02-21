package StaffInformation;

public class MyDetailsData {
	private String fName,mName,lName,uName,designation,subject,highestQualification,anyOther,teachingExp,teachingMethods,technologyUses,smd,ceqt;
	
	public MyDetailsData() {
		super();
	}
	
	public MyDetailsData(String fName,String mName,String lName,String uName,String designation,String subject,String highestQualification,String anyOther,String teachingExp,String teachingMethods,String technologyUses,String smd,String ceqt ) {
		super();
		this.fName=fName;
		this.mName=mName;
		this.lName=lName;
		this.uName=uName;
		this.designation=designation;
		this.subject=subject;
		this.highestQualification=highestQualification;
		this.anyOther=anyOther;
		this.teachingExp=teachingExp;
		this.teachingMethods=teachingMethods;
		this.technologyUses=technologyUses;
		this.smd=smd;
		this.ceqt=ceqt;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}
	
	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getHighestQualification() {
		return highestQualification;
	}

	public void setHighestQualification(String highestQualification) {
		this.highestQualification = highestQualification;
	}

	public String getAnyOther() {
		return anyOther;
	}

	public void setAnyOther(String anyOther) {
		this.anyOther = anyOther;
	}

	public String getTeachingExp() {
		return teachingExp;
	}

	public void setTeachingExp(String teachingExp) {
		this.teachingExp = teachingExp;
	}

	public String getTeachingMethods() {
		return teachingMethods;
	}

	public void setTeachingMethods(String teachingMethods) {
		this.teachingMethods = teachingMethods;
	}

	public String getTechnologyUses() {
		return technologyUses;
	}

	public void setTechnologyUses(String technologyUses) {
		this.technologyUses = technologyUses;
	}

	public String getSmd() {
		return smd;
	}

	public void setSmd(String smd) {
		this.smd = smd;
	}

	public String getCeqt() {
		return ceqt;
	}

	public void setCeqt(String ceqt) {
		this.ceqt = ceqt;
	}
	
}
