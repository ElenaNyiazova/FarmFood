package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.model.db.City;
import com.gpec.FarmFood.model.db.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SellerDTO {
    @Id
    private Long id;
    private String name;
    private String description;
    double grade;
    User user;
    private City city;

//    public CityDTO(City city) {
//        this.id = city.getId();
//        this.name = city.getName();
//
//    }
}
