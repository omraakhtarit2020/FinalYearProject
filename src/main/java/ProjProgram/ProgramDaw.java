package ProjProgram;

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

public class ProgramDaw {

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
		// Object filePath =
		// "C:\\Users\\DELL\\Desktop\\FinalYearProject\\src\\main\\java\\configsetting.properties";
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

	public List<ProgramData> getAllInfo() {

		List<ProgramData> progData = new ArrayList<ProgramData>();
		loadDriver(dbDriver);
		Connection con = getConnection();

//		int year = Year.now().getValue();
//		if (duration == 0) {
//			year = 0;
//		} else {
//			year -= duration;
//		}

		String sql = "select * from program"; // where extract(year from startDate) > " + year
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ProgramData pd = new ProgramData();
				pd.setStartDate(rs.getString("startDate"));
				pd.setEndDate(rs.getString("endDate"));
				pd.setConductingYear(rs.getString("conductingYear"));
				pd.setLink(rs.getString("link"));
				pd.setParticipantsNumber(rs.getString("participantsNumber"));
				pd.setProgramName(rs.getString("programName"));
				progData.add(pd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return progData;
	}

	public String insert(ProgramData programData) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "insert into program values(?,?,?,?,?,?)";
		String conductingYear = "";
		String programName = programData.getProgramName();
		String participantsNumber = programData.getParticipantsNumber();
		String startDate = programData.getStartDate();
		String endDate = programData.getEndDate();
		String link = programData.getLink();
		int year = Integer.parseInt(startDate.substring(0, 4));
		int month = Integer.parseInt(startDate.substring(5, 7));
		if (month > 6) {
			conductingYear = Integer.toString(year) + "-" + Integer.toString(year + 1);
		} else {
			conductingYear = Integer.toString(year - 1) + "-" + Integer.toString(year);
		}

		PreparedStatement ps;
		try {
			ps = con.prepareStatement("select * from program where link ='" + link + "'");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				result = "";
				return result;
			}
			ps = con.prepareStatement(sql);
			ps.setString(1, conductingYear);
			ps.setString(2, programName);
			ps.setString(3, participantsNumber);
			ps.setString(4, startDate);
			ps.setString(5, endDate);
			ps.setString(6, link);
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

	public void delete(String pname) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from program where link=?");
			ps.setString(1, pname);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

		return;
	}

	public String update(ProgramData programData, ProgramData programDataPrev) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data updated successfully";
		String sql = "update program set conductingYear=?, programName=?, participantsNumber=?, startDate=?, endDate=?, link=? where conductingYear= '"
				+ programDataPrev.getConductingYear() + "' and programName= '" + programDataPrev.getProgramName()
				+ "' and participantsNumber= '" + programDataPrev.getParticipantsNumber() + "' and startDate= '"
				+ programDataPrev.getStartDate() + "' and endDate= '" + programDataPrev.getEndDate() + "' and link= '"
				+ programDataPrev.getLink() + "'";
		String conductingYear = "";
		String programName = programData.getProgramName();
		String participantsNumber = programData.getParticipantsNumber();
		String startDate = programData.getStartDate();
		String endDate = programData.getEndDate();
		String link = programData.getLink();
		int year = Integer.parseInt(startDate.substring(0, 4));
		int month = Integer.parseInt(startDate.substring(5, 7));
		if (month > 6) {
			conductingYear = Integer.toString(year) + "-" + Integer.toString(year + 1);
		} else {
			conductingYear = Integer.toString(year - 1) + "-" + Integer.toString(year);
		}

		PreparedStatement ps;
		try {
			if (!link.equals(programDataPrev.getLink())) {
				System.out.println("1");
				ps = con.prepareStatement("select * from program where link ='" + link + "'");
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					result = "";
					return result;
				}
			}

			ps = con.prepareStatement(sql);
			ps.setString(1, conductingYear);
			ps.setString(2, programName);
			ps.setString(3, participantsNumber);
			ps.setString(4, startDate);
			ps.setString(5, endDate);
			ps.setString(6, programData.getLink());
//			ps.setString(6, programDataPrev.getConductingYear());
//			ps.setString(7, programDataPrev.getProgramName());
//			ps.setString(8, programDataPrev.getParticipantsNumber());
//			ps.setString(9, programDataPrev.getConductingDate());		
//			ps.setString(10, programDataPrev.getLink());
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
