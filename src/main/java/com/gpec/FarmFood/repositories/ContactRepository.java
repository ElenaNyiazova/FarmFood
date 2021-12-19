package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContactRepository extends JpaRepository<Contact, Long> {
}
