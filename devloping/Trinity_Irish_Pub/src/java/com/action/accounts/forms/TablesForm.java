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
public class TablesForm {
    String tableId,tableName,password,assign;

    public TablesForm(String tableId, String tableName, String password,String assign) {
        this.tableId = tableId;
        this.tableName = tableName;
        this.password = password;
        this.assign = assign;
    }

    public String getAssign() {
        return assign;
    }

    public String getTableId() {
        return tableId;
    }

    public String getTableName() {
        return tableName;
    }

    public String getPassword() {
        return password;
    }
    
}
