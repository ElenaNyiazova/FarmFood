package com.gpec.FarmFood.servises;

import com.gpec.FarmFood.model.db.Product;
import com.gpec.FarmFood.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public Product findOneById(Long productId){ return productRepository.getById(productId); }
    public List<Product> findAllBySellerId(Long sellerId){
        return productRepository.findAllBySeller(sellerId);
    }
    public List<Product> findAllByCityId(Long cityId){ return productRepository.findAllByCity(cityId); }
    public List<Product> findAllProducts(){
        return productRepository.findAll();
    }
}
