package projPublishedBooks;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import ProjProgram.ProgramData;
import ProjProgram.ProgramDaw;

/**
 * Servlet implementation class PublishedBooksDownloadServlet
 */
@WebServlet("/PublishedBooksDownloadServlet")
public class PublishedBooksDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishedBooksDownloadServlet() {
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
		//System.out.println("ok");
		PublishedBooksDaw pbd = new PublishedBooksDaw();
		List<PublishedBooksData> booksInfo = pbd.getAllInfo(5);
		//System.out.println("ok");
		if(booksInfo==null) {
			//System.out.println("no");
			out.print("0");
		}
		//System.out.println("ok");
		download(booksInfo);
		//System.out.println("ok");
	}
	
	private void download(List<PublishedBooksData> booksInfo) {
		try {
		//getting the location where the file will be saved
		String fileName = "PublishedBooksInfo.xlsx";
		String home = System.getProperty("user.home");
		String filePath =home+"/Downloads/"+fileName;
		
		//creating an instance of XSSFWorkbook class  
		XSSFWorkbook workbook = new XSSFWorkbook();  
		//invoking creatSheet() method and passing the name of the sheet to be created   
		XSSFSheet sheet = workbook.createSheet("Published Books Info");
		int rowNo=0;
		
		//creating the 0th row using the createRow() method  
		XSSFRow rowhead = sheet.createRow((short)rowNo);  
		//creating cell by using the createCell() method and setting the values to the cell by using the setCellValue() method  
		rowhead.createCell(0).setCellValue("Name of The Teacher");
		rowhead.createCell(1).setCellValue("Title Of The Book/Chapter Published");
		rowhead.createCell(2).setCellValue("Title Of The Paper");  
		rowhead.createCell(3).setCellValue("Title Of The Proceedings Of The Conference");  
		rowhead.createCell(4).setCellValue("Year Of Publication");
		rowhead.createCell(5).setCellValue("ISBN/ISSN Number Of The Proceeding");
		rowhead.createCell(6).setCellValue("Whether at The Time Of Publication Affiliating Institution Was Same");
		rowhead.createCell(7).setCellValue("Name Of The Publisher");
		rowNo++;
		
		//Populating the file
		XSSFRow row;
		
		for(int i=0;i<booksInfo.size();i++)
		{
			row = sheet.createRow((short)rowNo);
			row.createCell(0).setCellValue(booksInfo.get(i).getTeacherName());
			row.createCell(1).setCellValue(booksInfo.get(i).getBookTitle());
			row.createCell(2).setCellValue(booksInfo.get(i).getPaperTitle());
			row.createCell(3).setCellValue(booksInfo.get(i).getTitleOfProceedingsOfTheConference());
			row.createCell(4).setCellValue(booksInfo.get(i).getPublicationYear());
			row.createCell(5).setCellValue(booksInfo.get(i).getISBN_ISSN());
			row.createCell(6).setCellValue(booksInfo.get(i).getSameAffilatingInstitution());
			row.createCell(7).setCellValue(booksInfo.get(i).getPublisherName());
			rowNo++;
		}
		
		FileOutputStream fileOut = new FileOutputStream(filePath);  
		workbook.write(fileOut);  
		//closing the Stream  
		fileOut.close();  
		//closing the workbook  
		workbook.close();  
		//prints the message on the console  
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
