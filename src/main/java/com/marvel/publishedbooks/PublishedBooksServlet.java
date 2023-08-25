package com.marvel.publishedbooks;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PublishedBooksServlet
 */
@WebServlet("/PublishedBooksServlet")
public class PublishedBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublishedBooksServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ISBN_ISSN = request.getParameter("ISBN_ISSN");
		String bookTitle = request.getParameter("bookTitle");
		String paperTitle = request.getParameter("paperTitle");
		String titlePC = request.getParameter("titlePC");
		String year = request.getParameter("year");
		String WTPAIS = request.getParameter("WTPAIS");
		String publisherName = request.getParameter("publisherName");
		String teacherName = request.getParameter("teacherName");

		System.out.println(ISBN_ISSN + ' ' + bookTitle + ' ' + paperTitle + ' ' + titlePC + ' ' + year + ' ' + WTPAIS
				+ ' ' + publisherName + ' ' + teacherName);
		PublishedBooksData booksData = new PublishedBooksData(ISBN_ISSN, bookTitle, paperTitle, titlePC, year, WTPAIS,
				publisherName, teacherName);
		PublishedBooksDaw pbd = new PublishedBooksDaw();
		String result = pbd.insert(booksData);
		String message = "";
		if (result == "Data entered successfully") {
			System.out.print("Success");
			message = "";
			request.setAttribute("message", message);
			request.getRequestDispatcher("publishBooksInput.jsp").forward(request, response);
		} else if (result == "") {
			System.out.print("Error");
			message = "Duplicate Value Not Allowed";
			request.setAttribute("message", message);
			request.getRequestDispatcher("publishBooksInput.jsp").forward(request, response);
		}
	}

}
