package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.enums.RoleEnum;
import com.gpec.FarmFood.model.db.City;
import com.gpec.FarmFood.model.db.User;
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
    private String name;
    private String email;
    private String password;
    private boolean isSeller;
    private City city;

    public UserDTO(User user) {
        this.userId = user.getId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.password = user.getPassword();
        this.isSeller = user.isSeller();
        this.city = user.getCity();
    }
}
