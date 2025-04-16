package com.example.BookStore.Repository;

import com.example.BookStore.entities.Orders;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrdersRepository extends JpaRepository<Orders, Integer> {
    Orders findById(int id);
    List<Orders> findByUserId(String userId);
}
