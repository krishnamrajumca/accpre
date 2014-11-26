package com.manager.Forms;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import java.io.Serializable;

/**
 *
 * @author krishna
 */
public class TransactionForm implements Serializable{
    String id,txn,amount,date,discount,tax;

    public String getDiscount() {
        return discount;
    }

    public TransactionForm(String id, String txn, String amount, String date,String discount,String tax) {
        this.id = id;
        this.txn = txn;
        this.amount = amount;
        this.date = date;
        this.discount=discount;
        this.tax=tax;
    }

    public String getTax() {
        return tax;
    }

    public String getId() {
        return id;
    }

    public String getTxn() {
        return txn;
    }

    public String getAmount() {
        return amount;
    }

    public String getDate() {
        return date;
    }

    
}
