package com.marvel.awards;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class programServlet
 */
@WebServlet("/awardServlet")
public class awardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public awardServlet() {
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
		String awardActivity = request.getParameter("awardActivity");
		String awardName = request.getParameter("awardName");
		String awardGovBody = request.getParameter("awardGovBody");
		String awardYear = request.getParameter("awardYear");

		System.out.println(awardActivity + ' ' + awardName + ' ' + awardGovBody + ' ' + awardYear);
		awardData awardData = new awardData(awardActivity, awardName, awardGovBody, awardYear);
		awardDaw awardDaw = new awardDaw();
		String result = awardDaw.insert(awardData);
		String message = "";
		if (result == "Data entered successfully") {
			System.out.print("Success");
			message = "";
			request.setAttribute("message", message);
			request.getRequestDispatcher("awards.jsp").forward(request, response);
		} else if (result == "") {
			System.out.print("Error");
			message = "Duplicate Value Not Allowed";
			request.setAttribute("message", message);
			request.getRequestDispatcher("awards.jsp").forward(request, response);
		}

	}

}
