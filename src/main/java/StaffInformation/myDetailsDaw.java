package StaffInformation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//import StaffInformation.MyDetailsData;

public class myDetailsDaw {
	
	private String dbUrl = "jdbc:mysql://localhost:3306/finalyearproject";
	private String dbUname = "root";
	private String dbPassword = "Sayak@2001";
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
	
	
	
	public Connection getConnection()
	{
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	
	public String insert(MyDetailsData myDetailsData)
	{
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "insert into mydetails values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement ps;
		try {
		ps = con.prepareStatement(sql);
		ps.setString(1, myDetailsData.getfName());		
		ps.setString(2, myDetailsData.getmName());
		ps.setString(3, myDetailsData.getlName());
		ps.setString(4, myDetailsData.getuName());
		ps.setString(5, myDetailsData.getDesignation());
		ps.setString(6, myDetailsData.getSubject());
		ps.setString(7, myDetailsData.getHighestQualification());
		ps.setString(8, myDetailsData.getAnyOther());
		ps.setString(9, myDetailsData.getTeachingExp());
		ps.setString(10, myDetailsData.getTeachingMethods());
		ps.setString(11, myDetailsData.getTechnologyUses());
		ps.setString(12, myDetailsData.getSmd());
		ps.setString(13, myDetailsData.getCeqt());
		
		
		ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not entered";
		}
		return result;
	}

}