package com.epam.FarmFood.repositories;

import com.epam.FarmFood.model.db.GoodsDAO;
import com.epam.FarmFood.model.db.SellerDAO;
import org.springframework.data.repository.CrudRepository;

public interface GoodsRepository extends CrudRepository<GoodsDAO, Long> {
}
