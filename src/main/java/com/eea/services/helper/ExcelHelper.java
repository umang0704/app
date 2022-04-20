package com.eea.services.helper;

import com.eea.models.Founders;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ExcelHelper {
	public String readDataFounder(MultipartFile file) {
		try {
			XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
			XSSFSheet sheet = workbook.getSheetAt(0);

			for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
				XSSFRow row = sheet.getRow(i);
				XSSFCell fname = row.getCell(0);
				XSSFCell birth = row.getCell(1);
				XSSFCell age = row.getCell(2);
				XSSFCell city = row.getCell(3);
				XSSFCell state = row.getCell(4);
				XSSFCell about = row.getCell(5);
				String fnameStringCellValue = fname.getStringCellValue();
				Integer ageStringCellValue = (int) age.getNumericCellValue();
				Integer birthStringCellValue =(int) birth.getNumericCellValue();
				String cityStringCellValue = city.getStringCellValue();
				String stateStringCellValue = state.getStringCellValue();
				String aboutStringCellValue = about.getStringCellValue();
				Founders founders = new Founders();
				founders.setAbout(aboutStringCellValue);
				founders.setFounderName(fnameStringCellValue);
				founders.setAge(ageStringCellValue);
				founders.setCity(cityStringCellValue);
				founders.setBirthDate(
						new java.sql.Date(
			                    (long) ((birthStringCellValue - 25569) * 86400 * 1000)));
				founders.setState(stateStringCellValue);
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
//		catch (ParseException e) {
//			e.printStackTrace();
//		}

		return "Uploaded Founder Data Successfully";
	}
}