package com.example.BookStore.Request;

import lombok.Data;

@Data
public class UpdateBook {
    private String name;
//    private String photos;
    private String price;
    private int category;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
//
//    public String getPhotos() {
//        return photos;
//    }
//
//    public void setPhotos(String photos) {
//        this.photos = photos;
//    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }
}
