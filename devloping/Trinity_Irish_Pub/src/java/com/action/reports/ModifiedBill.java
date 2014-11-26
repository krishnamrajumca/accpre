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
import com.action.reports.forms.ItemConsumptionForm;
import com.action.reports.forms.ModifiedBillForm;
import com.util.DBConnection;
import com.util.DateFormate;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
public class ModifiedBill {
    static int amount=0,mamt=0,dif=0;
    private static ArrayList<ModifiedBillForm> getList(String from,String to){
        ArrayList<ModifiedBillForm> list=new ArrayList<ModifiedBillForm>();
        try{
        PreparedStatement ps=DBConnection.getPrepare("select *from transactions where tdate between ? and ?");
            ps.setString(1,from);
            ps.setString(2, to);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                String id=rs.getString(1);
                int amt=rs.getInt(3);
            int modamt=rs.getInt(3)-rs.getInt(5);
            int diff=rs.getInt(5);
             String time=rs.getString(4);
                //System.out.println(id+"\t"+amt+"\t"+modamt+"\t"+time);
             list.add(new ModifiedBillForm(id, amt, modamt, diff, time, "Manager"));
             amount+=amt;mamt+=modamt;dif+=diff;
            }
        }catch(Exception e){}
        finally{
        return list;
        }
    
    }
    public static void setModified(String from,String to,String filename){
        try {
            int i=4;
            FileInputStream file = new FileInputStream(new File(filename));
            Workbook workbook = new XSSFWorkbook(file);
            Sheet sheet = workbook.getSheetAt(0);
            Row r1=sheet.getRow(2);
            r1.getCell(0).setCellValue("Report for "+DateFormate.myFormate(from)+" to "+DateFormate.myFormate(to)+"    on:"+DateFormate.getToday());
            
            ArrayList<ModifiedBillForm> list = getList(from,to);
            Iterator itr=list.iterator();
            while(itr.hasNext()){
                Row row=sheet.createRow(i);
                ModifiedBillForm mbf=(ModifiedBillForm) itr.next();
                row.createCell(0).setCellValue(mbf.getId());
                row.createCell(1).setCellValue(mbf.getAmount());
                row.createCell(2).setCellValue(mbf.getModAmount());
                row.createCell(3).setCellValue(mbf.getDiff());
                row.createCell(4).setCellValue(mbf.getTime());
                row.createCell(5).setCellValue(mbf.getOperator());
                i++;
            }
            Row row=sheet.createRow(i);
                row.createCell(1).setCellValue(amount);
                row.createCell(2).setCellValue(mamt);
                row.createCell(3).setCellValue(dif);
            FileOutputStream outFile  = new FileOutputStream(new File(filename));
            workbook.write(outFile);
            outFile.close();
        } catch (Exception ex) {
            Logger.getLogger(ModifiedBill.class.getName()).log(Level.SEVERE, null, ex);
        }
             
    }
    public static void createDoc(String from,String to,String filename){
        System.out.println("File:"+filename);
        ArrayList<ModifiedBillForm> list = getList(from, to);
        XWPFDocument document = new XWPFDocument();
        XWPFTable tableTwo = document.createTable();
        XWPFTableRow table11 = tableTwo.getRow(0);
        XWPFTableCell cell1 = table11.getCell(0);
        //cell1.setText("DiBella Coffiee");
        stylePara(cell1,"DI BELLA COFFEE,HYDERABAD","FFFF00",true,false,"Calibri",14);
        setColor(cell1,"ABCDEF");
        MergeCells(cell1,6);
        XWPFTableRow tableTwo1 = tableTwo.createRow();
        XWPFTableCell cell = tableTwo1.getCell(0);
        stylePara(cell,"Modified Bills","FFFF00",true,false,"Calibri",12);
        setColor(cell,"ABCDEF");
        MergeCells(cell,6);
        
       tableTwo1 = tableTwo.createRow();
        cell = tableTwo1.getCell(0);
        String report="Report for "+DateFormate.myFormate(from)+", "+DateFormate.myFormate(to)+"  \n      Posted on: "+DateFormate.getToday();
        stylePara(cell,report,"000000",true,false,"Calibri",10);
        setColor(cell,"98BB3F");
        MergeCells(cell,6);
        
        Iterator itr=list.iterator();
        while(itr.hasNext()){
           ModifiedBillForm mbf=(ModifiedBillForm) itr.next();
            tableTwo1 = tableTwo.createRow();
            tableTwo1.getCell(0).setText(mbf.getId());
            tableTwo1.addNewTableCell().setText(mbf.getAmount()+"");
            tableTwo1.addNewTableCell().setText(mbf.getModAmount()+"");
            tableTwo1.addNewTableCell().setText(mbf.getDiff()+"");
            tableTwo1.addNewTableCell().setText(mbf.getTime());
            tableTwo1.addNewTableCell().setText(mbf.getOperator());
            
        }
            tableTwo1 = tableTwo.createRow();
            tableTwo1.getCell(0).setText("Total:");
            tableTwo1.addNewTableCell().setText(amount+"");
            tableTwo1.addNewTableCell().setText(mamt+"");
            tableTwo1.addNewTableCell().setText(dif+"");
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
        ArrayList<ModifiedBillForm> list = getList(from,to);
        File file = new File(filename);
        FileWriter fw = new FileWriter(file.getAbsoluteFile());
	BufferedWriter bw = new BufferedWriter(fw);
        String content="\t\t\tDI BELLA COFFEE,HYDERABAD";
        bw.write(content);
        content="\t\t\t  Item Consumption";
        bw.newLine();
        bw.write(content);
        bw.newLine();
        String report="Report for "+DateFormate.myFormate(from)+", "+DateFormate.myFormate(to)+"      Posted on: "+DateFormate.getToday();
            System.out.println("Report:"+report);
        bw.newLine();
        bw.write(report);
        bw.newLine();
        bw.write(fs("Bill id",20)+"|"+fs("Original Amount",20)+"|"+fs("Modified Amount",20)+"|"+fs("Diffrence",20)+"|"+fs("Time",20)+"|"+fs("Operator",20));
        Iterator itr=list.iterator();
        while(itr.hasNext()){
            ModifiedBillForm mbf=(ModifiedBillForm) itr.next();
            content=fs(mbf.getId(),20)+"|"+fs(mbf.getAmount()+"",20)+"|"+fs(mbf.getModAmount()+"|",20)+" "+fs(mbf.getDiff()+"",20)+"|"+fs(mbf.getTime()+"",20)+"|"+fs(mbf.getOperator(),20);
            bw.write(content);
            bw.newLine();
        }
        bw.close();
        }catch(Exception e){}
    }
}
