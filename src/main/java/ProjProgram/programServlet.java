package ProjProgram;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class programServlet
 */
@WebServlet("/programServlet")
public class programServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public programServlet() {
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
		String conductingYear = request.getParameter("conductingYear");
		String programName = request.getParameter("programName");
		String participantsNumber = request.getParameter("participantsNumber");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String link = request.getParameter("link");
		
		System.out.println(conductingYear +' '+programName+' '+participantsNumber+' '+startDate+' '+endDate+' '+link);
		ProgramData programData=new ProgramData(conductingYear,programName,participantsNumber,startDate,endDate,link);
		ProgramDaw progDaw=new ProgramDaw();
		String result=progDaw.insert(programData);
		String message="";
		if(result=="Data entered successfully") {
			System.out.print("Success");
			message = "";
			request.setAttribute("message", message);
	        request.getRequestDispatcher("Program.jsp").forward(request, response);
		}else if(result=="") {
			System.out.print("Error");
			message = "Duplicate Value Not Allowed";
			request.setAttribute("message", message);
	        request.getRequestDispatcher("Program.jsp").forward(request, response);
		}
		
	}

}
