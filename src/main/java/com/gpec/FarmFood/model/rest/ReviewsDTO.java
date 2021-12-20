package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.model.db.City;
import com.gpec.FarmFood.model.db.Reviews;
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
public class ReviewsDTO {

    @Id
    private Long id;
    private User user;
    private Seller seller;
    private int grade;
    private String comment;

    public ReviewsDTO(Reviews reviews) {
        this.id = reviews.getId();
        //this.user = к

    }
}
