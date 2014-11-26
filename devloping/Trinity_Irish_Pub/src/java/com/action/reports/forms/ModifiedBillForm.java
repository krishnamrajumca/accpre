/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.reports.forms;

/**
 *
 * @author krishna
 */
public class ModifiedBillForm {
   String id;
   int amount,modAmount,diff;
   String time,operator;

    public ModifiedBillForm(String id, int amount, int modAmount, int diff, String time, String operator) {
        this.id = id;
        this.amount = amount;
        this.modAmount = modAmount;
        this.diff = diff;
        this.time = time;
        this.operator = operator;
    }

    public String getId() {
        return id;
    }

    public int getAmount() {
        return amount;
    }

    public int getModAmount() {
        return modAmount;
    }

    public int getDiff() {
        return diff;
    }

    public String getTime() {
        return time;
    }

    public String getOperator() {
        return operator;
    }
   
}
