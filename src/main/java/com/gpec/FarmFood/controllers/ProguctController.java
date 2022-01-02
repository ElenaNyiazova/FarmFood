package com.gpec.FarmFood.controllers;

import com.google.gson.Gson;
import com.gpec.FarmFood.servises.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProguctController {

    @Autowired
    ProductService productService;


    @GetMapping(value = "/product/{product_id}")
    public String getProductById(@PathVariable(name = "product_id") Long productId) {
        return new Gson().toJson(productService.findOneById(productId));
    }

    @GetMapping(value = "/product/{sellerId}")
    public String getProductsBySeller(@PathVariable(name = "sellerId") Long sellerId) {
        return new Gson().toJson(productService.findAllBySellerId(sellerId));
    }

    @GetMapping(value = "/product/{cityId}")
    public String getProductsByCity(@PathVariable(name = "cityId") Long cityId) {
        return new Gson().toJson(productService.findAllByCityId(cityId));
//        return new Gson().toJson();
    }

    @GetMapping(value = "/products")
    public String getAllProducts() {
        return new Gson().toJson(productService.findAllProducts());
    }

}
