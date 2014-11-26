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
public class MRDForm {
    String BillId;
    double billAmount,discount,discountP,Amount;
    String grantedBy,Reason;

    public MRDForm(String BillId, double billAmount, double discount, double discountP, double Amount, String grantedBy, String Reason) {
        this.BillId = BillId;
        this.billAmount = billAmount;
        this.discount = discount;
        this.discountP = discountP;
        this.Amount = Amount;
        this.grantedBy = grantedBy;
        this.Reason = Reason;
    }

    public String getBillId() {
        return BillId;
    }

    public double getBillAmount() {
        return billAmount;
    }

    public double getDiscount() {
        return discount;
    }

    public double getDiscountP() {
        return discountP;
    }

    public double getAmount() {
        return Amount;
    }

    public String getGrantedBy() {
        return grantedBy;
    }

    public String getReason() {
        return Reason;
    }
    
}
