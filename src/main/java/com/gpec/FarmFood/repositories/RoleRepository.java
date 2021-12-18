package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

//@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
}
