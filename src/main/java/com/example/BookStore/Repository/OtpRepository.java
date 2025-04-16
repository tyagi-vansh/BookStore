package com.example.BookStore.Repository;

import com.example.BookStore.entities.Otp;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OtpRepository extends JpaRepository<Otp, Integer> {
    Otp findById(int id);
}
