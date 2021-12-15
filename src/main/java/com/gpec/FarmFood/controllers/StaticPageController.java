package com.gpec.FarmFood.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import static com.gpec.FarmFood.constants.Endpoints.API_HOME;
import static com.gpec.FarmFood.constants.Endpoints.HOME;

@Controller
public class StaticPageController {

    @GetMapping(value = {
            "/",
            API_HOME
            })
    public String staticPage() {
        return "/index.html";
    }
}
