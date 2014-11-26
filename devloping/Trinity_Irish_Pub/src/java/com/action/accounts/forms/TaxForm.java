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
public class TaxForm {
    String name,comment,type,val,op,wit,formula;

    public TaxForm(String name, String comment, String type, String val, String op, String wit,String formula) {
        this.name = name;
        this.comment = comment;
        this.type = type;
        this.val = val;
        this.op = op;
        this.wit = wit;
        this.formula=formula;
    }

    public String getFormula() {
        return formula;
    }

    public String getName() {
        return name;
    }

    public String getComment() {
        return comment;
    }

    public String getType() {
        return type;
    }

    public String getVal() {
        return val;
    }

    public String getOp() {
        return op;
    }

    public String getWit() {
        return wit;
    }
    
}
