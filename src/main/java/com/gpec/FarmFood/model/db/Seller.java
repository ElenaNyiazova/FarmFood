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
    @Column(name="id", insertable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

//    @Column(nullable = false)
    private String name;
    private String description;
    int grade;
    Long user_id;

    @ManyToOne
    @JoinColumn(name = "city.id")
    private City city;

//    @Column(nullable = false)
    private RoleEnum roleEnum;

    @Transient
   // @OneToMany(mappedBy = "user_reviews")
    private List<Long> userReviews;
}
