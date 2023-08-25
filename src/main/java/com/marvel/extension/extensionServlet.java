package com.marvel.extension;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class programServlet
 */
@WebServlet("/extensionServlet")
public class extensionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public extensionServlet() {
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
		String extensionActivity = request.getParameter("extensionActivity");
		String extensionAgency = request.getParameter("extensionAgency");
		String extensionScheme = request.getParameter("extensionScheme");
		String extensionYear = request.getParameter("extensionYear");
		String extensionNoStudent = request.getParameter("extensionNoStudent");

		System.out.println(extensionActivity + ' ' + extensionAgency + ' ' + extensionScheme + ' ' + extensionYear + ' '
				+ extensionNoStudent);
		extensionData extData = new extensionData(extensionActivity, extensionAgency, extensionScheme, extensionYear,
				extensionNoStudent);
		extensionDaw extDaw = new extensionDaw();
		String result = extDaw.insert(extData);
		String message = "";
		if (result == "Data entered successfully") {
			System.out.print("Success");
			message = "";
			request.setAttribute("message", message);
			request.getRequestDispatcher("extension.jsp").forward(request, response);
		} else if (result == "") {
			System.out.print("Error");
			message = "Duplicate Value Not Allowed";
			request.setAttribute("message", message);
			request.getRequestDispatcher("extension.jsp").forward(request, response);
		}

	}

}
