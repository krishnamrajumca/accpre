/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.accounts.forms;

/**
 *
 * @author krishna
 */
public class test {
    public static void main(String args[]){
        String s="sub-discount;vat;service";
        String[] sa=s.split(";");
        System.out.println("size:"+sa.length);
        for(int i=1;i<sa.length;i++)
            System.out.println("items:"+sa[i]);
    }
}
