package com.epam.FarmFood.repositories;

import com.epam.FarmFood.model.db.BuyerDAO;
import org.springframework.data.repository.CrudRepository;

public interface BuyerRepository extends CrudRepository<BuyerDAO, Long> {
}
