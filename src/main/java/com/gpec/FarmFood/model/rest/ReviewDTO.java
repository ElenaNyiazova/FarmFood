package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.model.db.Review;
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
public class ReviewDTO {

    @Id
    private Long id;
    private User user;
    private Seller seller;
    private int grade;
    private String comment;

    public ReviewDTO(Review reviews) {
        this.id = reviews.getId();
        this.user = reviews.getUser();
        this.seller = reviews.getSeller();
        this.grade = reviews.getGrade();
        this.comment = reviews.getComment();
    }
}
