package com.action.reports;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

public class CreateTablesWithPOI {
 
    public static void main(String[] args) {
        XWPFDocument document = new XWPFDocument();
 
        // New 2x2 table
        XWPFTable tableOne = document.createTable();
        XWPFTableRow tableOneRowOne = tableOne.getRow(0);
        tableOneRowOne.getCell(0).setText("Hello");
        tableOneRowOne.addNewTableCell().setText("World");
 
        XWPFTableRow tableOneRowTwo = tableOne.createRow();
        tableOneRowTwo.getCell(0).setText("This is");
        tableOneRowTwo.getCell(1).setText("a table");
 
        //Add a break between the tables
        document.createParagraph().createRun().addBreak();
 
        // New 3x3 table
        XWPFTable tableTwo = document.createTable();
        XWPFTableRow tableTwoRowOne = tableTwo.getRow(0);
        tableTwoRowOne.getCell(0).setText("col one, row one");
        tableTwoRowOne.addNewTableCell().setText("col two, row one");
        tableTwoRowOne.addNewTableCell().setText("col three, row one");
 
        XWPFTableRow tableTwoRowTwo = tableTwo.createRow();
        tableTwoRowTwo.getCell(0).setText("col one, row two");
        tableTwoRowTwo.getCell(1).setText("col two, row two");
        tableTwoRowTwo.getCell(2).setText("col three, row two");
 tableTwoRowTwo.getCell(0).setColor("FF0000");
        XWPFTableRow tableTwoRowThree = tableTwo.createRow();
        tableTwoRowThree.getCell(0).setText("col one, row three");
        tableTwoRowThree.getCell(1).setText("col two, row three");
        tableTwoRowThree.getCell(2).setText("col three, row three");
 
        FileOutputStream outStream = null;
        try {
            outStream = new FileOutputStream("d:/reports/sample.doc");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
 
        try {
            document.write(outStream);
            outStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
 
}