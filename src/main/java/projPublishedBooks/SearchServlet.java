package projPublishedBooks;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
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
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		String ISBN=request.getParameter("ISBN");
		PublishedBooksDaw pbd=new PublishedBooksDaw();
		PublishedBooksData pb=new PublishedBooksData();
		pb=pbd.search(ISBN);
		String result="";
		//System.out.println("1");
		if(pb!=null) {
			//System.out.println("0");
			result = pb.getBookTitle()+" "+pb.getPaperTitle()+" "+pb.getTitleOfProceedingsOfTheConference()+" "+pb.getPublicationYear()+" "+pb.getSameAffilatingInstitution()+" "+pb.getPublisherName();
		}
		//System.out.println(result);
		out.print(result);
	}

}
