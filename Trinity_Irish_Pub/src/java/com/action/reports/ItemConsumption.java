/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.reports;

import static com.action.reports.BillRegister.stylePara;
import com.action.reports.forms.ItemConsumptionForm;
import com.action.reports.forms.ItemForm;
import com.util.DBConnection;
import com.util.DateFormate;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigInteger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTShd;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTcPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTVerticalJc;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STShd;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STVerticalJc;

/**
 *
 * @author krishna
 */
class ItemConsumption {
    private static int gTotal;
    private static ArrayList<ItemForm> ilst;
    private static ArrayList<ItemConsumptionForm> getItems(String from,String to){
        ArrayList<ItemConsumptionForm> list=new ArrayList<ItemConsumptionForm>();
        ArrayList<ItemForm> iList=null;
        try{
//            PreparedStatement ps=DBConnection.getPrepare("");
//            
//            ResultSet rs=ps.executeQuery();
            gTotal=0;
            //while(rs.next()){
                PreparedStatement p=DBConnection.getPrepare("select iname,m.name,sum(tprice) amount from items i,trans tr,menus m,transactions t where i.name=iname and mid=parent  and t.id in(select id from transactions where tdate between ? and ?) and t.id=tr.trasid group by iname order by m.name");
               // p.setString(1, rs.getString(1));
                p.setString(1,from);
            p.setString(2, to);
                ResultSet r=p.executeQuery();
                int total=0;
                
                String menu="";
                while(r.next()){
                    String item=r.getString(1);
                    String men=r.getString(2);
                    int amt=r.getInt(3);
                    if(!menu.equalsIgnoreCase(men)){
                        if(!menu.equalsIgnoreCase("")){
                            list.add(new ItemConsumptionForm(menu, total, iList));
                        }
                        total=0;
                        menu=men;
                        iList=new ArrayList<ItemForm>();
                    }
                    iList.add(new ItemForm(item,amt));
                    total+=amt;
                    gTotal+=amt;
                }
                list.add(new ItemConsumptionForm(menu, total, iList));
            
           // printList(list);
        }
        catch(Exception e){}
        finally{
            return list;
        }
    }
    public static void set(String from, String to, String filename) {
        try {
            int i=5;
            ArrayList<ItemConsumptionForm> list = getItems(from,to);
            
            FileInputStream file = new FileInputStream(new File(filename));
            
            Workbook workbook = new XSSFWorkbook(file);
            Sheet sheet = workbook.getSheetAt(0);
            Iterator itr=list.iterator();
            ArrayList<ItemForm> ilist=null;
            Row r1=sheet.getRow(2);
            r1.getCell(0).setCellValue("Report for "+DateFormate.myFormate(from)+" to "+DateFormate.myFormate(to)+"    on:"+DateFormate.getToday());
            
            while(itr.hasNext()){
            ItemConsumptionForm icf=(ItemConsumptionForm) itr.next();
            String menu=icf.getMenu();
            int total=icf.getTotal();
            ilist=icf.getList();
            
            Row row=sheet.createRow(i);
            CellStyle style = workbook.createCellStyle();
                    style.setFillBackgroundColor(IndexedColors.BLUE.getIndex());
                    style.setFillForegroundColor(IndexedColors.AQUA.getIndex());
                    style.setFillPattern(CellStyle.SOLID_FOREGROUND);
                    style.setAlignment(style.ALIGN_CENTER);
                    Cell cell=row.createCell(0);
                    cell.setCellValue(menu);
                    cell.setCellStyle(style);
                    sheet.addMergedRegion(new CellRangeAddress(i, i,0, 3));
                    i++;
                    
            Iterator it=ilist.iterator();
            //System.out.println("Menu:"+menu+"\tTotal:"+total);
            while(it.hasNext()){
              ItemForm itf=(ItemForm)it.next();
              String item=itf.getName();
              int amount=itf.getAmount();
              Row r=sheet.createRow(i);
              r.createCell(0).setCellValue(item);
              r.createCell(1).setCellValue(amount);
              r.createCell(2).setCellValue((double)(100*amount)/total);
              r.createCell(3).setCellValue((double)(100*amount)/gTotal);
              //System.out.println("Item:"+item+"\t Amount:"+amount);
              i++;
            }
            }
            FileOutputStream outFile  = new FileOutputStream(new File(filename));
            workbook.write(outFile);
            outFile.close();
        }
        catch(Exception e){}
    }

