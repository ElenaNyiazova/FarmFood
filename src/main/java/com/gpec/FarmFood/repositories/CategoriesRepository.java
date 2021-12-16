package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.Category;
import org.junit.experimental.categories.Categories;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoriesRepository extends JpaRepository<Category, Long> {
}
