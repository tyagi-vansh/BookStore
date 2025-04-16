package com.example.BookStore.Repository;

import com.example.BookStore.entities.Books;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface BookRepository extends JpaRepository<Books,Integer> {
    Books findById(int id);
    List<Books> findByCategory(int categoryId);
    List<Books> findTop3ByOrderByIdDesc();
}
