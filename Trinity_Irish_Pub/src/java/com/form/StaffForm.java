/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.form;

import java.io.Serializable;

/**
 *
 * @author admin
 */
public class StaffForm implements Serializable{
int id,noOfRes;
String name,phone;

    public StaffForm(int id, int noOfRes, String name, String phone) {
        this.id = id;
        this.noOfRes = noOfRes;
        this.name = name;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNoOfRes() {
        return noOfRes;
    }

    public void setNoOfRes(int noOfRes) {
        this.noOfRes = noOfRes;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
