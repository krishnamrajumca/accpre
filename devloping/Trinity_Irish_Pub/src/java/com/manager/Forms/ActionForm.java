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
public class ActionForm {
    String name,quantity,status,kitchenAction,waiterAction;

    public ActionForm(String name, String quantity, String status, String kitchenAction, String waiterAction) {
        this.name = name;
        this.quantity = quantity;
        this.status = status;
        this.kitchenAction = kitchenAction;
        this.waiterAction = waiterAction;
    }

    public String getName() {
        return name;
    }

    public String getQuantity() {
        return quantity;
    }

    public String getStatus() {
        return status;
    }

    public String getKitchenAction() {
        return kitchenAction;
    }

    public String getWaiterAction() {
        return waiterAction;
    }
    
}
