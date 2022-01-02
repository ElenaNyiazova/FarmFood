package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findAllBySeller(Long seller);
    List<Product> findAllByCity(Long city);
}
