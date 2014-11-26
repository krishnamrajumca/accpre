/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.reports;

import static com.action.reports.BillRegister.fs;
import static com.action.reports.BillRegister.getSummery;
import static com.action.reports.BillRegister.stylePara;
import static com.action.reports.ItemConsumption.MergeCells;
import static com.action.reports.ItemConsumption.setColor;
import com.action.reports.forms.MRDForm;
import com.action.reports.forms.MRMForm;
import com.action.reports.forms.MRSaleForm;
import com.action.reports.forms.SumForm;
import com.util.DBConnection;
import com.util.DateFormate;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
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
public class ManagerReport {
    private static int gTotal=0;
    private static ArrayList<MRSaleForm> getSaleList(String from,String to){
        System.out.println("getSaleList");
        ArrayList<MRSaleForm> list=new ArrayList<MRSaleForm>();
        try{
            PreparedStatement p=DBConnection.getPrepare("select name from payment");
            ResultSet r=p.executeQuery();
            PreparedStatement ps=DBConnection.getPrepare("select other from transactions where  tdate between ? and ? and other like ?");
            while(r.next()){
                int cnt=0;
            ps.setString(1,from);
            ps.setString(2, to);
           
            ps.setString(3,"%"+r.getString(1)+"%");
            ResultSet rs=ps.executeQuery();
                System.out.println("type:"+r.getString(1));
            double amount=0.0;
            while(rs.next()){
                String type=r.getString(1);
                String tx=rs.getString(1);
                String txs[]=tx.split(";");
                String am="0.0";
                for(int i=0;i<txs.length;i++){
                    System.out.println("\ntxs:"+txs[i]+"\t");
                    if(txs[i].contains(type)){
                        
                        am=txs[i].substring(txs[i].lastIndexOf("-")+1);
                        cnt++;
                    }
                }
                amount+=Double.parseDouble(am);
                double tax=amount*0.045;
                
                double service=amount*0.05;
                double total=amount+service;
                int round=(int)total;
                //int count=rs.getInt(2);
                list.add(new MRSaleForm(type,amount, tax, service, (double)round,total, cnt));
                
            }
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally{
            return list;
        }
    }
    private static ArrayList<MRDForm> getDList(String from,String to){
        System.out.println("getDislist");
        ArrayList<MRDForm> list=new ArrayList<MRDForm>();
        try{
        PreparedStatement ps=DBConnection.getPrepare("select id,amount,discount from transactions where  tdate between ? and ? and discount>0");
            ps.setString(1,from);
            ps.setString(2, to);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                String id=rs.getString(1);
                double dis=rs.getDouble(3);
                double amt=rs.getDouble(2);
                double amount=amt+dis;
                double disp=(dis*100)/amount;
                String grant="Manager";
                String reason="Festival Offer";
                list.add(new MRDForm(id, amount, dis, disp, amt, grant, reason));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally{
        return list;
        }
    }
    private static ArrayList<MRMForm> getMenuList(String from,String to){
        System.out.println("get Menu list");
        ArrayList<MRMForm> list=new ArrayList<MRMForm>();
        try{
        PreparedStatement ps=DBConnection.getPrepare("select id from transactions where tdate between ? and ?");
            ps.setString(1,from);
            ps.setString(2, to);
            ResultSet rs=ps.executeQuery();
            gTotal=0;
            while(rs.next()){
                PreparedStatement p=DBConnection.getPrepare("select m.name,sum(tprice) amount from items i,trans tr,menus m,transactions t where i.name=iname and mid=parent and tr.trasid=? group by m.name order by m.name");
                p.setString(1, rs.getString(1));
                ResultSet r=p.executeQuery();
                while(r.next()){
                    String name=r.getString(1);
                    double price=r.getDouble(2);
                    gTotal+=price;
                    list.add(new MRMForm(name, price));
                }
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
            
            ArrayList<MRSaleForm> list = getSaleList(from,to);
            Iterator itr=list.iterator();
            while(itr.hasNext()){
                MRSaleForm m=(MRSaleForm) itr.next();
                Row row=sheet.createRow(i);
                row.createCell(0).setCellValue(m.getType());
                row.createCell(1).setCellValue(m.getAmount());
                row.createCell(2).setCellValue(m.getTax());
                row.createCell(3).setCellValue(m.getServiceTax());
                row.createCell(4).setCellValue(m.getRounded());
                row.createCell(5).setCellValue(m.getTotal());
                row.createCell(6).setCellValue(m.getNoOfBills());
                i++;
            }
            Row row=sheet.getRow(9);
                //row.getCell(0).setCellValue(m.getType());
                row.createCell(1).setCellFormula("sum(B6:B9)");
                row.createCell(2).setCellFormula("sum(C6:C9)");
                row.createCell(3).setCellFormula("sum(D6:D9)");
                row.createCell(4).setCellFormula("sum(E6:E9)");
                row.createCell(5).setCellFormula("sum(F6:F9)");
                row.createCell(6).setCellFormula("sum(G6:G9)");
                
                //_____________________________Discounted Bills___________________________________
                i=i+5;
               int j=i+1;
                row=sheet.createRow(i);
            Cell cell=row.createCell(1);
            cell=row.createCell(0);
            cell.setCellValue("Bill Id");
            row.createCell(1).setCellValue("Bill Amount");
            row.createCell(2).setCellValue("Discount");
            
            row.createCell(3).setCellValue("% Discount");
            row.createCell(4).setCellValue("Amount");
            row.createCell(4).setCellValue("Granted By");
            row.createCell(4).setCellValue("Reason");
            i++;
            ArrayList<MRDForm> list1 = getDList(from,to);
            itr=list1.iterator();
            while(itr.hasNext()){
               MRDForm mf=(MRDForm) itr.next();
               row=sheet.createRow(i);
               row.createCell(0).setCellValue(mf.getBillId());
               row.createCell(1).setCellValue(mf.getBillAmount());
               row.createCell(2).setCellValue(mf.getDiscount());
               row.createCell(3).setCellValue(mf.getDiscountP());
               row.createCell(4).setCellValue(mf.getAmount());
               row.createCell(5).setCellValue(mf.getGrantedBy());
               row.createCell(6).setCellValue(mf.getReason());
               i++;
            }
            row=sheet.createRow(i);
               row.createCell(0).setCellValue("Total");
               row.createCell(1).setCellFormula("sum(B"+j+":B"+i+")");
               row.createCell(2).setCellFormula("sum(C"+j+":C"+i+")");
               row.createCell(3).setCellFormula("(C"+i+"*100)/B"+i);
               row.createCell(4).setCellFormula("sum(E"+j+":E"+i+")");
               
            
                //_______________________________End of Discount Bills_________________________________
               //________________________________Menu section wise---------------------------
               //_________________________________End of Menu Section Wise---------------------
               
               
               
               i=i+5;
            
            j=i+1;
            
            row=sheet.createRow(i);
            cell=row.createCell(1);
            cell=row.createCell(0);
            cell.setCellValue("Tax Catagories");
            row.createCell(1).setCellValue("Amount");
            row.createCell(2).setCellValue("Discount");
            
            row.createCell(3).setCellValue("Tax");
            row.createCell(4).setCellValue("Total");
            i++;
            ArrayList<SumForm> list3=getSummery(from, to);
            itr=list3.iterator();
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
        }
        catch(Exception e){
        e.printStackTrace();}
    }
    public static void createDoc(String from,String to,String filename){
        System.out.println("Crate Document in Manager Report");
        ArrayList<MRSaleForm> list = getSaleList(from,to);
        ArrayList<MRDForm> list1 = getDList(from,to);
        ArrayList<MRMForm> list2 = getMenuList(from, to);
        XWPFDocument document = new XWPFDocument();
        XWPFTable tableTwo = document.createTable();
      
        XWPFTableRow table11 = tableTwo.getRow(0);
        XWPFTableCell cell1 = table11.getCell(0);
        //cell1.setText("DiBella Coffiee");
        stylePara(cell1,"DI BELLA COFFEE,HYDERABAD","FFFF00",true,false,"Calibri",14);
        setColor(cell1,"ABCDEF");
        MergeCells(cell1,7);
        XWPFTableRow tableTwo1 = tableTwo.createRow();
        XWPFTableCell cell = tableTwo1.getCell(0);
        stylePara(cell,"Manager Reports","FFFF00",true,false,"Calibri",12);
        setColor(cell,"ABCDEF");
        MergeCells(cell,7);
        
       tableTwo1 = tableTwo.createRow();
        cell = tableTwo1.getCell(0);
        String report="Report for "+DateFormate.myFormate(from)+", "+DateFormate.myFormate(to)+"  \n      Posted on: "+DateFormate.getToday();
        stylePara(cell,report,"000000",true,false,"Calibri",10);
        setColor(cell,"98BB3F");
        MergeCells(cell,7);
        
        tableTwo1 = tableTwo.createRow();
        cell = tableTwo1.getCell(0);
        setColor(cell,"0000FF");
        cell.setText("Type");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Amount");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Tax");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Service Tax");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Rounded Value");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("Total");
        
        cell=tableTwo1.addNewTableCell();
        setColor(cell,"0000FF");
        cell.setText("No of Bills");
        
        Iterator itr=list.iterator();
        double amount=0,tax=0,stax=0,amt=0,total=0;
        int bills=0;
        while(itr.hasNext()){
            MRSaleForm mf=(MRSaleForm) itr.next();
            tableTwo1 = tableTwo.createRow();
            tableTwo1.getCell(0).setText(mf.getType());
            tableTwo1.addNewTableCell().setText(mf.getAmount()+"");
            tableTwo1.addNewTableCell().setText(mf.getTax()+"");
            tableTwo1.addNewTableCell().setText(mf.getServiceTax()+"");
            
            tableTwo1.addNewTableCell().setText(mf.getRounded()+"");
            tableTwo1.addNewTableCell().setText(mf.getTotal()+"");
            tableTwo1.addNewTableCell().setText(mf.getNoOfBills()+"");
            amount+=mf.getAmount();tax+=mf.getTax();stax+=mf.getServiceTax();
            total+=mf.getTotal();amt+=mf.getRounded();bills+=mf.getNoOfBills();
        }
            
            tableTwo1 = tableTwo.createRow();
            tableTwo1.getCell(0).setText("Total");
            tableTwo1.addNewTableCell().setText(amount+"");
            tableTwo1.addNewTableCell().setText(tax+"");
            tableTwo1.addNewTableCell().setText(stax+"");
            tableTwo1.addNewTableCell().setText(amt+"");
            tableTwo1.addNewTableCell().setText(total+"");
            tableTwo1.addNewTableCell().setText(bills+"");
            
         //-------------------------create discount------------------------------
            document.createParagraph().createRun().addBreak();
            document.createParagraph().createRun().addBreak();
            document.createParagraph().createRun().addBreak();
           XWPFTable tableT = document.createTable();
            XWPFTableRow table = tableT.createRow();
            cell = table.getCell(0);
        
        setColor(cell,"ABCDEF");
        MergeCells(cell,7);
        cell.setText("Discount Bills Summery");
        
        table=tableT.createRow();
        
        cell = table.getCell(0);
        setColor(cell,"15CCFF");
        cell.setText("Bill Id");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Bill Amount");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Discount");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Discount %");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Amount");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Generated By");
        
        cell=table.addNewTableCell();
        setColor(cell,"15CCFF");
        cell.setText("Reason");
        itr=list1.iterator();
        amount=0;
        double dis=0;
        while(itr.hasNext()){
            
            MRDForm mf=(MRDForm) itr.next();
            table=tableT.createRow();
            table.getCell(0).setText(mf.getBillId());
            table.addNewTableCell().setText(mf.getBillAmount()+"");
            table.addNewTableCell().setText(mf.getDiscount()+"");
            table.addNewTableCell().setText(mf.getDiscountP()+"");
            table.addNewTableCell().setText(mf.getAmount()+"");
            table.addNewTableCell().setText(mf.getGrantedBy());
            table.addNewTableCell().setText(mf.getReason());
            amount+=mf.getBillAmount();dis+=mf.getDiscount();
            
        }
        table=tableT.createRow();
            table.getCell(0).setText("Total");
            table.addNewTableCell().setText(amount+"");
            table.addNewTableCell().setText(dis+"");
            table.addNewTableCell().setText((dis*100)/amount+"");
            table.addNewTableCell().setText(amount-dis+"");
            table.addNewTableCell().setText("");
            table.addNewTableCell().setText("");
            
            //--------------------------end of discount-----------------------------
            
            //------------------------------menu section wise-----------------
            
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
        
        ArrayList<SumForm> list3=getSummery(from, to);
        itr=list3.iterator();
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
            System.out.println("document created");
            }
            catch(Exception e){
                e.printStackTrace();
            }
        //--------------------------End of write to file------------------------------
    }
    public static void createNote(String from,String to,String filename){
        ArrayList<MRSaleForm> list = getSaleList(from,to);
        ArrayList<MRDForm> list1 = getDList(from,to);
        ArrayList<MRMForm> list2 = getMenuList(from, to);
        BufferedWriter bw =null;
        try{
        File file = new File(filename);
        FileWriter fw = new FileWriter(file.getAbsoluteFile());
        bw = new BufferedWriter(fw);
        String content=fs("",80)+"DI BELLA COFFEE,HYDERABAD";
        bw.write(content);
        content="";
        bw.newLine();
        bw.write(content);
        bw.newLine();
        //bw.write(fs("",60)+"for "+from+","+fs(to,40)+"posted on:"+to);
        String report="Report for "+DateFormate.myFormate(from)+", "+DateFormate.myFormate(to)+"      Posted on: "+DateFormate.getToday();
       
 
        bw.write(fs("",60)+report);
        bw.newLine();
        String line="_______________________________________________________________________________________________________________________";
        bw.write(line+line);
        bw.newLine();
        content=fs("",30)+"Sale By Payment Type";
        bw.write(content);
        bw.newLine();
        bw.write(line+line);
        bw.newLine();
        content=fs("Type",15)+" | "+fs("Amount",20)+" | "+fs("Tax",20)+" | "+fs("Service Tax",20)+" | "
                +fs("Rounded Value",20)+" | "+fs("Total",20)+fs("No of Bills",15)+" |";
        bw.write(content);
        bw.newLine();
        bw.write(line+line);
        bw.newLine();
        
        Iterator itr=list.iterator();
        double amount=0,tax=0,stax=0,round=0,total=0;
        int bills=0;
        while(itr.hasNext()){
            MRSaleForm m=(MRSaleForm) itr.next();
            amount+=m.getAmount();
            tax+=m.getTax();
            stax+=m.getServiceTax();
            round+=m.getRounded();
            total+=m.getTotal();
            bills+=m.getNoOfBills();
            content=fs(m.getType(),15)+" | "+fs(m.getAmount()+"",20)+" | "+fs(m.getTax()+"",20)+" | "
                    +fs(m.getServiceTax()+"",20)+" | "+fs(m.getRounded()+"",20)+" | "+fs(m.getTotal()+"",20)
                    +" | "+fs(m.getNoOfBills()+"",15)+" |";
            bw.write(content);
        bw.newLine();
        }
        bw.write(line+line);
        bw.newLine();
        content=fs("Total",15)+" | "+fs(amount+"",20)+" | "+fs(tax+"",20)+" | "+fs(stax+"",20)+" | "+fs(round+"",20)
                +" | "+fs(total+"",20)+" | "+fs(bills+"",15)+" |";
        bw.write(content);
        bw.newLine();
        bw.write(line+line);
        bw.newLine();
        
        
        bw.newLine();bw.newLine();
        
        bw.newLine();bw.newLine();
        bw.write(fs("Discounts Bill Summery",60));bw.newLine();
        bw.write(line+line);
        bw.newLine();bw.newLine();
        content=fs("Bill Id",20)+" | "+fs("Bill Amount",20)+" | "+fs("Discount",20)+" | "+fs("Discount%",20)+" | "
                +fs("Amount",20)+" | "+fs("Granted By",20)+" | "+fs("Reason",20);
        bw.write(content);bw.newLine();bw.write(line+line);bw.newLine();
        amount=0;
        double dis=0,t=0;
        itr=list1.iterator();
        while(itr.hasNext()){
            
            MRDForm mf=(MRDForm) itr.next();
            amount+=mf.getBillAmount();dis+=mf.getDiscount();t+=mf.getAmount();
            content=fs(mf.getBillId(),20)+" | "+fs(mf.getBillAmount()+"",20)+" | "
                    +fs(mf.getDiscount()+"",20)+" | "+fs(mf.getDiscountP()+"",20)+" | "+
                    fs(mf.getAmount()+"",20)+" | "+fs(mf.getGrantedBy(),20)
                    +" | "+fs(mf.getReason(),20);
            bw.write(content);
            bw.newLine();bw.newLine();
        }
        bw.write(line+line);bw.newLine();
        
        content=fs("Total",20)+" | "+fs(amount+"",20)+" | "+fs(dis+"",20)+" | "+fs("",20)+" | "
                +fs(t+"",20)+" | "+fs("",20)+" | "+fs("",20);
        bw.write(content);bw.newLine();bw.write(line+line);
        bw.newLine();bw.newLine();bw.newLine();
                bw.write(line+line);bw.newLine();
        
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
        }catch(Exception e){
        
        }
        finally{
        if(bw!=null){
            try {
                bw.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        }
    }
}
