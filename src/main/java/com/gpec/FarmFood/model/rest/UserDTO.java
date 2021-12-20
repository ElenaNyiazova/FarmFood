package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.enums.RoleEnum;
import com.gpec.FarmFood.model.db.City;
import com.sun.istack.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

    @Id
    private Long userId;
    private String email;
    private String password;
    private boolean isSeller;
    private City city;
    private String name;

//    public CityDTO(City city) {
//        this.id = city.getId();
//        this.name = city.getName();
//
//    }
}
