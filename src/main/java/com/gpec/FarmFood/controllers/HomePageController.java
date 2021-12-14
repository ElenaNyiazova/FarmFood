package com.gpec.FarmFood.controllers;

import com.google.gson.Gson;
import com.gpec.FarmFood.model.db.Seller;
import com.gpec.FarmFood.servises.SellerServises;
import com.gpec.FarmFood.constants.Endpoints;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class HomePageController {

    @Autowired
    private SellerServises sellerServises;

    @Autowired
    public HomePageController(SellerServises sellerServises) {
        this.sellerServises = sellerServises;
    }

    @GetMapping(value = Endpoints.HOME_PAGE)
    public String getLocalSellers(@PathVariable(name = "city") String city) {

//        if(role == null){  //not used yet
//            role = "no_autor_user";
//        }

        List<Seller> sellers = SellerServises.getLocalSellers(city);
        String json = new Gson().toJson(sellers);
        System.out.println(json);

        return json;
    }
}
