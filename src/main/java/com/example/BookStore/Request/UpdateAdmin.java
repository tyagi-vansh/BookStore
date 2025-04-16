package com.example.BookStore.Request;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class UpdateAdmin {
    private String name;
    private String password;
    private MultipartFile profile;

    public MultipartFile getProfile() {
        return profile;
    }

    public void setProfile(MultipartFile profile) {
        this.profile = profile;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
