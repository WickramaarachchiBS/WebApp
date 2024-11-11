package org.example.demo.dto;

import java.sql.Blob;

public class movies {
    int mid;
    String mname;
    int price;
    String desc;
    Blob image;

    public int getMid() {
        return mid;
    }
    public void setMid(int mid) {
        this.mid = mid;
    }


    public String getMname() {
        return mname;
    }
    public void setMname(String mname) {
        this.mname = mname;
    }


    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }


    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }

    
    public Blob getImage() {
        return image;
    }
    public void setImage(Blob image) {
        this.image = image;
    }
}
