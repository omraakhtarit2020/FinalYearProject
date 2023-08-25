package com.marvel.collaboration;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import ProjMyDetails.myDetailsDaw;

public class collabDaw {

	private String dbDriver = "com.mysql.cj.jdbc.Driver";

	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		Connection con = null;

		Properties properties = new Properties();
		try (InputStream inputStream = myDetailsDaw.class.getClassLoader()
				.getResourceAsStream("configsetting.properties")) {
			if (inputStream != null) {
				properties.load(inputStream);
				String dbUrl = properties.getProperty("dbUrl");
				String dbUname = properties.getProperty("dbUname");
				String dbPassword = properties.getProperty("dbPassword");
				con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
				// Now you can access properties using properties.getProperty("key")
			} else {
				System.out.println("Unable to locate the properties file.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public List<collabData> getAllInfo() {

		List<collabData> collabData = new ArrayList<collabData>();
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "select * from collaboration";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				collabData pd = new collabData();
				pd.setCollabactivity(rs.getString("collabactivity"));
				pd.setCollabagency(rs.getString("collabagency"));
				pd.setCollabparticipant(rs.getString("collabparticipant"));
				pd.setCollabyear(rs.getString("collabyear"));
				pd.setCollabduration(rs.getString("collabduration"));
				pd.setCollablink(rs.getString("collablink"));
				collabData.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return collabData;
	}

	public String insert(collabData collData) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "insert into collaboration values(?,?,?,?,?,?)";
		// String Year = "";
		String collabactivity = collData.getCollabactivity();
		String collabagency = collData.getCollabagency();
		String collabparticipant = collData.getCollabparticipant();
		String collabyear = collData.getCollabyear();
		String collabduration = collData.getCollabduration();
		String collablink = collData.getCollablink();
//		int year = Integer.parseInt(yearOfpublication.substring(0, 4));
//		int month = Integer.parseInt(yearOfpublication.substring(5, 7));
//		if (month > 6) {
//			Year = Integer.toString(year) + "-" + Integer.toString(year + 1);
//		} else {
//			Year = Integer.toString(year - 1) + "-" + Integer.toString(year);
//		}
		PreparedStatement ps;
		try {
//			ps = con.prepareStatement("select * from collaboration where link ='" + link + "'");
//			ResultSet rs = ps.executeQuery();
//			if (rs.next()) {
//				result = "";
//				return result;
//			}
			ps = con.prepareStatement(sql);
			ps.setString(1, collabactivity);
			ps.setString(2, collabagency);
			ps.setString(3, collabparticipant);
			ps.setString(4, collabyear);
			ps.setString(5, collabduration);
			ps.setString(6, collablink);
			ps.executeUpdate();
			System.out.println(sql);
			System.out.println(ps);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not entered";
		}

		return result;
	}

	public void delete(String cname) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from collaboration where collabactivity=?");
			ps.setString(1, cname);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

		return;
	}

	public String update(collabData collData, collabData collDataPrev) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data updated successfully";
		String sql = "update collaboration set collabactivity=?, collabagency=?, collabparticipant=?, collabyear=?, collabduration=?, collablink=? where collabactivity= '"
				+ collDataPrev.getCollabactivity() + "' and collabagency= '" + collDataPrev.getCollabagency() + "' and collabparticipant= '"
				+ collDataPrev.getCollabparticipant() + "' and collabyear= '" + collDataPrev.getCollabyear()
				+ "' and collabduration= '" + collDataPrev.getCollabduration() +"' and collablink= '"
				+ collDataPrev.getCollablink() + "'";
		// String Year = "";
		String collabactivity = collData.getCollabactivity();
		String collabagency = collData.getCollabagency();
		String collabparticipant = collData.getCollabparticipant();
		String collabyear = collData.getCollabyear();
		String collabduration = collData.getCollabduration();
		String collablink = collData.getCollablink();
//		int year = Integer.parseInt(yearOfpublication.substring(0, 4));
//		int month = Integer.parseInt(yearOfpublication.substring(5, 7));
//		if (month > 6) {
//			Year = Integer.toString(year) + "-" + Integer.toString(year + 1);
//		} else {
//			Year = Integer.toString(year - 1) + "-" + Integer.toString(year);
//		}

		PreparedStatement ps;
		try {
			if (!collablink.equals(collDataPrev.getCollablink())) {
				System.out.println("1");
				ps = con.prepareStatement("select * from collaboration where link ='" + collablink + "'");
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					result = "";
					return result;
				}
			}

			ps = con.prepareStatement(sql);
			ps.setString(1, collabactivity);
			ps.setString(2, collabagency);
			ps.setString(3, collabparticipant);
			ps.setString(4, collabyear);
			ps.setString(5, collabduration);
			ps.setString(6, collablink);
			ps.executeUpdate();
			System.out.println(sql);
			System.out.println(ps);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not updated";
		}

		return result;
	}

}