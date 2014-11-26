/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.form;

/**
 *
 * @author Raasta Films
 */
public class MenuForm {

    String menu, submenu, menuitem, item, status;
    Double price;

    public MenuForm(String menu, String submenu, String menuitem, String item, String status, Double price) {
        this.menu = menu;
        this.submenu = submenu;
        this.menuitem = menuitem;
        this.item = item;
        this.status = status;
        this.price = price;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    public String getSubmenu() {
        return submenu;
    }

    public void setSubmenu(String submenu) {
        this.submenu = submenu;
    }

    public String getMenuitem() {
        return menuitem;
    }

    public void setMenuitem(String menuitem) {
        this.menuitem = menuitem;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
