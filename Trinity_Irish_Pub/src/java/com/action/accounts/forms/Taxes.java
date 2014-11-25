/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.accounts.forms;

/**
 *
 * @author krishna
 */
public class Taxes {
    String name;
    Double discount,subtotal;

    public Taxes(String name, Double discount, Double subtotal) {
        this.name = name;
        this.discount = discount;
        this.subtotal = subtotal;
    }

    public String getName() {
        return name;
    }

    public Double getDiscount() {
        return discount;
    }

    public Double getSubtotal() {
        return subtotal;
    }
    
}
