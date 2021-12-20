package com.gpec.FarmFood.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProguctController {


    @GetMapping(value = "/product/{product_id}")
    public String getProductById(@PathVariable(name = "product_id") Long productId) {
        return "вызов продукт бай";
    }

    @GetMapping(value = "/product/{sellerId}")
    public String getLocalSeller(@PathVariable(name = "sellerId") Long sellerId) {
        return "Эвызов локал селлер";
    }

    @GetMapping(value = "/product/{city}")
    public String getLocalSellersByCity(@PathVariable(name = "city") String city) {
        return "вызов локал веллерс";
    }

}
