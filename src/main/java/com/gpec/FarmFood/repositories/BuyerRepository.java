package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.BuyerDAO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BuyerRepository extends JpaRepository<BuyerDAO, Long> {
}