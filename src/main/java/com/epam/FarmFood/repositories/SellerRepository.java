package com.epam.FarmFood.repositories;

import com.epam.FarmFood.model.db.UserDAO;
import org.springframework.data.repository.CrudRepository;

public interface SellerRepository extends CrudRepository<UserDAO, Long> {
}
