/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.accounts;

import com.action.accounts.forms.Items;
import com.action.accounts.forms.TreeForm;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author krishna
 */
public class TestM {
    public static void main(String args[]){
        ArrayList<TreeForm> list=Accounts.getMenus();
   
    Iterator itr=list.iterator();
    while(itr.hasNext()){
        TreeForm tf=(TreeForm)itr.next();
        String mid=tf.getMid();
        String menu=tf.getMenu();
        System.out.println("Mid:"+mid+" menu:"+menu);
        System.out.println("------------------------------------------------");
        ArrayList<Items> it=tf.getList();
        Iterator iit=it.iterator();
        while(iit.hasNext()){
            Items item=(Items)iit.next();
            String iid=item.getId();
            String iname=item.getName();
            System.out.println("Item id:"+iid+" item :"+iname);
        }
            
    }
    }
}
