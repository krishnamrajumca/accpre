/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.form;

import java.io.Serializable;

/**
 *
 * @author krishna
 */
public class TransactionForm implements Serializable{
    String id,txn,amount,date;

    public TransactionForm(String id, String txn, String amount, String date) {
        this.id = id;
        this.txn = txn;
        this.amount = amount;
        this.date = date;
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
