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
public class GrossSaleForm {
    String Type;
    double foodAmount,fTax,MRPAmount,mrpTax,totalAmount,tax,serviceTax,total,rounedValue;

    public GrossSaleForm(String Type, double foodAmount, double fTax, double MRPAmount, double mrpTax, double totalAmount, double tax, double serviceTax, double total, double rounedValue) {
        this.Type = Type;
        this.foodAmount = foodAmount;
        this.fTax = fTax;
        this.MRPAmount = MRPAmount;
        this.mrpTax = mrpTax;
        this.totalAmount = totalAmount;
        this.tax = tax;
        this.serviceTax = serviceTax;
        this.total = total;
        this.rounedValue = rounedValue;
    }

    public String getType() {
        return Type;
    }

    public double getFoodAmount() {
        return foodAmount;
    }

    public double getfTax() {
        return fTax;
    }

    public double getMRPAmount() {
        return MRPAmount;
    }

    public double getMrpTax() {
        return mrpTax;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public double getTax() {
        return tax;
    }

    public double getServiceTax() {
        return serviceTax;
    }

    public double getTotal() {
        return total;
    }

    public double getRounedValue() {
        return rounedValue;
    }
    
}
