package com.gpec.FarmFood.servises;

import com.gpec.FarmFood.model.db.SellerDAO;
import com.gpec.FarmFood.repositories.SellerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SellerServises {

    @Autowired
    static
    SellerRepository sellerRepository;

    public static List<SellerDAO> getLocalSellers(String city){

        return sellerRepository.findAllByCity(city);
    }
}
