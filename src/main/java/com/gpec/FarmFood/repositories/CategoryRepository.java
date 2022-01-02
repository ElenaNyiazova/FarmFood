package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.Category;
import org.junit.experimental.categories.Categories;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
}
