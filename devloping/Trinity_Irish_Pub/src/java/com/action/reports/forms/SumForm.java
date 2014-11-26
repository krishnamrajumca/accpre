/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.reports.forms;

import com.util.cp;

/**
 *
 * @author krishna
 */
public class SumForm {
    String cat;
    double amount,discount,tax,total;

    public SumForm(String cat, double amount, double discount, double tax, double total) {
        this.cat = cat;
        this.amount = amount;
        this.discount = discount;
        this.tax = tax;
        this.total = total;
    }

    public String getCat() {
        return cat;
    }

    public double getAmount() {
        return cp.RD(amount);
    }

    public double getDiscount() {
        return cp.RD(discount);
    }

    public double getTax() {
        return cp.RD(tax);
    }

    public double getTotal() {
        return cp.RD(total);
    }
    
}
