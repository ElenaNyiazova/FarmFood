package com.epam.FarmFood.model.rest;

import com.epam.FarmFood.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserRest {//Buyer

    private Long id;
    private String name;
    private String email;
    private String password;
    private String favoriteSity;

    private Role role;

    private List<Long> favoriteSellers;
    private List<Long> userReviewsIds;
}
