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
public class OrdersF {
    String type;
    Double total;

    public OrdersF(String type, Double total) {
        this.type = type;
        this.total = total;
    }

    public String getType() {
        return type;
    }

    public Double getTotal() {
        return total;
    }
    
}
