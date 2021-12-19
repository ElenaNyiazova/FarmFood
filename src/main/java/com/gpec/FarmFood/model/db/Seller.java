package com.gpec.FarmFood.model.db;

import com.gpec.FarmFood.enums.RoleEnum;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "sellers")
@NoArgsConstructor
public class Seller {

    @Id
    @Column(insertable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;
    private String description;
    int grade;//may be double

    @OneToOne
    @JoinColumn(name = "users_id")
    User user;

    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city;


//    @Transient
//    @OneToMany(mappedBy = "user_reviews")
//    private List<Long> userReviews;
}
