package com.example.BookStore.Request;

import lombok.Data;

@Data
public class ResetUserPassword {
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
