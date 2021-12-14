package com.gpec.FarmFood.controllers;

import com.google.gson.Gson;
import com.gpec.FarmFood.model.db.Seller;
import com.gpec.FarmFood.servises.SellerServises;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static com.gpec.FarmFood.constants.Endpoints.API_HOME;

@RestController
public class HomePageController {

    @Autowired
    private SellerServises sellerServises;

    @Autowired
    public HomePageController(SellerServises sellerServises) {
        this.sellerServises = sellerServises;
    }

    @GetMapping(value = API_HOME)
    public String getLocalSellers(@PathVariable(name = "city") String city) {

//        if(role == null){  //not used yet
//            role = "no_autor_user";
//        }
//
//        List<Seller> sellers = SellerServises.getLocalSellers(city);
//        String json = new Gson().toJson(sellers);
//        System.out.println(json);
//
//        return json;
        return city;
    }
}
