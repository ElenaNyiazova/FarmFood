package com.epam.FarmFood.repositories;

import com.epam.FarmFood.model.db.SellerDAO;
import org.springframework.data.repository.CrudRepository;

public interface SellerRepository extends CrudRepository<SellerDAO, Long> {
}
