/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.form;

import java.io.Serializable;

/**
 *
 * @author softmerge
 */
public class RestForm implements Serializable {
    String name;
    String address;
    String phone;
    int tables;
    int id;
    String line2;
    String zip;
    String mail;
    String city;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public RestForm() {

    }

    public String getLine2() {
        return line2;
    }

    public void setLine2(String line2) {
        this.line2 = line2;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    byte[] image;

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public byte[] getImage() {
        
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }
    public RestForm(int id,String name, String address, String phone, int tables,byte[] image) {
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.tables = tables;
        this.image=image;
        this.id=id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getTables() {
        return tables;
    }

    public void setTables(int tables) {
        this.tables = tables;
    }
    
}
