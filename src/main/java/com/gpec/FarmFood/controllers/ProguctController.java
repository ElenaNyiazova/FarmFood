package com.gpec.FarmFood.controllers;

import com.gpec.FarmFood.servises.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProguctController {

    @Autowired
    ProductService productService;


    @GetMapping(value = "/product/{product_id}")
    public String getProductById(@PathVariable(name = "product_id") Long productId) {

        return null; //ProductService.fintOneById(productId);
    }

    @GetMapping(value = "/product/{sellerId}")
    public String getLocalSeller(@PathVariable(name = "sellerId") Long sellerId) {

        return null; //ProductService.findAllBySellerId(sellerId);
    }

    @GetMapping(value = "/product/{cityId}")
    public String getLocalSellersByCity(@PathVariable(name = "cityId") String cityId) {
        return null; //ProductService.findAllByCityId(cityId);
    }

}
