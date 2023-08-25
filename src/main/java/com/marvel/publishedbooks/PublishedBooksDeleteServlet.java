package com.marvel.publishedbooks;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PublishedBooksDeleteServlet
 */
@WebServlet("/PublishedBooksDeleteServlet")
public class PublishedBooksDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishedBooksDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("1");
		String teacherName = request.getParameter("TeacherName");
		String ISBN_ISSN = request.getParameter("ISBN");
		
		PublishedBooksDaw pbd=new PublishedBooksDaw();
		pbd.delete(teacherName,ISBN_ISSN);
		
		request.getRequestDispatcher("PublishBook.jsp").forward(request, response);
	}

}
