package com.example.BookStore.Repository;

import com.example.BookStore.entities.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends JpaRepository<Admin,String> {
    Admin findByEmail(String email);
}