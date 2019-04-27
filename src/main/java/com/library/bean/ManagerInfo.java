package com.library.bean;

public class ManagerInfo {
    private String username;
    private String pass;

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public ManagerInfo() {
    }

    public ManagerInfo(String username, String pass) {
        this.username = username;
        this.pass = pass;
    }
}
