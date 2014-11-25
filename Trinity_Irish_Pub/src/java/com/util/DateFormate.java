/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.util;

import java.util.Date;

/**
 *
 * @author krishna
 */
public class DateFormate {
    static String mon[]={"Jan","Feb","Mar","April","May","June","July","Aug","Sep","Oct","Nov","Dec"};
    public static void main(String args[]){
        System.out.println(getToday());
        System.out.println(myFormate("2014-03-14"));
    }
    public static String getToday(){
    String date="";
    Date d=new Date();
    int dat=d.getDate();
    String month=mon[d.getMonth()];
    int year=d.getYear()+1900;
    date=fillZero(dat)+" "+month+" ,"+year;
    return date;
    }
    public static String myFormate(String date){
    String s="";
    String[] st=date.split("-");
    String year=st[0];
        System.out.println("year:"+st[0]+"\tmon:"+st[1]+"\tDate:"+st[2]);
    String month=mon[Integer.parseInt(st[1])-1];
    String dat=st[2];
    s=dat+" "+month+", "+year;
    return s;
    }
    private static String fillZero(int i){
        String s=i+"";
        s=i>9?s:"0"+i;
        return s;
    }
}
