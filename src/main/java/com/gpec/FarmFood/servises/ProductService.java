package com.gpec.FarmFood.servises;

import com.gpec.FarmFood.model.db.Seller;
import com.gpec.FarmFood.repositories.ProductsRepository;
import com.gpec.FarmFood.repositories.SellerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private static ProductsRepository productsRepository;

//     return ProductService.findAllByCityId(cityId);
//      return ProductService.findAllBySellerId(sellerId);
//      return ProductService.fintOneById(productId);

    public static List<Seller> findAllByCityId(String cityId){

        return null;// sellerRepository.findAllByCity(city);
    }
}
