package com.action.reports;

import java.io.*;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.*;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.poifs.filesystem.*;
import org.apache.poi.hwpf.extractor.WordExtractor;

public class WriteInDocument{

static void writeToFile(String content, String path){
try{
POIFSFileSystem fs = new POIFSFileSystem();
DirectoryEntry directory = fs.getRoot();
directory.createDocument("WordDocument", new ByteArrayInputStream(content.getBytes()));
FileOutputStream out = new FileOutputStream(path);
fs.writeFilesystem(out);
out.close();
}
catch(Exception ex) {
System.out.println(ex.getMessage());
                }
        }
                public static void main(String[]args){
                writeToFile("Hello World","d:/reports/new.doc");
                }
}