package com.gpec.FarmFood.servises;

import com.gpec.FarmFood.model.db.Seller;
import com.gpec.FarmFood.repositories.SellerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SellerServises {

    @Autowired
    private SellerRepository sellerRepository;

    public static List<Seller> getLocalSellers(String city){

        List<Seller> list = new ArrayList<Seller>();
        list.add(new Seller());
        return list;
//        return sellerRepository.findAll();
    }
}
