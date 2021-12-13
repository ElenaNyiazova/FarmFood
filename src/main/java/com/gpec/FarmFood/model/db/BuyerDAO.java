package com.gpec.FarmFood.model.db;

import com.gpec.FarmFood.enums.Role;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "buyer")
@NoArgsConstructor
public class BuyerDAO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

//    @Column(nullable = false)
    private String name;

//    @Column(nullable = false)
    private String email;

//    @Column(nullable = false)
    private String password;

    private String favoriteSity;

//    @Column(nullable = false)
    private Role role;

    private List<Long> favoriteSellers;
    private List<Long> userReviewsIds;
}
