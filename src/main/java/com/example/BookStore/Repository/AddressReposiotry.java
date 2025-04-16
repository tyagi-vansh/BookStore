package com.example.BookStore.Repository;

import com.example.BookStore.entities.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressReposiotry extends JpaRepository<Address,Integer> {
    Address findById(int id);
    Address findByEmail(String email);
}
