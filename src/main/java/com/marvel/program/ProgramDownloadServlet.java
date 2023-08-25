package com.marvel.program;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * Servlet implementation class ProgramDownloadServlet
 */
@WebServlet("/ProgramDownloadServlet")
public class ProgramDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProgramDownloadServlet() {
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
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		ProgramDaw prd = new ProgramDaw();
		List<ProgramData> programInfo = prd.getAllInfo();// 5
		if (programInfo == null) {
			out.print('0');
		}

		download(programInfo);
	}

	private void download(List<ProgramData> programInfo) {
		try {
			// getting the location where the file will be saved
			// String fileName = "ProgramInfo.xlsx";

			String naacCode = "3-1-3"; // Replace with your actual NAAC code
			String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String fileName = "NAAC_" + naacCode + "_" + timeStamp + ".xlsx";

			String home = System.getProperty("user.home");
			String filePath = home + "/Downloads/" + fileName;

			// creating an instance of XSSFWorkbook class
			XSSFWorkbook workbook = new XSSFWorkbook();
			// invoking creatSheet() method and passing the name of the sheet to be created
			XSSFSheet sheet = workbook.createSheet("Program Info");
			int rowNo = 0;

			// creating the 0th row using the createRow() method
			XSSFRow rowhead = sheet.createRow((short) rowNo);
			// creating cell by using the createCell() method and setting the values to the
			// cell by using the setCellValue() method
			rowhead.createCell(0).setCellValue("Conducting Year");
			rowhead.createCell(1).setCellValue("Name of the Seminars/Workshops/Conferences");
			rowhead.createCell(2).setCellValue("Number of Participants");
			rowhead.createCell(3).setCellValue("Conducting Date");
			rowhead.createCell(4).setCellValue("Link to the activity report on the website");
			rowNo++;

			// Populating the file
			XSSFRow row;

			for (int i = 0; i < programInfo.size(); i++) {
				row = sheet.createRow((short) rowNo);
				row.createCell(0).setCellValue(programInfo.get(i).getConductingYear());
				row.createCell(1).setCellValue(programInfo.get(i).getProgramName());
				row.createCell(2).setCellValue(programInfo.get(i).getParticipantsNumber());
				row.createCell(3)
						.setCellValue(programInfo.get(i).getStartDate() + " To " + programInfo.get(i).getEndDate());
				row.createCell(4).setCellValue(programInfo.get(i).getLink());

				rowNo++;
			}

			FileOutputStream fileOut = new FileOutputStream(filePath);
			workbook.write(fileOut);
			// closing the Stream
			fileOut.close();
			// closing the workbook
			workbook.close();
			// prints the message on the console
			System.out.println("Successfull");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
