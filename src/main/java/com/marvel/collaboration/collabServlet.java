package com.marvel.collaboration;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class collabServlet
 */
@WebServlet("/collabServlet")
public class collabServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public collabServlet() {
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
		String collabactivity = request.getParameter("collabactivity");
		String collabagency = request.getParameter("collabagency");
		String collabparticipant = request.getParameter("collabparticipant");
		String collabyear = request.getParameter("collabyear");
		String collabduration = request.getParameter("collabduration");
		String collablink = request.getParameter("collablink");

		System.out.println(collabactivity + ' ' + collabagency + ' ' + collabparticipant + ' ' + collabyear + ' ' + collabduration
				+ ' ' + collablink);
		collabData collData = new collabData(collabactivity, collabagency, collabparticipant, collabyear, collabduration, 
				collablink);
		collabDaw collDaw = new collabDaw();
		String result = collDaw.insert(collData);
		String message = "";
		if (result == "Data entered successfully") {
			System.out.print("Success");
			message = "";
			request.setAttribute("message", message);
			request.getRequestDispatcher("collaboration.jsp").forward(request, response);
		} else if (result == "") {
			System.out.print("Error");
			message = "Duplicate Value Not Allowed";
			request.setAttribute("message", message);
			request.getRequestDispatcher("collaboration.jsp").forward(request, response);
		}

	}

}