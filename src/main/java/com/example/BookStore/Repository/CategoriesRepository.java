package com.example.BookStore.Repository;

import com.example.BookStore.entities.Categories;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriesRepository extends JpaRepository<Categories,String> {
    Categories findByid(int id);
}
