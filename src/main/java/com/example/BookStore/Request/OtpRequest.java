package com.example.BookStore.Request;

import lombok.Data;

@Data
public class OtpRequest {
    private String userotp;

    public String getUserotp() {
        return userotp;
    }

    public void setUserotp(String userotp) {
        this.userotp = userotp;
    }
}
