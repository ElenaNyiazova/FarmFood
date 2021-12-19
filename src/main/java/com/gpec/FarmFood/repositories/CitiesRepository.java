package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.City;
import com.gpec.FarmFood.model.db.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CitiesRepository extends JpaRepository<City, Long> {
}
