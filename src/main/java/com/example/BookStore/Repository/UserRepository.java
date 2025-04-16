package com.example.BookStore.Repository;

import com.example.BookStore.entities.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<Users, String> {
    Users findByEmail(String email);

}
