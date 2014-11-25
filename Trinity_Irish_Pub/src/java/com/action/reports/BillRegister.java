/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.reports;

import static com.action.reports.ItemConsumption.MergeCells;
import static com.action.reports.ItemConsumption.setColor;
import com.action.reports.forms.BillRegisterForm;
import com.action.reports.forms.CBForm;
import com.action.reports.forms.SumForm;
import com.util.DBConnection;
import com.util.DateFormate;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

/**
 *
 * @author krishna
 */
public class BillRegister {
    public static ArrayList<SumForm> getSummery(String from,String to){
        System.out.println("in getSummery() of br");
        ArrayList<SumForm> list=new ArrayList<SumForm>();
        try{
            PreparedStatement ps=DBConnection.getPrepare("select sum(discount),sum(tax),sum(amount),type from disc where id in\n" +
                    "(select id from transactions where tdate between ? and ?) group by type");
            ps.setString(1, from);
            ps.setString(2, to);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                double amount=rs.getDouble(3);
                double tax=rs.getDouble(2);
                double dis=rs.getDouble(1);
                double total=amount+tax-dis;
                System.out.println("Tax:"+tax);
                list.add(new SumForm(rs.getString(4), amount, dis, tax, total));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public static ArrayList getList(String from,String to){
        System.out.println("in getList() of br");
        ArrayList<BillRegisterForm> list=new ArrayList<BillRegisterForm>();
        try{
        PreparedStatement ps=DBConnection.getPrepare("select *from transactions where tdate between ? and ?");
            ps.setString(1,from);
            ps.setString(2, to);
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                String billId=rs.getString(1);
                double amount=rs.getDouble(3);
                double mrp=0;
                double discount=rs.getDouble(5);
                double tax=amount*0.045;
                double serviceTax=amount*0.05;
                double grand=amount+mrp-discount+tax+serviceTax;
                int rounded=(int)grand;
                String paymentType=rs.getString(2);
                String preTime="14:30";
                String setTime="15:00";
                String operator="Manager";
                String type="--";
                list.add(new BillRegisterForm(billId, amount, mrp, discount, tax, serviceTax, (double)rounded, grand, paymentType,preTime, setTime, operator, type));
            }
        }catch(Exception e){}
        finally{
        return list;
        }
    }
    private static ArrayList<CBForm> getCBill(String from,String to){
        System.out.println("in getCBill() of br");
        ArrayList<CBForm> list =new ArrayList<CBForm>();
        try{
        
        PreparedStatement ps=DBConnection.getPrepare("select * from cancelbills where date_ between ? and ?");
            ps.setString(1,from);
            ps.setString(2, to);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                String id=rs.getString(1);
                int fa=rs.getInt(2);
                //int fa=rs.getInt(2);
                int ma=rs.getInt(3);
                int dis=rs.getInt(4);
                int t=rs.getInt(5);
                int st=rs.getInt(6);
                int tot=rs.getInt(7);
                int rv=rs.getInt(7);
                
                String pt=rs.getString(8);
                System.out.println("pt:"+pt+"Bill id:"+id);
                String ptime=rs.getString(9);
                String stime=rs.getString(10);
                String op=rs.getString(11);
                String ty=rs.getString(12);
                list.add(new CBForm(id,fa, ma, dis, t, st, rv, tot, pt, ptime, stime, op, ty));
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(BillRegister.class.getName()).log(Level.SEVERE, null, ex);
        }        finally{return list;}
        
    
    }
    public static void createExcel(String from,String to,String filename){
    try {
            int i=4;
            FileInputStream file = new FileInputStream(new File(filename));
            Workbook workbook = new XSSFWorkbook(file);
            Sheet sheet = workbook.getSheetAt(0);
            Row r1=sheet.getRow(2);
            r1.getCell(0).setCellValue("Report for "+DateFormate.myFormate(from)+" to "+DateFormate.myFormate(to)+"    on:"+DateFormate.getToday());
            ArrayList<BillRegisterForm> list = getList(from,to);
            Iterator itr=list.iterator();
            while(itr.hasNext()){
                Row row=sheet.createRow(i);
                BillRegisterForm mbf=(BillRegisterForm) itr.next();
                row.createCell(0).setCellValue(mbf.getBillId());
                row.createCell(1).setCellValue(mbf.getFoodAmount());
                row.createCell(2).setCellValue(mbf.getmRPAmount());
                row.createCell(3).setCellValue(mbf.getDiscount());
                row.createCell(4).setCellValue(mbf.getTax());
                row.createCell(5).setCellValue(mbf.getServiceTax());
                row.createCell(6).setCellValue(mbf.getRoundedValue());
                row.createCell(7).setCellValue(mbf.getGrandTotal());
                row.createCell(8).setCellValue(mbf.getPaymentType());
                row.createCell(9).setCellValue(mbf.getPreTime());
                row.createCell(10).setCellValue(mbf.getSetTime());
                row.createCell(11).setCellValue(mbf.getOperator());
                row.createCell(12).setCellValue(mbf.getType());
                i++;
            }
            Row row=sheet.createRow(i);
            row.createCell(0).setCellValue("Total");
            Cell cell=row.createCell(1);
            cell.setCellFormula("sum(B4:B"+i+")");
            cell=row.createCell(2);
            cell.setCellFormula("sum(C4:C"+i+")");
            cell=row.createCell(3);
            cell.setCellFormula("sum(D4:D"+i+")");
            cell=row.createCell(4);
            cell.setCellFormula("sum(E4:E"+i+")");
            cell=row.createCell(5);
            cell.setCellFormula("sum(F4:F"+i+")");
            cell=row.createCell(6);
            cell.setCellFormula("sum(G4:G"+i+")");
            cell=row.createCell(7);
            cell.setCellFormula("sum(H4:H"+i+")");
            i=i+5;
            row=sheet.createRow(i);
            cell=row.createCell(0);
            cell.setCellValue("Cancelled Bills");
            i++;
            row=sheet.createRow(i);
            cell=row.createCell(0);
            cell.setCellValue("Bill Id");
            row.createCell(1).setCellValue("Food Amount");
            row.createCell(2).setCellValue("MRP Amount");
            row.createCell(3).setCellValue("Discount");
            row.createCell(4).setCellValue("Tax");
            row.createCell(5).setCellValue("Service Tax");
            row.createCell(6).setCellValue("Rounded Value");
            row.createCell(7).setCellValue("Grand Total");
            row.createCell(8).setCellValue("Payment Type");
            row.createCell(9).setCellValue("Pre Time");
            row.createCell(10).setCellValue("Set Time");
            row.createCell(11).setCellValue("Operator");
            row.createCell(12).setCellValue("Type");
            i++;
            int j=i+1;
            ArrayList<CBForm> list1=getCBill(from, to);
            itr=list1.iterator();
            while(itr.hasNext()){
                CBForm c=(CBForm) itr.next();
                row=sheet.createRow(i);
                row.createCell(0).setCellValue(c.getBillid());
                row.createCell(1).setCellValue(c.getFoodAmount());
                row.createCell(2).setCellValue(c.getMrp());
                row.createCell(3).setCellValue(c.getDiscount());
                row.createCell(4).setCellValue(c.getTax());
                row.createCell(5).setCellValue(c.getServiceTax());
                row.createCell(6).setCellValue(c.getRoundValue());
                row.createCell(7).setCellValue(c.getGrandTotal());
                row.createCell(8).setCellValue(c.getPayment());
                row.createCell(9).setCellValue(c.getPtime());
                row.createCell(10).setCellValue(c.getStime());
                row.createCell(11).setCellValue(c.getOperator());
                row.createCell(12).setCellValue(c.getType());
                i++;
            }
            row=sheet.createRow(i);
            row.createCell(0).setCellValue("Total");
            row.createCell(1).setCellFormula("sum(B"+j+":B"+i+")");
            row.createCell(2).setCellFormula("sum(C"+j+":C"+i+")");
            row.createCell(3).setCellFormula("sum(D"+j+":D"+i+")");
            row.createCell(4).setCellFormula("sum(E"+j+":E"+i+")");
            row.createCell(5).setCellFormula("sum(F"+j+":F"+i+")");
            row.createCell(6).setCellFormula("sum(G"+j+":G"+i+")");
            row.createCell(7).setCellFormula("sum(H"+j+":H"+i+")");
            
            i=i+5;
            row=sheet.createRow(i);
            cell=row.createCell(0);
            cell.setCellValue("Summery");
            i++;
            j=i+1;
            row=sheet.createRow(i);
            cell=row.createCell(0);
            cell.setCellValue("Tax Catoriesag");
            row.createCell(1).setCellValue("Amount");
            row.createCell(2).setCellValue("Discount");
            
            row.createCell(3).setCellValue("Tax");
            row.createCell(4).setCellValue("Total");
            i++;
            ArrayList<SumForm> list2=getSummery(from, to);
            itr=list2.iterator();
            while(itr.hasNext()){
                SumForm c=(SumForm)itr.next();
                row=sheet.createRow(i);
                row.createCell(0).setCellValue(c.getCat());
                row.createCell(1).setCellValue(c.getAmount());
                row.createCell(2).setCellValue(c.getDiscount());
                row.createCell(3).setCellValue(c.getTax());
                row.createCell(4).setCellValue(c.getTotal());
                i++;
            }
            row=sheet.createRow(i);
            row.createCell(0).setCellValue("Total");
            row.createCell(1).setCellFormula("sum(B"+j+":B"+i+")");
            row.createCell(2).setCellFormula("sum(C"+j+":C"+i+")");
            row.createCell(3).setCellFormula("sum(D"+j+":D"+i+")");
            row.createCell(4).setCellFormula("sum(E"+j+":E"+i+")");
            
            FileOutputStream outFile  = new FileOutputStream(new File(filename));
            workbook.write(outFile);
            outFile.close();
        } catch (Exception ex) {
            
        }
    }
    public static void createDoc(String from,String to,String filename){
        ArrayList<BillRegisterForm> list = getList(from,to);
        XWPFDocument document = new XWPFDocument();
        XWPFTable tableTwo = document.createTable();
        XWPFTableRow table11 = tableTwo.getRow(0);
        XWPFTableCell cell1 = table11.getCell(0);
        stylePara(cell1,"DI BELLA COFFEE,HYDERABAD","000000",true,false,"Calibri",14);
        setColor(cell1,"98BB3F");
        MergeCells(cell1,13);
        XWPFTableRow tableTwo1 = tableTwo.createRow();
        XWPFTableCell cell = tableTwo1.getCell(0);
        stylePara(cell,"BILL REGISTER","000000",true,false,"Calibri",12);
        setColor(cell,"98BB3F");
        MergeCells(cell,13);
        
        tableTwo1 = tableTwo.createRow();
        cell = tableTwo1.getCell(0);
        String report="Report for "+DateFormate.myFormate(from)+", "+DateFormate.myFormate(to)+"  \n      Posted on: "+DateFormate.getToday();
        stylePara(cell,report,"000000",true,false,"Calibri",10);
        setColor(cell,"98BB3F");
        MergeCells(cell,13);
        Iterator itr=list.iterator();
        //----------------------------------------------------------------
        tableTwo1 = tableTwo.createRow();
        cell = tableTwo1.getCell(0);
        setColor(cell,"505851");
        
        stylePara(cell,"Bill Id","FFFFFF",false,false,"Calibri",10);
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"Food Amount","FFFFFF",false,false,"Calibri",10);
        
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"MRP Amount","FFFFFF",false,false,"Calibri",10);
        
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"Discount","FFFFFF",false,false,"Calibri",10);
        
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"Tax","FFFFFF",false,false,"Calibri",10);
        
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"Service","FFFFFF",false,false,"Calibri",10);
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"Rounded Value","FFFFFF",false,false,"Calibri",10);
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"Grand Total","FFFFFF",false,false,"Calibri",10);
        
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"Payment Type","FFFFFF",false,false,"Calibri",10);
        
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"Pre Time","FFFFFF",false,false,"Calibri",10);
        
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"Set Time","FFFFFF",false,false,"Calibri",10);
        
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"Operator","FFFFFF",false,false,"Calibri",10);
        
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"505851");
        stylePara(cell,"Type","FFFFFF",false,false,"Calibri",10);
        
        //----------------------------------------------------------------
        double fa=0,ma=0,dis=0,tax=0,st=0,gt=0;
        int rt=0;
        while(itr.hasNext()){
           BillRegisterForm mbf=(BillRegisterForm) itr.next();
           fa+=mbf.getFoodAmount();ma+=mbf.getmRPAmount();
           dis+=mbf.getDiscount();tax+=mbf.getTax();
           st+=mbf.getServiceTax();gt+=mbf.getGrandTotal();
           rt+=mbf.getRoundedValue();
            tableTwo1 = tableTwo.createRow();
            tableTwo1.getCell(0).setText(mbf.getBillId());
            tableTwo1.addNewTableCell().setText(mbf.getFoodAmount()+"");
            tableTwo1.addNewTableCell().setText(mbf.getmRPAmount()+"");
            tableTwo1.addNewTableCell().setText(mbf.getDiscount()+"");
            tableTwo1.addNewTableCell().setText(mbf.getTax()+"");
            tableTwo1.addNewTableCell().setText(mbf.getServiceTax()+"");
            tableTwo1.addNewTableCell().setText(mbf.getRoundedValue()+"");
            tableTwo1.addNewTableCell().setText(mbf.getGrandTotal()+"");
            tableTwo1.addNewTableCell().setText(mbf.getPaymentType()+"");
            tableTwo1.addNewTableCell().setText(mbf.getPreTime()+"");
            tableTwo1.addNewTableCell().setText(mbf.getSetTime()+"");
            tableTwo1.addNewTableCell().setText(mbf.getOperator()+"");
            tableTwo1.addNewTableCell().setText(mbf.getType()+"");
        }
            tableTwo1 = tableTwo.createRow();
            tableTwo1.getCell(0).setText("Total");
            tableTwo1.addNewTableCell().setText(fa+"");
            tableTwo1.addNewTableCell().setText(ma+"");
            tableTwo1.addNewTableCell().setText(dis+"");
            tableTwo1.addNewTableCell().setText(tax+"");
            tableTwo1.addNewTableCell().setText(st+"");
            tableTwo1.addNewTableCell().setText(rt+"");
            tableTwo1.addNewTableCell().setText(gt+"");
            //--------------------------------------------------------------------
            
            document.createParagraph().createRun().addBreak();
            
            document.createParagraph().createRun().addBreak();
            document.createParagraph().createRun().addBreak();
           XWPFTable tableT = document.createTable();
            XWPFTableRow table = tableT.createRow();
            cell = table.getCell(0);
        
        setColor(cell,"ABCDEF");
        MergeCells(cell,12);
        cell.setText("Canceled Bills");
        
        table=tableT.createRow();
        
        cell = table.getCell(0);
        setColor(cell,"15CCFF");
        cell.setText("Bill Id");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Food Amount");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("MRP Amount");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Discount");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Tax");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Service Tax");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Rounded Value");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Grand Total");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Payment Type");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Pre Time");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Set Time");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Operator");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Type");
        
        ArrayList<CBForm> list1=getCBill(from, to);
        itr=list1.iterator();
        int f=0,m=0,d=0,t=0,s=0,r=0,g=0;
        while(itr.hasNext()){
            CBForm c=(CBForm) itr.next();
            f+=c.getFoodAmount();m+=c.getMrp();d+=c.getDiscount();t+=c.getTax();
            s+=c.getServiceTax();r+=c.getGrandTotal();
            tableTwo1 = tableT.createRow();
            tableTwo1.getCell(0).setText(c.getBillid());
            tableTwo1.addNewTableCell().setText(c.getFoodAmount()+"");
            tableTwo1.addNewTableCell().setText(c.getMrp()+"");
            tableTwo1.addNewTableCell().setText(c.getDiscount()+"");
            tableTwo1.addNewTableCell().setText(c.getTax()+"");
            tableTwo1.addNewTableCell().setText(c.getServiceTax()+"");
            tableTwo1.addNewTableCell().setText(c.getRoundValue()+"");
            tableTwo1.addNewTableCell().setText(c.getGrandTotal()+"");
            tableTwo1.addNewTableCell().setText(c.getPayment()+"");
            tableTwo1.addNewTableCell().setText(c.getPtime()+"");
            tableTwo1.addNewTableCell().setText(c.getStime()+"");
            tableTwo1.addNewTableCell().setText(c.getOperator()+"");
            tableTwo1.addNewTableCell().setText(c.getType()+"");
        }
            tableTwo1 = tableT.createRow();
            tableTwo1.getCell(0).setText("Total");
            tableTwo1.addNewTableCell().setText(f+"");
            tableTwo1.addNewTableCell().setText(m+"");
            tableTwo1.addNewTableCell().setText(d+"");
            tableTwo1.addNewTableCell().setText(t+"");
            tableTwo1.addNewTableCell().setText(s+"");
            tableTwo1.addNewTableCell().setText(r+"");
            cell=tableTwo1.addNewTableCell();
            cell.setText(g+"");
            MergeCells(cell, 6);
            
            
            document.createParagraph().createRun().addBreak();
            
            document.createParagraph().createRun().addBreak();
            document.createParagraph().createRun().addBreak();
            
            document.createParagraph().createRun().addBreak();
            
            document.createParagraph().createRun().addBreak();
            document.createParagraph().createRun().addBreak();
            
            tableT = document.createTable();
           table = tableT.createRow();
            cell = table.getCell(0);
        
        setColor(cell,"ABCDEF");
        MergeCells(cell,5);
        cell.setText("Summery");
        
        table=tableT.createRow();
        
        cell = table.getCell(0);
        setColor(cell,"15CCFF");
        cell.setText("Tax Catagories");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Amount");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Discount");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Tax");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Grand Total");
        
        ArrayList<SumForm> list2=getSummery(from, to);
        itr=list2.iterator();
        double ga=0.0,gtax=0.0,gd=0.0,grand=0.0;
        while(itr.hasNext()){
            SumForm c=(SumForm) itr.next();
            ga+=c.getAmount();
            gtax+=c.getTax();
            gd+=c.getDiscount();
            grand+=c.getTotal();
            
            tableTwo1 = tableT.createRow();
            tableTwo1.getCell(0).setText(c.getCat());
            tableTwo1.addNewTableCell().setText(c.getAmount()+"");
            tableTwo1.addNewTableCell().setText(c.getDiscount()+"");
            tableTwo1.addNewTableCell().setText(c.getTax()+"");
            tableTwo1.addNewTableCell().setText(c.getTotal()+"");
        }
        
            tableTwo1 = tableT.createRow();
            tableTwo1.getCell(0).setText("Total");
            tableTwo1.addNewTableCell().setText(ga+"");
            tableTwo1.addNewTableCell().setText(gd+"");
            tableTwo1.addNewTableCell().setText(gtax+"");
            tableTwo1.addNewTableCell().setText(grand+"");
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
        ArrayList<BillRegisterForm> list = getList(from,to);
        File file = new File(filename);
        FileWriter fw = new FileWriter(file.getAbsoluteFile());
	BufferedWriter bw = new BufferedWriter(fw);
        String content=fs("",80)+"DI BELLA COFFEE,HYDERABAD";
        bw.write(content);
        content=fs("",85)+"BillRegister";
        bw.newLine();
        bw.write(content);
        String report="Report for "+DateFormate.myFormate(from)+", "+DateFormate.myFormate(to)+"      Posted on: "+DateFormate.getToday();
       
        bw.newLine();
        bw.write(fs("",60)+report);
        bw.newLine();
        String line="_______________________________________________________________________________________________________________________";
        bw.write(line+line);
        bw.newLine();
        content=fs("Bill Id",20)+" | "+fs("Food Amount",15)+" | "+fs("MRP Amount",15)+" | "+fs("Discount",15)+" | ";
        content+=fs("Tax",20)+" | "+fs("Service Tax",20)+" | "+fs("Rounnded Value",20)+" | "+fs("Grand Total",20)+" | ";
        content+=fs("Payment Type",15)+" | "+fs("Pre Time",8)+" | "+fs("Set Time",8)+" | "+fs("Operator",15)+" | "+fs("Type",15)+" |";
        bw.write(content);
        bw.newLine();
        bw.write(line+line);
        bw.newLine();
        Iterator itr=list.iterator();
        double fa=0,ma=0,dis=0,tax=0,st=0,gt=0;
        int rt=0;
        while(itr.hasNext()){
            BillRegisterForm mbf=(BillRegisterForm) itr.next();
            fa+=mbf.getFoodAmount();ma+=mbf.getmRPAmount();
           dis+=mbf.getDiscount();tax+=mbf.getTax();
           st+=mbf.getServiceTax();gt+=mbf.getGrandTotal();
           rt+=mbf.getRoundedValue();
            content=fs(mbf.getBillId(),20)+" | "+fs(mbf.getFoodAmount()+"",15)+" | "+fs(mbf.getmRPAmount()+"",15)+" | "+fs(mbf.getDiscount()+"",15)+" | "
                    +fs(mbf.getTax()+"",20)+" | "+fs(mbf.getServiceTax()+"",20)+" | "+fs(mbf.getRoundedValue()+"",20)+" | "
                    +fs(mbf.getGrandTotal()+"",20)+" | "+fs(mbf.getPaymentType(),15)+" | "+fs(mbf.getPreTime(),8)+" | "
                    +fs(mbf.getSetTime(),8)+" | "+fs(mbf.getOperator(),15)+" | "+fs(mbf.getType(),15)+" |";
            
            bw.write(content);
            bw.newLine();
            bw.write(line+line);
        bw.newLine();
        }
        content=fs("Total",20)+" | "+fs(fa+"",15)+" | "+fs(ma+"",15)+" | "+fs(dis+"",15)+" | "
                +fs(tax+"",20)+" | "+fs(st+"",20)+" | "+fs(rt+"",20)+" | "+fs(gt+"",20)+" |";
        bw.write(content);
            bw.newLine();
            bw.write(line+line);
            
          bw.newLine();bw.newLine();bw.newLine();bw.newLine();
          bw.write(line+line);bw.newLine();
          bw.write("Cancel Bills");bw.newLine();
          bw.write(line+line);bw.newLine();
          content=fs("Bill Id",20)+fs("Food Amount",15)+fs("MRP Amount",15)+fs("Discount",15)
                  +fs("Tax",15)+fs("Service Tax",20)+fs("Rounded Value",15)+fs("Grand Total",15)
                  +fs("Payment Type",15)+fs("Pre Time",10)+fs("Set Time",15)+fs("Operator",20)+fs("Type",15);
          bw.write(content);bw.newLine();bw.write(line+line);bw.newLine();
          ArrayList<CBForm> list2=getCBill(from, to);
          itr=list2.iterator();
          int f=0,m=0,d=0,t=0,s=0,r=0,g=0;
        while(itr.hasNext()){
            CBForm c=(CBForm) itr.next();
            f+=c.getFoodAmount();m+=c.getMrp();d+=c.getDiscount();t+=c.getTax();
            s+=c.getServiceTax();r+=c.getGrandTotal();
            content=fs(c.getBillid(),20)+fs(c.getFoodAmount()+"",15)+fs(c.getMrp()+"",15)+fs(c.getDiscount()+"",15)
                    +fs(c.getTax()+"",15)+fs(c.getServiceTax()+"",20)+fs(c.getRoundValue()+"",15)+fs(c.getGrandTotal()+"",15)
                    +fs(c.getPayment(),15)+fs(c.getPtime(),10)+fs(c.getStime(),10)+fs(c.getOperator(),20)+fs(c.getType(),15);
            bw.write(content);bw.newLine();bw.newLine();
        }
        bw.write(line+line);bw.newLine();
        content=fs("Total",20)+fs(f+"",15)+fs(m+"",15)+fs(d+"",15)+fs(t+"",15)+fs(s+"",20)+fs(r+"",15)+fs(g+"",15);
        bw.write(content);
        bw.newLine();bw.newLine();bw.write(line+line);
        
        bw.newLine();bw.newLine();
        content=fs("Tax Catagories",20)+fs("Amount",20)+fs("Discount",20)+fs("Tax",20)+fs("Total",20);
        bw.write(content);
        bw.newLine();
        bw.write(line+line);
        bw.newLine();
        ArrayList<SumForm> l=getSummery(from, to);
        itr=l.iterator();
        double tam=0.0,gta=0.0,gdis=0.0,grand=0.0;
        while(itr.hasNext()){
            SumForm sf=(SumForm)itr.next();
            double a=sf.getAmount();
            double ta=sf.getTax();
            double di=sf.getDiscount();
            double tot=a+ta+di;
            tam+=a;gta+=ta;gdis+=di;grand+=tot;
            content=fs(sf.getCat(),20)+fs(sf.getAmount()+"",20)+fs(sf.getDiscount()+"",20)+fs(sf.getTax()+"",20)+fs(sf.getTotal()+"",20);
            bw.write(content);
            bw.newLine();
        }
        bw.write(line+line);
        content=fs("Total",20)+fs(tam+"",20)+fs(gta+"",20)+fs(gdis+"",20)+fs(grand+"",20);
        bw.newLine();
        bw.write(content);
        bw.newLine();
        bw.write(line+line);
        bw.close();
        }catch(Exception e){}
    }
    public static String fs(String s,int l){
        int len=s.length();
        for(int i=0;i<l-len;i++){
            s+=" ";
        }
    return s;
    }
    public static void stylePara(XWPFTableCell cell,String Text,String color,boolean bold,boolean italic,String FontFamily,int size) {
        XWPFParagraph p1 = cell.getParagraphs().get(0);
               p1.setAlignment(ParagraphAlignment.CENTER);
                       XWPFRun r1 = p1.createRun();
                       r1.setBold(bold);
                       r1.setText(Text);
                       r1.setItalic(italic);
                       r1.setColor(color);
                       r1.setFontFamily(FontFamily);
                       r1.setFontSize(size);
                       //r1.setUnderline(UnderlinePatterns.DOT_DOT_DASH);
                       //r1.setTextPosition(100);
                       
    }
}
