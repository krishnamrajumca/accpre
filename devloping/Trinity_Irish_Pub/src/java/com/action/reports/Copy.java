package com.action.reports;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Copy{
public static void main(String args[]){
    FileInputStream file = null;
    try {
        String filename="D:/room.xlsx";
        file = new FileInputStream(filename);
        Workbook b = null;
        if(filename.toLowerCase().endsWith("xlsx")){
                System.out.println("----------------");
                b = new XSSFWorkbook(file);
                System.out.println("----------------");
            }else if(filename.toLowerCase().endsWith("xls")){
                b = new HSSFWorkbook(file);
                System.out.println("+++++++++++++++++++++");
            }
        
        ArrayList list=new ArrayList();
        list.add("D:/112.xlsx");
        Copy sc=new Copy();
        Workbook merge = sc.mergeExcelFiles(b,list);
        merge.removeSheetAt(4);
        b.write(new FileOutputStream("d:/113.xlsx"));
    } catch (FileNotFoundException ex) {
        Logger.getLogger(Copy.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IOException ex) {
        Logger.getLogger(Copy.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        try {
            file.close();
        } catch (IOException ex) {
            Logger.getLogger(Copy.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
public String copyFile(String f){
    FileInputStream file = null;
    try {
        System.out.println("File is:"+f);
        String filename="d:/reports/"+f;
        file = new FileInputStream(filename);
        
        
        Workbook b = null;
        if(filename.toLowerCase().endsWith("xlsx")){
                b = new XSSFWorkbook(file);
            }else if(filename.toLowerCase().endsWith("xls")){
                b = new HSSFWorkbook(file);
            }
        
        ArrayList list=new ArrayList();
        list.add("D:/reports/dump.xlsx");
        Date d=new Date();
        String da="("+d.getDate()+"-"+(d.getMonth()+1)+"-"+(d.getYear()+1900)+")";
        f="d:/reports/generated/"+f.replace(".", da+".");
        System.out.println("F:"+f);
        Workbook merge = mergeExcelFiles(b,list);
        
        b.write(new FileOutputStream(f));
    } catch (FileNotFoundException ex) {
        Logger.getLogger(Copy.class.getName()).log(Level.SEVERE, null, ex);
    } catch (IOException ex) {
        Logger.getLogger(Copy.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        try {
            file.close();
        } catch (IOException ex) {
            Logger.getLogger(Copy.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
}
public Workbook mergeExcelFiles(Workbook book, ArrayList inList) throws IOException {
    System.out.println("--");
    for (Iterator it = inList.iterator(); it.hasNext();) {
        String fn = (String) it.next();
         Workbook b=null;
         FileInputStream file = new FileInputStream(fn);
        if(fn.toLowerCase().endsWith("xlsx")){
                System.out.println("----------------");
                b = new XSSFWorkbook(file);
                System.out.println("----------------");
            }else if(fn.toLowerCase().endsWith("xls")){
                b = new HSSFWorkbook(file);
                System.out.println("+++++++++++++++++++++");
            }
        
        System.out.println("book:"+b);
        for (int i = 0; i < b.getNumberOfSheets(); i++) {
            // not entering sheet name, because of duplicated names
            Copy(book.createSheet(),b.getSheetAt(i));
            //System.out.println("");
        }
    }
    return book;
}

public static void Copy(Sheet newSheet, Sheet sheet){     
    Copy(newSheet, sheet, true);     
}     

public static void Copy(Sheet newSheet, Sheet sheet, boolean copyStyle){     
    int maxColumnNum = 0;     
    Map<Integer, CellStyle> styleMap = (copyStyle) ? new HashMap<Integer, CellStyle>() : null;     
    for (int i = sheet.getFirstRowNum(); i <= sheet.getLastRowNum(); i++) {     
        Row srcRow = sheet.getRow(i);     
        Row destRow = newSheet.createRow(i);     
        if (srcRow != null) {     
            copyRow(sheet, newSheet, srcRow, destRow, styleMap);     
            if (srcRow.getLastCellNum() > maxColumnNum) {     
                maxColumnNum = srcRow.getLastCellNum();     
            }     
        }     
    }     
    for (int i = 0; i <= maxColumnNum; i++) {     
        newSheet.setColumnWidth(i, sheet.getColumnWidth(i));     
    }     
}     

public static void copyRow(Sheet srcSheet, Sheet destSheet, Row srcRow, Row destRow, Map<Integer, CellStyle> styleMap) {     
    
  Set<CellRangeAddressWrapper> mergedRegions = new TreeSet<CellRangeAddressWrapper>();     
    destRow.setHeight(srcRow.getHeight());     
    
    int deltaRows = destRow.getRowNum()-srcRow.getRowNum();  
    
    for (int j = srcRow.getFirstCellNum(); j <= srcRow.getLastCellNum(); j++) {     
        Cell oldCell = srcRow.getCell(j);   
        Cell newCell = destRow.getCell(j);     
        if (oldCell != null) {     
            if (newCell == null) {     
                newCell = destRow.createCell(j);     
            }     
            
            copyCell(oldCell, newCell, styleMap);     
             
            CellRangeAddress mergedRegion = getMergedRegion(srcSheet, srcRow.getRowNum(), (short)oldCell.getColumnIndex());     

            if (mergedRegion != null) {   
              
              CellRangeAddress newMergedRegion = new CellRangeAddress(mergedRegion.getFirstRow()+deltaRows, mergedRegion.getLastRow()+deltaRows, mergedRegion.getFirstColumn(),  mergedRegion.getLastColumn());  
                
                CellRangeAddressWrapper wrapper = new CellRangeAddressWrapper(newMergedRegion);  
                if (isNewMergedRegion(wrapper, mergedRegions)) {  
                    mergedRegions.add(wrapper);  
                    destSheet.addMergedRegion(wrapper.range);     
                }     
            }     
        }     
    }                
}    

public static void copyCell(Cell oldCell, Cell newCell, Map<Integer, CellStyle> styleMap) {     
    if(styleMap != null) {     
        if(oldCell.getSheet().getWorkbook() == newCell.getSheet().getWorkbook()){     
            newCell.setCellStyle(oldCell.getCellStyle());     
        } else{     
            int stHashCode = oldCell.getCellStyle().hashCode();     
            CellStyle newCellStyle = styleMap.get(stHashCode);     
            if(newCellStyle == null){     
                newCellStyle = newCell.getSheet().getWorkbook().createCellStyle();     
                newCellStyle.cloneStyleFrom(oldCell.getCellStyle());     
                styleMap.put(stHashCode, newCellStyle);     
            }     
            newCell.setCellStyle(newCellStyle);     
        }     
    }     
    switch(oldCell.getCellType()) {     
        case Cell.CELL_TYPE_STRING:     
            newCell.setCellValue(oldCell.getStringCellValue());     
            break;     
      case Cell.CELL_TYPE_NUMERIC:     
            newCell.setCellValue(oldCell.getNumericCellValue());     
            break;     
        case Cell.CELL_TYPE_BLANK:     
            newCell.setCellType(Cell.CELL_TYPE_BLANK);     
            break;     
        case Cell.CELL_TYPE_BOOLEAN:     
            newCell.setCellValue(oldCell.getBooleanCellValue());     
            break;     
        case Cell.CELL_TYPE_ERROR:     
            newCell.setCellErrorValue(oldCell.getErrorCellValue());     
            break;     
        case Cell.CELL_TYPE_FORMULA:     
            newCell.setCellFormula(oldCell.getCellFormula());     
            break;     
        default:     
            break;     
    }     

}     
 
public static CellRangeAddress getMergedRegion(Sheet sheet, int rowNum, short cellNum) {     
    for (int i = 0; i < sheet.getNumMergedRegions(); i++) {   
        CellRangeAddress merged = sheet.getMergedRegion(i);     
        if (merged.isInRange(rowNum, cellNum)) {     
            return merged;     
        }     
    }     
    return null;     
}     

private static boolean isNewMergedRegion(CellRangeAddressWrapper newMergedRegion, Set<CellRangeAddressWrapper> mergedRegions) {  
  return !mergedRegions.contains(newMergedRegion);     
}     

}
class CellRangeAddressWrapper implements Comparable<CellRangeAddressWrapper> {  

public CellRangeAddress range;  
 
public CellRangeAddressWrapper(CellRangeAddress theRange) {  
      this.range = theRange;  
}  

public int compareTo(CellRangeAddressWrapper o) {  

            if (range.getFirstColumn() < o.range.getFirstColumn()  
                        && range.getFirstRow() < o.range.getFirstRow()) {  
                  return -1;  
            } else if (range.getFirstColumn() == o.range.getFirstColumn()  
                        && range.getFirstRow() == o.range.getFirstRow()) {  
                  return 0;  
            } else {  
                  return 1;  
            }  

}  

}  