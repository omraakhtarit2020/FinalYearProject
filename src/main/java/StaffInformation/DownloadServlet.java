package StaffInformation;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ProjMyDetails.MyDetailsData;

@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");

		String dept = (String)request.getParameter("dept");
		
		String dep="";
		int startIndex=0;
		int endIndex=0;
		if(dept.contains("(")) {
			startIndex=dept.indexOf('(')+1;
			endIndex=dept.indexOf(')');
			dep=dept.substring(startIndex,endIndex);
		} else {
			dep=dept;
		}
		
		StaffInfoDao stf = new StaffInfoDao();
		List<MyDetailsData> staffInfo = stf.getAllInfo(dept);
		
		Download newFile = new Download();
		newFile.download(staffInfo,dep);
	}
	
}
