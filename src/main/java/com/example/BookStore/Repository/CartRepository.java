package com.example.BookStore.Repository;

import com.example.BookStore.entities.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart,Integer> {
    Cart findById(int id);
    Cart findByEmail(String email);
}
