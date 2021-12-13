package com.gpec.FarmFood.model.db;

import com.gpec.FarmFood.enums.Role;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Table(name = "seller")
@NoArgsConstructor
public class SellerDAO{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

//    @Column(nullable = false)
    private String name;

//    @Column(nullable = false)
    private String email;

//    @Column(nullable = false)
    private String password;

    @ManyToOne
    @JoinColumn(name = "id")
    private CityDAO cityDAO;

//    @Column(nullable = false)
    private Role role;
}
