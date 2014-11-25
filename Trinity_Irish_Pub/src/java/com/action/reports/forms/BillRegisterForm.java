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
public class BillRegisterForm {
    String billId;
    double foodAmount,mRPAmount,discount,tax,serviceTax,roundedValue,grandTotal;
    String paymentType,preTime,setTime,operator,type;

    public BillRegisterForm(String billId, double foodAmount, double mRPAmount, double discount, double tax, double serviceTax, double roundedValue, double grandTotal, String paymentType,String preTime, String setTime, String operator, String type) {
        this.billId = billId;
        this.foodAmount = foodAmount;
        this.mRPAmount = mRPAmount;
        this.discount = discount;
        this.tax = tax;
        this.serviceTax = serviceTax;
        this.roundedValue = roundedValue;
        this.grandTotal = grandTotal;
        this.paymentType = paymentType;
        this.setTime = setTime;
        this.preTime = preTime;
        this.operator = operator;
        this.type = type;
    }
    
    public String getBillId() {
        return billId;
    }

    public double getFoodAmount() {
        return foodAmount;
    }

    public double getmRPAmount() {
        return mRPAmount;
    }

    public double getDiscount() {
        return discount;
    }

    public double getTax() {
        return tax;
    }

    public double getServiceTax() {
        return serviceTax;
    }

    public double getRoundedValue() {
        return roundedValue;
    }

    public double getGrandTotal() {
        return grandTotal;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public String getPreTime() {
        return preTime;
    }

    public String getSetTime() {
        return setTime;
    }

    public String getOperator() {
        return operator;
    }

    public String getType() {
        return type;
    }
    
}
