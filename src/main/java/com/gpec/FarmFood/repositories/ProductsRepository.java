package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.Products;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductsRepository extends JpaRepository<Products, Long> {
}
