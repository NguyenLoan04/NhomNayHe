package com.example.webtranhtheu_ltweb_nlu_nhom26.bean;

public class Address {
    private int id;
    private String location;

    public Address() {}

    public Address(int id, String location) {
        this.id = id;
        this.location = location;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getId() {
        return id;
    }

    public String getLocation() {
        return location;
    }
}
