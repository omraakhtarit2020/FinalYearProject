package projPublishedBooks;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Year;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class PublishedBooksDaw {
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
		Object filePath = "C:\\Users\\DELL\\Desktop\\FinalYearProject\\configsetting.properties";
		Connection con = null;
		final Properties props = new Properties();
		try {
			props.load(new FileInputStream((String) filePath));
			String dbUrl = props.getProperty("dbUrl");
			String dbUname = props.getProperty("dbUname");
			String dbPassword = props.getProperty("dbPassword");
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

	public List<PublishedBooksData> getAllInfo(int duration) {

		List<PublishedBooksData> booksData = new ArrayList<PublishedBooksData>();
		loadDriver(dbDriver);
		Connection con = getConnection();

		int year = Year.now().getValue();
		if (duration == 0) {
			year = 0;
		} else {
			year -= duration;
		}

		String sql = "select * from publishedBooks,bookWriterInfo where publishedBooks.ISBN_ISSN=bookWriterInfo.ISBN_ISSN AND extract(year from publishedBooks.publicationYear) > "
				+ year + " order by publicationYear desc, publishedBooks.ISBN_ISSN asc";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				PublishedBooksData pbd = new PublishedBooksData();
				pbd.setTeacherName(rs.getString("teacherName"));
				pbd.setBookTitle(rs.getString("bookTitle"));
				pbd.setPaperTitle(rs.getString("paperTitle"));
				pbd.setTitleOfProceedingsOfTheConference(rs.getString("titleOfProceedingsOfTheConference"));
				pbd.setPublicationYear(rs.getString("publicationYear"));
				pbd.setISBN_ISSN(rs.getString("ISBN_ISSN"));
				pbd.setSameAffilatingInstitution(rs.getString("sameAffilatingInstitution"));
				pbd.setPublisherName(rs.getString("publisherName"));
				booksData.add(pbd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return booksData;
	}

	public PublishedBooksData search(String ISBN) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		PublishedBooksData pbd = new PublishedBooksData();
		String sql = "select * from publishedBooks where ISBN_ISSN =" + ISBN;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				pbd.setBookTitle(rs.getString("bookTitle"));
				pbd.setPaperTitle(rs.getString("paperTitle"));
				// System.out.println(rs.getString("paperTitle"));
				pbd.setTitleOfProceedingsOfTheConference(rs.getString("titleOfProceedingsOfTheConference"));
				pbd.setPublicationYear(rs.getString("publicationYear"));
				pbd.setISBN_ISSN(rs.getString("ISBN_ISSN"));
				pbd.setSameAffilatingInstitution(rs.getString("sameAffilatingInstitution"));
				pbd.setPublisherName(rs.getString("publisherName"));
			} else {
				pbd = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pbd;
	}

	public String insert(PublishedBooksData booksData) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully";
		String sql = "insert into publishedBooks values(?,?,?,?,?,?,?)";
		String sql1 = "insert into bookWriterInfo values(?,?)";

		String ISBN_ISSN = booksData.getISBN_ISSN();
		String bookTitle = booksData.getBookTitle();
		String paperTitle = booksData.getPaperTitle();
		String titlePC = booksData.getTitleOfProceedingsOfTheConference();
		String year = booksData.getPublicationYear();
		String WTPAIS = booksData.getSameAffilatingInstitution();
		String publisherName = booksData.getPublisherName();
		String teacherName = booksData.getTeacherName();

		PreparedStatement ps;
		try {
			ps = con.prepareStatement("select * from publishedBooks where ISBN_ISSN ='" + ISBN_ISSN + "'");
			ResultSet rs = ps.executeQuery();
			if (!rs.next()) {
				ps = con.prepareStatement(sql);
				ps.setString(1, ISBN_ISSN);
				ps.setString(2, bookTitle);
				ps.setString(3, paperTitle);
				ps.setString(4, titlePC);
				ps.setString(5, year);
				ps.setString(6, WTPAIS);
				ps.setString(7, publisherName);
				// ps.setString(8, teacherName);
				ps.executeUpdate();
				System.out.println(sql);
				System.out.println(ps);
			}

			ps = con.prepareStatement("select * from bookWriterInfo where ISBN_ISSN ='" + ISBN_ISSN
					+ "' AND teacherName ='" + teacherName + "'");
			rs = ps.executeQuery();
			if (!rs.next()) {
				ps = con.prepareStatement(sql1);
				ps.setString(1, ISBN_ISSN);
				ps.setString(2, teacherName);
				ps.executeUpdate();
				System.out.println(sql1);
				System.out.println(ps);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not entered";
		}

		return result;
	}

	public String update(PublishedBooksData booksData, PublishedBooksData booksDataPrev) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data updated successfully";
		String sql = "update publishedBooks set ISBN_ISSN='" + booksData.getISBN_ISSN() + "', bookTitle='"
				+ booksData.getBookTitle() + "', paperTitle='" + booksData.getPaperTitle()
				+ "', titleOfProceedingsOfTheConference='" + booksData.getTitleOfProceedingsOfTheConference()
				+ "', publicationYear='" + booksData.getPublicationYear() + "', sameAffilatingInstitution='"
				+ booksData.getSameAffilatingInstitution() + "', publisherName='" + booksData.getPublisherName()
				+ "' where ISBN_ISSN=?";
		String sql1 = "update bookWriterInfo set ISBN_ISSN='" + booksData.getISBN_ISSN() + "' , teacherName='"
				+ booksData.getTeacherName() + "'where ISBN_ISSN='" + booksDataPrev.getISBN_ISSN()
				+ "' and teacherName='" + booksDataPrev.getTeacherName() + "'";
		String sql2 = "insert into publishedBooks values(?,?,?,?,?,?,?)";

		PreparedStatement ps;
		try {
			if (booksData.getISBN_ISSN() == booksDataPrev.getISBN_ISSN()) {
				ps = con.prepareStatement(sql);
				ps.setString(1, booksDataPrev.getISBN_ISSN());
				ps.executeUpdate();
				System.out.println(sql);
				System.out.println(ps);
			} else {
				if (search(booksData.getISBN_ISSN()) == null) {
					ps = con.prepareStatement(sql2);
					ps.setString(1, booksData.getISBN_ISSN());
					ps.setString(2, booksData.getBookTitle());
					ps.setString(3, booksData.getPaperTitle());
					ps.setString(4, booksData.getTitleOfProceedingsOfTheConference());
					ps.setString(5, booksData.getPublicationYear());
					ps.setString(6, booksData.getSameAffilatingInstitution());
					ps.setString(7, booksData.getPublisherName());
					ps.executeUpdate();
					System.out.println(sql);
					System.out.println(ps);
				} else {
					ps = con.prepareStatement(sql);
					ps.setString(1, booksData.getISBN_ISSN());
					ps.executeUpdate();
					System.out.println(sql);
					System.out.println(ps);
				}
			}

			ps = con.prepareStatement(sql1);
			ps.executeUpdate();
			System.out.println(sql1);
			System.out.println(ps);

			ps = con.prepareStatement(
					"select * from bookWriterInfo where ISBN_ISSN='" + booksDataPrev.getISBN_ISSN() + "'");
			ResultSet rs = ps.executeQuery();
			if (!rs.next()) {
				ps = con.prepareStatement(
						"delete from publishedBooks where ISBN_ISSN='" + booksDataPrev.getISBN_ISSN() + "'");
				ps.executeUpdate();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Data not updated";
		}

		return result;
	}

	public void delete(String teacherName, String ISBN_ISSN) {
		loadDriver(dbDriver);
		Connection con = getConnection();

		PreparedStatement ps;
		try {
			ps = con.prepareStatement("delete from bookWriterInfo where ISBN_ISSN='" + ISBN_ISSN + "' and teacherName='"
					+ teacherName + "'");
			ps.executeUpdate();
			// System.out.println(ISBN_ISSN);
			// System.out.println("delete from bookWriterInfo");
			ps = con.prepareStatement("select * from bookWriterInfo where ISBN_ISSN='" + ISBN_ISSN + "'");
			ResultSet rs = ps.executeQuery();
			if (!rs.next()) {
				ps = con.prepareStatement("delete from publishedBooks where ISBN_ISSN='" + ISBN_ISSN + "'");
				ps.executeUpdate();
				// System.out.println("delete from publishedBooks");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			// result = "Data not updated";
		}
		System.out.println("1");
	}
}
