package com.oec.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public  class ExcelParseReaderUtils  {
	public static   List<List<String[]>> readXlsAndXlsx(String fileName,InputStream input) throws IOException{
		//根绝文件后缀名判断调用方法
		if(fileName.endsWith("xls")){
			return readXls(input);
		}else if(fileName.endsWith("xlsx")){
			return readXlsx(input);
		}else{
			return null;
		}
	}
	
	  public static List<List<String[]>> readXls(InputStream input) throws IOException{  
		  int cellNumStr=0;//用来记录cell个数
	    InputStream is = input;  
	    HSSFWorkbook hssfWorkbook = new HSSFWorkbook( is);   
	    //定义一个list来装多个sheet
	    List<List<String[]>>  sheets=new ArrayList<List<String[]>>();
	    // 循环工作表Sheet  
	    for(int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++){  
	      HSSFSheet hssfSheet = hssfWorkbook.getSheetAt( numSheet);  
	      System.err.println("sheet编号：       "+numSheet);
	      if(hssfSheet == null){  
	        continue;  
	      }  
	      //定义一个list集合来装sheet 0
	      List<String[]> resluts=new ArrayList<String[]>();
	      // 循环行Row   
	      int rows=hssfSheet.getLastRowNum();
	    a:  for(int rowNum = 0; rowNum <=rows ; rowNum++){  
	        HSSFRow hssfRow = hssfSheet.getRow( rowNum);  
	        // 循环列Cell    
	        int cells=hssfRow.getLastCellNum();
	        if(cells==-1){//表示当前行没有内容
	        	continue a;
	        }
	        String[] cellReslut=new String[cells];
	        for(int cellNum = 0; cellNum <= cells; cellNum++){  
	          HSSFCell hssfCell = hssfRow.getCell( cellNum);  
	          //定义个数组来装 一行数据
	          if(hssfCell!=null){
	        	  cellReslut[cellNum]=HgetValue(hssfCell);
	        	  cellNumStr++;
		          System.out.print(cellNumStr+"    " + HgetValue( hssfCell)); 
	          }
	          
	        }  
	        resluts.add(cellReslut);
	      }  
	      sheets.add(resluts);
	    }
	    return sheets;
	    }  
	    @SuppressWarnings("static-access")  
	    private static String HgetValue(HSSFCell hssfCell){  
	      if(hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN){  
	        return String.valueOf( hssfCell.getBooleanCellValue());  
	      }else if(hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC){  
	        return String.valueOf( hssfCell.getNumericCellValue());  
	      }else{  
	        return String.valueOf( hssfCell.getStringCellValue());  
	      }  
	    }  
	    
	//解析xlsx
	    public static  List<List<String[]>> readXlsx(InputStream input) throws IOException{  
	    	
	            InputStream is = input;
	           XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
	    //定义一个list来装多个sheet
	      List<List<String[]>>  sheets=new ArrayList<List<String[]>>();
	      // 循环工作表Sheet  
	      for(int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++){  
	        XSSFSheet xssfSheet = xssfWorkbook.getSheetAt( numSheet);  
	        if(xssfSheet == null){  
	          break;  
	        }  
	        //定义一个list集合来装sheet 0
	        List<String[]> resluts=new ArrayList<String[]>();
	        // 循环行Row   
	        for(int rowNum = 0; rowNum <= xssfSheet.getLastRowNum(); rowNum++ ){  
	          XSSFRow xssfRow = xssfSheet.getRow( rowNum);  
	          if(xssfRow == null){  
	            break;  
	          }  
	          // 循环列Cell    
	          int cells=xssfRow.getLastCellNum();
	          String[] cellReslut=new String[cells];
	          for(int cellNum = 0; cellNum <= cells; cellNum++){  
	            XSSFCell xssfCell = xssfRow.getCell( cellNum);  
	            if(xssfCell == null){  
	              continue;  
	            }  
	            cellReslut[cellNum]=XgetValue(xssfCell)+"";
	          }  
	          resluts.add(cellReslut);
	        }  
	        sheets.add(resluts);
	      }  
	      return sheets;
	    }  
	      
	    @SuppressWarnings("static-access")  
	    private static  String XgetValue(XSSFCell xssfCell){  
	      if(xssfCell.getCellType() == xssfCell.CELL_TYPE_BOOLEAN){  
	        return String.valueOf( xssfCell.getBooleanCellValue());  
	      }else if(xssfCell.getCellType() == xssfCell.CELL_TYPE_NUMERIC){  
	        return String.valueOf( xssfCell.getNumericCellValue());  
	      }else{  
	        return String.valueOf( xssfCell.getStringCellValue());  
	      }  
	    }  
	    //根据cell存入不同数据返回
	    private static String getCellValue(Cell cell) {
	        String cellValue = "";
	        DataFormatter formatter = new DataFormatter();
	        if (cell != null) {
	            switch (cell.getCellType()) {
	                case Cell.CELL_TYPE_NUMERIC:
	                    if (DateUtil.isCellDateFormatted(cell)) {
	                        cellValue = formatter.formatCellValue(cell);
	                    } else {
	                        double value = cell.getNumericCellValue();
	                        int intValue = (int) value;
	                        cellValue = value - intValue == 0 ? String.valueOf(intValue) : String.valueOf(value);
	                    }
	                    break;
	                case Cell.CELL_TYPE_STRING:
	                    cellValue = cell.getStringCellValue();
	                    break;
	                case Cell.CELL_TYPE_BOOLEAN:
	                    cellValue = String.valueOf(cell.getBooleanCellValue());
	                    break;
	                case Cell.CELL_TYPE_FORMULA:
	                    cellValue = String.valueOf(cell.getCellFormula());
	                    break;
	                case Cell.CELL_TYPE_BLANK:
	                    cellValue = "";
	                    break;
	                case Cell.CELL_TYPE_ERROR:
	                    cellValue = "";
	                    break;
	                default:
	                    cellValue = cell.toString().trim();
	                    break;
	            }
	        }
	        return cellValue.trim();
	    }
	    public static void main(String[] args) {
//	    	ExcelParseReaderUtils e=new ExcelParseReaderUtils();
//	    	String filePath="D:\\pdfReader\\未分的表格\\reslut\\101_12888_J_需求申请单人行集中20090223－大中小补-reslut.xls";
//				List<List<String[]>> results;
//				try {
//					results = e.readXlsAndXlsx( filePath);
//					System.out.println(results.toString());
//				} catch (IOException e1) {
//					// TODO Auto-generated catch block
//					e1.printStackTrace();
//				}
//				
		}
}
