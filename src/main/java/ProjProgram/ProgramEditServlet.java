package ProjProgram;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProgramEditServlet
 */
@WebServlet("/ProgramEditServlet")
public class ProgramEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProgramEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String conductingYear = "";
		String programName = request.getParameter("programName");
		String participantsNumber = request.getParameter("participantsNumber");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String link = request.getParameter("link");
		
		String conductingYearPrev = request.getParameter("conductingYear");
		String programNamePrev = request.getParameter("programNamePrev");
		String participantsNumberPrev = request.getParameter("participantsNumberPrev");
		String startDatePrev = request.getParameter("startDatePrev");
		String endDatePrev = request.getParameter("endDatePrev");
		String linkPrev = request.getParameter("linkPrev");
		
		System.out.println(conductingYear +' '+programName+' '+participantsNumber+' '+startDate+' '+endDate+' '+link);
		System.out.println(conductingYearPrev +' '+programNamePrev+' '+participantsNumberPrev+' '+startDatePrev+' '+endDatePrev+' '+linkPrev);
		ProgramData programData=new ProgramData(conductingYear,programName,participantsNumber,startDate,endDate,link);
		ProgramData programDataPrev=new ProgramData(conductingYearPrev,programNamePrev,participantsNumberPrev,startDatePrev,endDatePrev,linkPrev);
		ProgramDaw progDaw=new ProgramDaw();
		String result=progDaw.update(programData,programDataPrev);
		String message="";
		if(result=="Data updated successfully") {
			System.out.print("Success");
			message = "";
			request.setAttribute("message", message);
	        request.getRequestDispatcher("Program.jsp").forward(request, response);
		}
		else if(result==""){
			System.out.print("Error");
			message = "Duplicate Value Not Allowed";
			request.setAttribute("message", message);
	        request.getRequestDispatcher("Program.jsp").forward(request, response);
		}
	}

}
