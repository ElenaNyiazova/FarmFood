package com.gpec.FarmFood.controllers;

import com.google.gson.Gson;
import com.gpec.FarmFood.model.db.City;
import com.gpec.FarmFood.model.db.Role;
import com.gpec.FarmFood.model.db.Seller;
import com.gpec.FarmFood.repositories.SellerRepository;
import com.gpec.FarmFood.servises.SellerServises;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class HomePageController {

    @Autowired
    SellerServises sellerServises;

    @Autowired
    com.gpec.FarmFood.repositories.RoleRepository RoleRepository;

//    @Autowired
//    public HomePageController(SellerServises sellerServises) {
//        this.sellerServises = sellerServises;
//    }

//    @GetMapping(value = "/home")
//    public ModelAndView goHome() {
//        return new ModelAndView("index.html");
//    }

    @ResponseBody
    @GetMapping(value = "/{city}")
    public String getLocalSellersByCity(@PathVariable(name = "city") City city) {

        List<Seller> sellers = SellerServises.getLocalSellers(city);
        String json = new Gson().toJson(sellers);

        return json;
//        Role role = new Role();
//        role.setId(1L);
//        role.setName("Role_User");
//        RoleRepository.save(role);
//        //return RoleRepository.findAll().toString();
//        return RoleRepository.findAll().toString();
    }
//    @GetMapping(value = API_SELLER)
//    public String getSellerById(@PathVariable(name = "seller_id") Long sellerId){
//
//        return null;
//    }
}