    private static void printList(ArrayList<ItemConsumptionForm> list) {
        Iterator itr=list.iterator();
        ArrayList<ItemForm> ilist=null;
        while(itr.hasNext()){
          ItemConsumptionForm icf=(ItemConsumptionForm) itr.next();
          String menu=icf.getMenu();
          int total=icf.getTotal();
          ilist=icf.getList();
          Iterator it=ilist.iterator();
            System.out.println("Menu:"+menu+"\tTotal:"+total);
          while(it.hasNext()){
              ItemForm itf=(ItemForm)it.next();
              String item=itf.getName();
              int amount=itf.getAmount();
              System.out.println("Item:"+item+"\t Amount:"+amount);
          }
        }
    }
    public static void setDoc(String from,String to,String filename){
        System.out.println("File:"+filename);
        ArrayList<ItemConsumptionForm> list = getItems(from,to);
        XWPFDocument document = new XWPFDocument();
        XWPFTable tableTwo = document.createTable();
        XWPFTableRow table11 = tableTwo.getRow(0);
        XWPFTableCell cell1 = table11.getCell(0);
        //cell1.setText("DiBella Coffiee");
        stylePara(cell1,"DI BELLA COFFEE,HYDERABAD","FFFF00",true,false,"Calibri",14);
        setColor(cell1,"ABCDEF");
        MergeCells(cell1,4);
        XWPFTableRow tableTwo1 = tableTwo.createRow();
        XWPFTableCell cell = tableTwo1.getCell(0);
        stylePara(cell,"Item Consumption","FFFF00",true,false,"Calibri",12);
        setColor(cell,"ABCDEF");
        MergeCells(cell,4);
        
       tableTwo1 = tableTwo.createRow();
        cell = tableTwo1.getCell(0);
        String report="Report for "+DateFormate.myFormate(from)+", "+DateFormate.myFormate(to)+"  \n      Posted on: "+DateFormate.getToday();
        stylePara(cell,report,"000000",true,false,"Calibri",10);
        setColor(cell,"98BB3F");
        MergeCells(cell,4);
        
        try{
        Iterator itr=list.iterator();
        ArrayList<ItemForm> ilist=null;
        while(itr.hasNext()){
          ItemConsumptionForm icf=(ItemConsumptionForm) itr.next();
          String menu=icf.getMenu();
          int total=icf.getTotal();
          ilist=icf.getList();
          Iterator it=ilist.iterator();
            //System.out.println("Menu:"+menu+"\tTotal:"+total);
            XWPFTableRow tableTwoRowTwo = tableTwo.createRow();
            cell = tableTwoRowTwo.getCell(0);
            cell.setText(menu);
            
            setColor(cell,"AABBCC");
            MergeCells(cell,4);

          while(it.hasNext()){
              ItemForm itf=(ItemForm)it.next();
              String item=itf.getName();
              int amount=itf.getAmount();
              tableTwo1 = tableTwo.createRow();
            tableTwo1.getCell(0).setText(item);
            tableTwo1.addNewTableCell().setText(amount+"");
            double sec=(double)(amount*100)/total;
            tableTwo1.addNewTableCell().setText(sec+"");
            double tot=(double)(amount*100)/gTotal;
            tableTwo1.addNewTableCell().setText(tot+"");
              //System.out.println("Item:"+item+"\t Amount:"+amount);
          }
        }
        FileOutputStream outStream = new FileOutputStream(filename);
        document.write(outStream);
            outStream.close();
        }
        catch(Exception e){
        e.printStackTrace();
        }
        finally{
            System.out.println("completed");
        }
    }

    public static void setColor(XWPFTableCell cell,String color) {
        
            CTTcPr tcpr = cell.getCTTc().addNewTcPr();
        		// set vertical alignment to "center"
        		CTVerticalJc va = tcpr.addNewVAlign();
        		va.setVal(STVerticalJc.CENTER);
                       
        		// create cell color element
        		CTShd ctshd = tcpr.addNewShd();
                ctshd.setColor("FFBBcc");
                //ctshd.setVal(STShd.CLEAR);
                ctshd.setFill(color);
    }

    public static void MergeCells(XWPFTableCell cell,int number) {
        if (cell.getCTTc().getTcPr() == null) 
                cell.getCTTc().addNewTcPr();
            
            if (cell.getCTTc().getTcPr().getGridSpan() == null)
                cell.getCTTc().getTcPr().addNewGridSpan();
            
                cell.getCTTc().getTcPr().getGridSpan().setVal((BigInteger.valueOf(number)));
    }
    public static void createNotePad(String from,String to,String filename) throws IOException{
        try{
            File file = new File(filename);
            
 
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			
        ArrayList<ItemConsumptionForm> list = getItems(from, to);
        Iterator itr=list.iterator();
        ArrayList<ItemForm> ilist=null;
        String content="\t\t\tDI BELLA COFFEE,HYDERABAD";
        bw.write(content);
        content="\t\t\t  Item Consumption";
        bw.newLine();
        bw.write(content);
        
        bw.newLine();
        content="\t\t\tfor "+from+" ,"+to+"\t\t\tPosted on:"+to;
        bw.write(content);
        bw.newLine();
        String line="___________________________________________________________________________________________________________________";
            bw.write(line);
            bw.newLine();
            content=fs("Menu Sections",50)+" | "+fs("Amount",10)+" | "+fs("Section %",15)+" | "+fs("Total %",15)+" |";
            bw.write(content);
            bw.newLine();
            
            bw.write(line);
            bw.newLine();
        while(itr.hasNext()){
          ItemConsumptionForm icf=(ItemConsumptionForm) itr.next();
          String menu=icf.getMenu();
          int total=icf.getTotal();
          ilist=icf.getList();
          Iterator it=ilist.iterator();
            
            bw.write(line);
            bw.newLine();
            content="\t\t"+menu+"";
            bw.write(content);
            bw.newLine();
            
            bw.write(line);
            bw.newLine();
            
          while(it.hasNext()){
              ItemForm itf=(ItemForm)it.next();
              String item=itf.getName();
              int amount=itf.getAmount();
              content=fs(item,50)+"|"+fs(amount+"",10)+" | "+fs((double)(amount*100)/total+"",15)+" | "+fs((double)(amount*100)/gTotal+"",15)+" |";
              bw.write(content);
            bw.newLine();
              
          }
        }
        bw.close();
        }catch(Exception e){
        e.printStackTrace();
        }
    }
    public static String fs(String s,int l){
        int len=s.length();
        for(int i=0;i<l-len;i++){
            s+=" ";
        }
    return s;
    }
}
