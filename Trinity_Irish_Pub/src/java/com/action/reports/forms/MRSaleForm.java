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
public class MRSaleForm {
    String type;
    double amount,tax,serviceTax,rounded,total;
    int noOfBills;

    public MRSaleForm(String type,double amount, double tax, double serviceTax, double rounded, double total, int noOfBills) {
        this.amount = amount;
        this.tax = tax;
        this.serviceTax = serviceTax;
        this.rounded = rounded;
        this.total = total;
        this.noOfBills = noOfBills;
        this.type=type;
    }

    public String getType() {
        return type;
    }

    public double getAmount() {
        return amount;
    }

    public double getTax() {
        return tax;
    }

    public double getServiceTax() {
        return serviceTax;
    }

    public double getRounded() {
        return rounded;
    }

    public double getTotal() {
        return total;
    }

    public int getNoOfBills() {
        return noOfBills;
    }
    
}
