package com.gpec.FarmFood.servises;

import com.gpec.FarmFood.model.db.Product;
import com.gpec.FarmFood.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productsRepository;

    public Product findOneById(Long productId){ return productsRepository.getById(productId); }
    public List<Product> findAllBySellerId(Long sellerId){
        return productsRepository.findAllBySeller(sellerId);
    }
    public List<Product> findAllByCityId(Long cityId){ return productsRepository.findAllByCity(cityId); }
    public List<Product> findAllProducts(){
        return productsRepository.findAll();
    }
}
