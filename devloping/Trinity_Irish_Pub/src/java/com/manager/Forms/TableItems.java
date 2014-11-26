/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.manager.Forms;

/**
 *
 * @author krishna
 */
public class TableItems {
    String id,name,qt;
    double price,total;

    public TableItems(String id, String name, String qt, double price, double total) {
        this.id = id;
        this.name = name;
        this.qt = qt;
        this.price = price;
        this.total = total;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getQt() {
        return qt;
    }

    public double getPrice() {
        return price;
    }

    public double getTotal() {
        return total;
    }
    
}
