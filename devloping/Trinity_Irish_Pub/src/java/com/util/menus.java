/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.util;

/**
 *
 * @author krishna
 */
public class menus {
    int id,pid,level,child;
    String name;

    public  menus(int id, int pid, int level, String name,int child) {
        this.id = id;
        this.pid = pid;
        this.level = level;
        this.name = name;
        this.child=child;
    }

    public int getChild() {
        return child;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
