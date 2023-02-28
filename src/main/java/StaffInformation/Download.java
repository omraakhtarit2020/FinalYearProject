package StaffInformation;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import ProjMyDetails.MyDetailsData;



public class Download{
	
	public void download(List<MyDetailsData> staffInfo,String dept) {
		try {
		//getting the location where the file will be saved
		String fileName = "StaffInfo_"+dept+".xlsx";
		String home = System.getProperty("user.home");
		String filePath =home+"/Downloads/"+fileName;
		
		//creating an instance of XSSFWorkbook class  
		XSSFWorkbook workbook = new XSSFWorkbook();  
		//invoking creatSheet() method and passing the name of the sheet to be created   
		XSSFSheet sheet = workbook.createSheet(dept+" info");
		int rowNo=0;
		
		//creating the 0th row using the createRow() method  
		XSSFRow rowhead = sheet.createRow((short)rowNo);  
		//creating cell by using the createCell() method and setting the values to the cell by using the setCellValue() method  
		rowhead.createCell(0).setCellValue("Name");  
		rowhead.createCell(1).setCellValue("Designation");  
		rowhead.createCell(2).setCellValue("Subject");  
		rowhead.createCell(3).setCellValue("Highest Qualification");  
		rowhead.createCell(4).setCellValue("Any other");
		rowhead.createCell(5).setCellValue("Teaching Experience (Years)");  
		rowhead.createCell(6).setCellValue("Teaching Methods");  
		rowhead.createCell(7).setCellValue("Technology used for teaching and frequency of use");  
		rowhead.createCell(8).setCellValue("Study material developed during last 5 years (yes/no)");  
		rowhead.createCell(9).setCellValue("Contributions to enrich quality of teaching");
		rowNo++;
		
		//Populating the file
		XSSFRow row;
		String name="";
		
		for(int i=0;i<staffInfo.size();i++)
		{
			row = sheet.createRow((short)rowNo);
			if(staffInfo.get(i).getmName()=="") {
				name=staffInfo.get(i).getfName()+" "+staffInfo.get(i).getlName();
			}else {
				name=staffInfo.get(i).getfName()+" "+staffInfo.get(i).getmName()+" "+staffInfo.get(i).getlName();
			}
			row.createCell(0).setCellValue(name); 
			row.createCell(1).setCellValue(staffInfo.get(i).getDesignation());
			row.createCell(2).setCellValue(staffInfo.get(i).getSubject());
			row.createCell(3).setCellValue(staffInfo.get(i).getHighestQualification());
			row.createCell(4).setCellValue(staffInfo.get(i).getAnyOther());
			row.createCell(5).setCellValue(staffInfo.get(i).getTeachingExp());
			row.createCell(6).setCellValue(staffInfo.get(i).getTeachingMethods());
			row.createCell(7).setCellValue(staffInfo.get(i).getTechnologyUses());
			row.createCell(8).setCellValue(staffInfo.get(i).getSmd());
			row.createCell(9).setCellValue(staffInfo.get(i).getCeqt());
			rowNo++;
		}
		
		FileOutputStream fileOut = new FileOutputStream(filePath);  
		workbook.write(fileOut);  
		//closing the Stream  
		fileOut.close();  
		//closing the workbook  
		workbook.close();  
		//prints the message on the console  
		
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}
}