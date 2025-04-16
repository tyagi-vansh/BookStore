package com.example.BookStore.Request;

import lombok.Data;

@Data
public class UpdateCategory {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
