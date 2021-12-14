package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CitiesRepository extends JpaRepository<User, Long> {
}
