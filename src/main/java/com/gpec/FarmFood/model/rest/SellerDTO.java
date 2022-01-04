package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.model.db.City;
import com.gpec.FarmFood.model.db.Seller;
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

    public SellerDTO(Seller seller) {
        this.id = seller.getId();
        this.name = seller.getName();
        this.description = seller.getDescription();
        this.grade = seller.getGrade();
        this.user = seller.getUser();
        this.city = seller.getCity();
    }
}
