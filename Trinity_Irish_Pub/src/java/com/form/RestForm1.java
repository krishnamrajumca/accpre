/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.form;

/**
 *
 * @author admin
 */
public class RestForm1 {
int mid,ref,level;
String name,rid;

    public RestForm1(String rid, int mid, int ref, int level, String name) {
        this.rid = rid;
        this.mid = mid;
        this.ref = ref;
        this.level = level;
        this.name = name;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRef() {
        return ref;
    }

    public void setRef(int ref) {
        this.ref = ref;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

}
