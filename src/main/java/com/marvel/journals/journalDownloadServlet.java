package com.marvel.journals;

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
@WebServlet("/journalDownloadServlet")
public class journalDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public journalDownloadServlet() {
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

		journalsDaw jd = new journalsDaw();
		List<journalData> journInfo = jd.getAllInfo();// 5
		if (journInfo == null) {
			out.print('0');
		}

		download(journInfo);
	}

	private void download(List<journalData> journInfo) {
		try {
			// getting the location where the file will be saved
			// String fileName = "JournalInfo.xlsx";

			String naacCode = "3-2-1"; // Replace with your actual NAAC code
			String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			String fileName = "NAAC_" + naacCode + "_" + timeStamp + ".xlsx";

			String home = System.getProperty("user.home");
			String filePath = home + "/Downloads/" + fileName;

			// creating an instance of XSSFWorkbook class
			XSSFWorkbook workbook = new XSSFWorkbook();
			// invoking creatSheet() method and passing the name of the sheet to be created
			XSSFSheet sheet = workbook.createSheet("Journals Info");
			int rowNo = 0;

			// creating the 0th row using the createRow() method
			XSSFRow rowhead = sheet.createRow((short) rowNo);
			// creating cell by using the createCell() method and setting the values to the
			// cell by using the setCellValue() method
			rowhead.createCell(0).setCellValue("Title Of the Paper");
			rowhead.createCell(1).setCellValue("Author");
			rowhead.createCell(2).setCellValue("Department");
			rowhead.createCell(3).setCellValue("Name of Journal");
			rowhead.createCell(4).setCellValue("year OF publication");
			rowhead.createCell(5).setCellValue("ISSN");
			rowhead.createCell(6).setCellValue("Link to the activity report on the website");
			rowNo++;

			// Populating the file
			XSSFRow row;

			for (int i = 0; i < journInfo.size(); i++) {
				row = sheet.createRow((short) rowNo);
				row.createCell(0).setCellValue(journInfo.get(i).getTitleOfPaper());
				row.createCell(1).setCellValue(journInfo.get(i).getAuthor());
				row.createCell(2).setCellValue(journInfo.get(i).getDept());
				row.createCell(3).setCellValue(journInfo.get(i).getNameOfJournal());
				row.createCell(4).setCellValue(journInfo.get(i).getYearOfPublication());
				row.createCell(5).setCellValue(journInfo.get(i).getIssn());
				row.createCell(6).setCellValue(journInfo.get(i).getLink());

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
