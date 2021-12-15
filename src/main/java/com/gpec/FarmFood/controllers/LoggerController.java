package com.gpec.FarmFood.controllers;

import com.gpec.FarmFood.model.db.User;
import com.gpec.FarmFood.servises.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@RestController
public class LoggerController {

    @Autowired
    UserService userService;

    UserDetails user;

    //@PostAuthorize()

    @GetMapping(value = "/login")
    public UserDetails adminLogin() throws SQLException {
        Connection connect = DriverManager.getConnection("jdbc:postgresql://localhost/postgres?" +
                "user=" + "postgres" + "&password=" + "password");
//        Connection connect = DriverManager.getConnection(
//                "jdbc:postgresql://ec2-52-213-119-221.eu-west-1.compute.amazonaws.com:5432/d8i6sb8l5ki7vb?" +
//                        "sslmode=require");// + "user=" + "hnjcutqdbpohlm" + "&password=" + "a812af31aa76b9a960ce413a072e39e1fdb5361ccf8d45c851948fa8967ac4e2");
        System.out.println(connect.getSchema());
        return userService.loadUserByUsername("admin");
    }

    @GetMapping(value = "/login/{userEmeil}/{password}")
    public String userLogin(String userEmail, String password) {//todo password not use yet
        if (userEmail == null) {
            throw new IllegalArgumentException(" App exception: User Email not entered! ");
        }
        try {
            UserDetails user = userService.loadUserByUsername(userEmail);
        } catch (UsernameNotFoundException e) {
            throw new IllegalArgumentException(" App exception: no such Email found! " + e);
        }
        if (user == null) {
            return "Faild login : " + userEmail;
        }
        return "Access login : " + userEmail;
    }

    @PostMapping(value = "/registration/{userEmail}/{password}")
    public String getLocalSellers(String userName, String password) {
        //userService.saveNewUser("userName")
        return "reg";
    }
}
