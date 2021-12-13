package com.epam.gpec.FarmFood.repositories;

import com.epam.gpec.FarmFood.model.db.ProductsDAO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductsRepository extends JpaRepository<ProductsDAO, Long> {
}
