package com.epam.FarmFood.repositories;

import com.epam.FarmFood.model.db.UserDAO;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<UserDAO, Long> {
}
