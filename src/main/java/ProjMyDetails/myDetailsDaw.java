package ProjMyDetails;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.io.*;
import java.util.*;


public class myDetailsDaw {
	
private String dbDriver = "com.mysql.cj.jdbc.Driver";

	public void loadDriver(String dbDriver)
	{
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	public Connection getConnection(){
		Object filePath = "C:\\Users\\DIBYENDU\\eclipse-workspace\\Proj2\\Configuration\\configsetting.properties";
		Connection con = null;
		final Properties props = new Properties();
		try {
			props.load(new FileInputStream((String) filePath));
			String dbUrl=props.getProperty("dbUrl");
			String dbUname=props.getProperty("dbUname");
			String dbPassword=props.getProperty("dbPassword");
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public MyDetailsData getAllInfo(String user) {
		
		loadDriver(dbDriver);
		Connection con = getConnection();

		String sql = "select * from mydetails where uname = '"+user+"'";
		PreparedStatement ps;
		MyDetailsData mtd = new MyDetailsData();
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				mtd.setfName(rs.getString("fName"));
				if(rs.getString("mName")==null) {
					mtd.setmName("");
				}else {
					mtd.setmName(rs.getString("mName"));
				}
				mtd.setlName(rs.getString("lName"));
				//mtd.setuName(rs.getString("uName"));
				mtd.setTcsionId(rs.getString("tcsionId"));
				mtd.setDesignation(rs.getString("designation"));
				mtd.setSubject(rs.getString("subjects"));
				mtd.setHighestQualification(rs.getString("highestQualification"));
				mtd.setAnyOther(rs.getString("anyOther"));
				mtd.setTeachingExp(rs.getString("teachingExp"));
				mtd.setTeachingMethods(rs.getString("teachingMethods"));
				mtd.setTechnologyUses(rs.getString("technologyUses"));
				mtd.setSmd(rs.getString("smd"));
				mtd.setCeqt(rs.getString("ceqt"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return mtd;
	}


	
	
	public String insert(MyDetailsData myDetailsData)
	{
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "insert into mydetails values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement ps;
		try {
		ps = con.prepareStatement(sql);
		ps.setString(1, myDetailsData.getfName());		
		ps.setString(2, myDetailsData.getmName());
		ps.setString(3, myDetailsData.getlName());
		ps.setString(5, myDetailsData.getuName());
		ps.setString(4, myDetailsData.getTcsionId());
		ps.setString(6, myDetailsData.getDesignation());
		ps.setString(7, myDetailsData.getSubject());
		ps.setString(8, myDetailsData.getHighestQualification());
		ps.setString(9, myDetailsData.getAnyOther());
		ps.setString(10, myDetailsData.getTeachingExp());
		ps.setString(11, myDetailsData.getTeachingMethods());
		ps.setString(12, myDetailsData.getTechnologyUses());
		ps.setString(13, myDetailsData.getSmd());
		ps.setString(14, myDetailsData.getCeqt());
		
		
		ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not entered";
		}
		return result;
	}
	
	public int update(MyDetailsData myDetailsData,String user) {
		int status = 0;
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "update mydetails set fName=?,mName=?,lName=?,tcsionId=?,designation=?,subjects=?,highestQualification=?,anyOther=?,teachingExp=?,teachingMethods=?,technologyUses=?,smd=?,ceqt=? where uname = '"+user+"'";
		PreparedStatement ps;
		try {
		ps = con.prepareStatement(sql);
		ps.setString(1, myDetailsData.getfName());		
		ps.setString(2, myDetailsData.getmName());
		ps.setString(3, myDetailsData.getlName());
		ps.setString(4, myDetailsData.getTcsionId());
		ps.setString(5, myDetailsData.getDesignation());
		ps.setString(6, myDetailsData.getSubject());
		ps.setString(7, myDetailsData.getHighestQualification());
		ps.setString(8, myDetailsData.getAnyOther());
		ps.setString(9, myDetailsData.getTeachingExp());
		ps.setString(10, myDetailsData.getTeachingMethods());
		ps.setString(11, myDetailsData.getTechnologyUses());
		ps.setString(12, myDetailsData.getSmd());
		ps.setString(13, myDetailsData.getCeqt());
		
		status = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

}
