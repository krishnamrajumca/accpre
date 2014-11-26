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
public class MRMForm {
    String menu;
    double amount;

    public MRMForm(String menu, double amount) {
        this.menu = menu;
        this.amount = amount;
    }

    public String getMenu() {
        return menu;
    }

    public double getAmount() {
        return amount;
    }
    
}
