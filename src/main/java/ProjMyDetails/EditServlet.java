package ProjMyDetails;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = null;
			session = request.getSession(false);
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");

			String uname = (String) session.getAttribute("user");
			System.out.println(uname);

			Object filePath = "C:\\Users\\DIBYENDU\\eclipse-workspace\\Proj2\\Configuration\\configsetting.properties";
			Connection con = null;
			final Properties props = new Properties();

			props.load(new FileInputStream((String) filePath));
			String dbUrl = props.getProperty("dbUrl");
			String dbUname = props.getProperty("dbUname");
			String dbPassword = props.getProperty("dbPassword");
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);

			PreparedStatement ps = con.prepareStatement("select * from mydetails where uname='" + uname + "'");
			// ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				out.print("1");
			} else {
				out.print("0");
			}
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	public static String convert(String[] arr) {
		String str = "";
		str += arr[0];
		for (int i = 1; i < arr.length; i++) {
			str += ',';
			str += arr[i];
		}
		return str;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		String fName = request.getParameter("fName");
		String mName = request.getParameter("mName");
		String lName = request.getParameter("lName");
		String tcsionId = request.getParameter("TCSion ID");
		System.out.println(tcsionId);
		String designation = request.getParameter("designation");
		String subject = request.getParameter("subject");
		String highestQualification = request.getParameter("HQ");
		String anyOther = request.getParameter("other");
		String teachingExp = request.getParameter("tExp");
		// String teachingMethods = request.getParameter("TM");
		// String technologyUses= request.getParameter("tUsed");
		String smd = request.getParameter("SMD");
		// String ceqt = request.getParameter("CEQT");

		String[] TM = request.getParameterValues("teachingMethods");
		String teachingMethods = convert(TM);
		String[] TU = request.getParameterValues("technologyUsed");
		String technologyUses = convert(TU);
		String[] C = request.getParameterValues("contribution");
		String ceqt = convert(C);
		HttpSession session = request.getSession(false);
		String uName = (String) session.getAttribute("user");

		/*
		 * System.out.println(fName + ' ' + mName + ' ' + lName + ' ' + tcsionId + ' ' +
		 * designation + ' ' + subject + ' ' + highestQualification + ' ' + anyOther + '
		 * ' + teachingExp + ' ' + teachingMethods + ' ' + technologyUses + ' ' + smd +
		 * ' ' + ceqt + ' ' + uName);
		 */
		MyDetailsData myDetailsData = new MyDetailsData(fName, mName, lName, uName, tcsionId, designation, subject,
				highestQualification, anyOther, teachingExp, teachingMethods, technologyUses, smd, ceqt );

		myDetailsDaw mDao = new myDetailsDaw();
		int result = mDao.update(myDetailsData,uName);
//		response.getWriter().print(result);
//		HttpSession ses = request.getSession();
		if (result > 0) {
			System.out.print("Success");
//		   out.println("<script type=\"text/javascript\">");
//		   out.println("alert('Success');");
////		   out.println("location='myDetails.jsp';");
//		   out.println("</script>");

			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
//			ses.setAttribute("success", result);
//			response.sendRedirect("myDetails.jsp");
		}
	}

}
