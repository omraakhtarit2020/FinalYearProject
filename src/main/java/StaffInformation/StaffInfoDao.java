package StaffInformation;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import ProjMyDetails.MyDetailsData;

public class StaffInfoDao {
	
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbDriver)
	{
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection()
	{
		Object filePath = "C:\\Users\\USER\\eclipse-workspace\\proj1\\Configuration\\configsetting.properties";
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

	public List<MyDetailsData> getAllInfo(String dep) {
		List<MyDetailsData> staffInfo = new ArrayList<MyDetailsData>();
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "select * from mydetails where subjects = '"+dep+"'";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MyDetailsData mtd = new MyDetailsData();
				mtd.setfName(rs.getString("fName"));
				if(rs.getString("mName")==null) {
					mtd.setmName("");
				}else {
					mtd.setmName(rs.getString("mName"));
				}
				mtd.setlName(rs.getString("lName"));
				mtd.setuName(rs.getString("uName"));
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
				staffInfo.add(mtd);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return staffInfo;
	}

}