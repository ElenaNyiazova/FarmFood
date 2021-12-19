package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.Reviews;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewRepositiry extends JpaRepository<Reviews, Long> {
}
