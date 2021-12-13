package com.epam.gpec.FarmFood.controllers;

import com.epam.gpec.FarmFood.model.db.SellerDAO;
import com.epam.gpec.FarmFood.servises.SellerServises;
import com.epam.gpec.FarmFood.constants.Endpoints;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

//@RestController
@Controller
public class HomePageController {

   // @Autowired
    private SellerServises sellerServises;
    //    @Value("${spring.application.name}")
//    String appName;


//There is no city selected by default Minsk is used


//    public String homePage(Model model) {
//        model.addAttribute("appName", appName);
//        return "home";
//    }

    @Autowired
    public HomePageController(SellerServises sellerServises) {
        this.sellerServises = sellerServises;
    }


    @GetMapping(value = Endpoints.HOME_PAGE)
    public List<SellerDAO> getLocalSellers(@PathVariable(name = "city") String city,
                                           @PathVariable(name = "role") String role) {

        if(role == null){  //not used yet
            role = "no_autor_user";
        }
        return SellerServises.getLocalSellers(city);
    }
}
