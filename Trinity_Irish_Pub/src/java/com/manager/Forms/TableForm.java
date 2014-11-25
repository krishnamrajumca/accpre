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
public class TableForm {
    String id,ordered;

    public TableForm(String id, int ordered) {
        this.id = id;
        this.ordered = ordered+"";
    }

    public String getId() {
        return id;
    }

    public String getOrdered() {
        return ordered;
    }
    
}
