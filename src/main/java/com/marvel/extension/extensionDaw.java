package com.marvel.extension;

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

public class extensionDaw {

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

	public List<extensionData> getAllInfo() {

		List<extensionData> extData = new ArrayList<extensionData>();
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "select * from extension";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				extensionData ed = new extensionData();
				ed.setExtensionActivity(rs.getString("extensionActivity"));
				ed.setExtensionAgency(rs.getString("extensionAgency"));
				ed.setExtensionScheme(rs.getString("extensionScheme"));
				ed.setExtensionYear(rs.getString("extensionYear"));
				ed.setExtensionNoStudent(rs.getString("extensionNoStudent"));
				extData.add(ed);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return extData;
	}

	public String insert(extensionData extData) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "insert into extension values(?,?,?,?,?)";
		String extensionActivity = extData.getExtensionActivity();
		String extensionAgency = extData.getExtensionAgency();
		String extensionScheme = extData.getExtensionScheme();
		String extensionYear = extData.getExtensionYear();
		String extensionNoStudent = extData.getExtensionNoStudent();

		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, extensionActivity);
			ps.setString(2, extensionAgency);
			ps.setString(3, extensionScheme);
			ps.setString(4, extensionYear);
			ps.setString(5, extensionNoStudent);
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

	public void delete(String act) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from extension where extensionActivity=?");
			ps.setString(1, act);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

		return;
	}

}
