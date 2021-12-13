package com.epam.gpec.FarmFood.model.db;

import com.epam.gpec.FarmFood.enums.Role;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Table(name = "admin")
@NoArgsConstructor
public class AdminDAO {

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

}
