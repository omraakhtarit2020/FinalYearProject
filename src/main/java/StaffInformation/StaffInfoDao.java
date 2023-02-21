package StaffInformation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StaffInfoDao {
	
	private String dbUrl="jdbc:mysql://localhost:3306/finalyearproject?characterEncoding=utf8";
	private String dbUname = "root";
	private String dbPassword = "Sayak@2001";
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
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	public List<MyDetailsData> getAllInfo(String dep) {
		List<MyDetailsData> u = new ArrayList<MyDetailsData>();
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
				mtd.setDesignation(rs.getString("designation"));
				mtd.setSubject(rs.getString("subjects"));
				mtd.setHighestQualification(rs.getString("highestQualification"));
				mtd.setAnyOther(rs.getString("anyOther"));
				mtd.setTeachingExp(rs.getString("teachingExp"));
				mtd.setTeachingMethods(rs.getString("teachingMethods"));
				mtd.setTechnologyUses(rs.getString("technologyUses"));
				mtd.setSmd(rs.getString("smd"));
				mtd.setCeqt(rs.getString("ceqt"));
				u.add(mtd);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

}