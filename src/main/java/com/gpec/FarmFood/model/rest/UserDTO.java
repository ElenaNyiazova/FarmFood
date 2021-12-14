package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.enums.RoleEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

    private Long id;
    private String name;
    private String email;
    private String password;
    private String favoriteSity;

    private RoleEnum roleEnum;
}
