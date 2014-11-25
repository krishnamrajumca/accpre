/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.util;

import java.text.DecimalFormat;
import java.util.Date;

/**
 *
 * @author admin
 */


//for forget password asking enter letters like hJGHTYF

public class cp {
static String Chars[]={"a","b","c","d","f","g","h","i","j","k","l","m","o","p","q","r","s","t","u","v","w","x","y","z",
"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
};

    public static void main(String[] args) {
        long ln=1234567890;
        cp c=new cp();
        c.getCp();
    }
    public String getCp(){
       Date d=new Date();
       long ln=(d.getSeconds()+1)*(d.getYear()+1);
        ln=ln*ln*ln;
        
        String s="";
        while(ln>1){
            int r=(int)ln%50;
            
            r=(int)Math.sqrt(r*r);
            
            s+=Chars[r];

            ln=ln/50;
        }
        
        return s;
    }
    
public static double RD(double val) {
            DecimalFormat df2 = new DecimalFormat("###.##");
        return Double.valueOf(df2.format(val));
}
}
