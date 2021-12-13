package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.SellerDAO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface SellerRepository extends JpaRepository<SellerDAO, Long> {
    List<SellerDAO> findAllByCity(String city);
}
