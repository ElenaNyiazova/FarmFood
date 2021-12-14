package com.gpec.FarmFood.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import static com.gpec.FarmFood.constants.Endpoints.HOME_PAGE;

@Controller
public class StaticPageController {

    @GetMapping(value = {
            "/",
            HOME_PAGE
            })
    public String staticPage() {
        return "/index.html";
    }
}
