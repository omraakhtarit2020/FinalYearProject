package com.marvel.journals;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class programServlet
 */
@WebServlet("/journalServlet")
public class journalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public journalServlet() {
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
		String titleOfPaper = request.getParameter("titleOfPaper");
		String author = request.getParameter("author");
		String dept = request.getParameter("dept");
		String nameOfJournal = request.getParameter("nameOfJournal");
		String yearOfPublication = request.getParameter("yearOfPublication");
		String issn = request.getParameter("issn");
		String link = request.getParameter("link");

		System.out.println(titleOfPaper + ' ' + author + ' ' + dept + ' ' + nameOfJournal + ' ' + yearOfPublication
				+ ' ' + issn + ' ' + link);
		journalData jourData = new journalData(titleOfPaper, author, dept, nameOfJournal, yearOfPublication, issn,
				link);
		journalsDaw jourDaw = new journalsDaw();
		String result = jourDaw.insert(jourData);
		String message = "";
		if (result == "Data entered successfully") {
			System.out.print("Success");
			message = "";
			request.setAttribute("message", message);
			request.getRequestDispatcher("journals.jsp").forward(request, response);
		} else if (result == "") {
			System.out.print("Error");
			message = "Duplicate Value Not Allowed";
			request.setAttribute("message", message);
			request.getRequestDispatcher("journals.jsp").forward(request, response);
		}

	}

}
