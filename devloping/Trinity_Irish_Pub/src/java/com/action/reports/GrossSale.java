/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.reports;

import static com.action.reports.BillRegister.fs;
import static com.action.reports.BillRegister.stylePara;
import static com.action.reports.ItemConsumption.MergeCells;
import static com.action.reports.ItemConsumption.setColor;
import com.action.reports.forms.GrossSaleForm;
import com.util.DBConnection;
import com.util.DateFormate;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

/**
 *
 * @author krishna
 */
public class GrossSale {
    public static ArrayList<GrossSaleForm> getList(String from,String to){
        ArrayList<GrossSaleForm> list=new ArrayList<GrossSaleForm>();
        try{
        PreparedStatement ps=DBConnection.getPrepare("select sum(amount),type from transactions where  tdate between ? and ? group by type;");
            ps.setString(1,from);
            ps.setString(2, to);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                String type=rs.getString(2);
                double food=rs.getDouble(1);
                double ft=food*0.045;
                double mrp=0;
                double mrptax=0;
                double tamount=food+mrp;
                double ttax=ft+mrptax;
                double service=tamount*0.05;
                double total=tamount+service;
                int round=(int)total;
                list.add(new GrossSaleForm(type, food, ft, mrp, mrptax, tamount, ttax, service, total, (double)round));
                System.out.println(type+" "+food);
            }
        }
        catch(Exception e){}
        finally{
            return list;
        }
    }
    public static void createExcel(String from,String to,String filename){
        int i=5;
        try{
            FileInputStream file = new FileInputStream(new File(filename));
            Workbook workbook = new XSSFWorkbook(file);
            Sheet sheet = workbook.getSheetAt(0);
            Row r1=sheet.getRow(2);
            r1.getCell(0).setCellValue("Report for "+DateFormate.myFormate(from)+" to "+DateFormate.myFormate(to)+"    on:"+DateFormate.getToday());
            
            ArrayList<GrossSaleForm> list = getList(from,to);
            Iterator itr=list.iterator();
            while(itr.hasNext()){
                Row row=sheet.createRow(i);
                GrossSaleForm mbf= (GrossSaleForm) itr.next();
                row.createCell(0).setCellValue(mbf.getType());
                row.createCell(1).setCellValue(mbf.getFoodAmount());
                row.createCell(2).setCellValue(mbf.getfTax());
                row.createCell(3).setCellValue(mbf.getMRPAmount());
                row.createCell(4).setCellValue(mbf.getMrpTax());
                row.createCell(5).setCellValue(mbf.getTotalAmount());
                row.createCell(6).setCellValue(mbf.getTax());
                row.createCell(7).setCellValue(mbf.getServiceTax());
                row.createCell(8).setCellValue(mbf.getTotal());
                row.createCell(9).setCellValue(mbf.getRounedValue());
                System.out.println("Type:"+mbf.getType()+"\tFood:"+mbf.getFoodAmount());
                i++;
            }
            FileOutputStream outFile  = new FileOutputStream(new File(filename));
            workbook.write(outFile);
            outFile.close();
        }catch(Exception e){}
    }
    public static void createDoc(String from,String to,String filename){
        ArrayList<GrossSaleForm> list = getList(from,to);
        XWPFDocument document = new XWPFDocument();
        XWPFTable tableTwo = document.createTable();
        XWPFTableRow table11 = tableTwo.getRow(0);
        XWPFTableCell cell1 = table11.getCell(0);
        //cell1.setText("DiBella Coffiee");
        stylePara(cell1,"DI BELLA COFFEE,HYDERABAD","FFFF00",true,false,"Calibri",14);
        setColor(cell1,"ABCDEF");
        MergeCells(cell1,10);
        XWPFTableRow tableTwo1 = tableTwo.createRow();
        XWPFTableCell cell = tableTwo1.getCell(0);
        stylePara(cell,"Gross Sale Summery","FFFF00",true,false,"Calibri",12);
        setColor(cell,"ABCDEF");
        MergeCells(cell,10);
        
       tableTwo1 = tableTwo.createRow();
        cell = tableTwo1.getCell(0);
        String report="Report for "+DateFormate.myFormate(from)+", "+DateFormate.myFormate(to)+"  \n      Posted on: "+DateFormate.getToday();
        stylePara(cell,report,"000000",true,false,"Calibri",10);
        setColor(cell,"98BB3F");
        MergeCells(cell,10);
        
        Iterator itr=list.iterator();
        //----------------------------------------------------------------
        tableTwo1 = tableTwo.createRow();
        cell = tableTwo1.getCell(0);
        setColor(cell,"0000FF");
        cell.setText("Type");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Food Amount");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Tax");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("MRP Amount");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Tax");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Total Amount");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Tax");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Service Tax");
    
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Total");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Rounded Value");
        //-------------------------------------
        while(itr.hasNext()){
           GrossSaleForm mbf=(GrossSaleForm) itr.next();
            tableTwo1 = tableTwo.createRow();
            tableTwo1.getCell(0).setText(mbf.getType());
            tableTwo1.addNewTableCell().setText(mbf.getFoodAmount()+"");
            tableTwo1.addNewTableCell().setText(mbf.getfTax()+"");
            tableTwo1.addNewTableCell().setText(mbf.getMRPAmount()+"");
            tableTwo1.addNewTableCell().setText(mbf.getMrpTax()+"");
            tableTwo1.addNewTableCell().setText(mbf.getTotalAmount()+"");
            tableTwo1.addNewTableCell().setText(mbf.getTax()+"");
            tableTwo1.addNewTableCell().setText(mbf.getServiceTax()+"");
            tableTwo1.addNewTableCell().setText(mbf.getTotal()+"");
            tableTwo1.addNewTableCell().setText(mbf.getRounedValue()+"");
            System.out.println("gross sale:"+mbf.getType());
        }
        try{
            FileOutputStream outStream = new FileOutputStream(filename);
            document.write(outStream);
            outStream.close();
            }
            catch(Exception e){
                e.printStackTrace();
            }
    }
    public static void createNote(String from,String to,String filename){
        try{
            File file = new File(filename);
        FileWriter fw = new FileWriter(file.getAbsoluteFile());
	BufferedWriter bw = new BufferedWriter(fw);
        String content="\t\t\tDI BELLA COFFEE,HYDERABAD";
        bw.write(content);
        content="\t\t\t  Gross sale summery";
        bw.newLine();
        bw.write(content);
        bw.newLine();
        String report="Report for "+DateFormate.myFormate(from)+", "+DateFormate.myFormate(to)+"      Posted on: "+DateFormate.getToday();
       
        bw.newLine();
        bw.write(fs("",60)+report);
        bw.newLine();
        bw.write("_____________________________________________________________________________________________________");
        bw.write("_____________________________________________________________________________________________________");
        bw.newLine();
        content="Type\t\tFoodAmount\t\tTax\t\tMRP Amount\t\tTax\t\tTotal Amount\t\tTax\t\tService Tax\t\tTotal\t\tRounded Value";
        bw.write(content);
        bw.newLine();
        bw.write("_____________________________________________________________________________________________________");
        bw.write("_____________________________________________________________________________________________________");
        bw.newLine();
        ArrayList<GrossSaleForm> list = getList(from,to);
        Iterator itr=list.iterator();
        while(itr.hasNext()){
           GrossSaleForm m=(GrossSaleForm) itr.next();
           content=m.getType()+"\t\t"+m.getFoodAmount()+"\t\t"+m.getfTax()+"\t\t"+m.getMRPAmount()+"\t\t"+m.getMrpTax()+"\t\t";
           content+=m.getTotalAmount()+"\t\t"+m.getTax()+"\t\t"+m.getServiceTax()+"\t\t"+m.getTotal()+"\t\t"+m.getRounedValue();
           bw.write(content);
           bw.newLine();
           bw.write("_____________________________________________________________________________________________________");
        bw.write("_____________________________________________________________________________________________________");
        bw.newLine();
        }
        bw.close();
        }
        catch(Exception e){}
    
    }
}
