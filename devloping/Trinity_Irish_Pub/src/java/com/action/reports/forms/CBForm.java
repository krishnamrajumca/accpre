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
public class CBForm {
   String billid;
   int foodAmount,mrp,discount,tax,serviceTax,roundValue,grandTotal;
   String payment,ptime,stime,operator,type;

    public CBForm(String billid, int foodAmount, int mrp, int discount, int tax, int serviceTax, int roundValue, int grandTotal, String payment, String ptime, String stime, String operator, String type) {
        this.billid = billid;
        this.foodAmount = foodAmount;
        this.mrp = mrp;
        this.discount = discount;
        this.tax = tax;
        this.serviceTax = serviceTax;
        this.roundValue = roundValue;
        this.grandTotal = grandTotal;
        this.payment = payment;
        this.ptime = ptime;
        this.stime = stime;
        this.operator = operator;
        this.type = type;
    }

    public String getBillid() {
        return billid;
    }

    public int getFoodAmount() {
        return foodAmount;
    }

    public int getMrp() {
        return mrp;
    }

    public int getDiscount() {
        return discount;
    }

    public int getTax() {
        return tax;
    }

    public int getServiceTax() {
        return serviceTax;
    }

    public int getRoundValue() {
        return roundValue;
    }

    public int getGrandTotal() {
        return grandTotal;
    }

    public String getPayment() {
        return payment;
    }

    public String getPtime() {
        return ptime;
    }

    public String getStime() {
        return stime;
    }

    public String getOperator() {
        return operator;
    }

    public String getType() {
        return type;
    }
   
}
