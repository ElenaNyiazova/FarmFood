package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByName(String name);

    Optional<User> findByEmailIgnoreCase(String email);

    Optional<User> findById( Long id);
}
