package com.gpec.FarmFood.servises;

import com.gpec.FarmFood.model.db.City;
import com.gpec.FarmFood.model.db.Seller;
import com.gpec.FarmFood.repositories.SellerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SellerService {

    @Autowired
    private static SellerRepository sellerRepository;

    public static List<Seller> findAllByCity(String city){

        return sellerRepository.findAllByCity(city);
    }
}
