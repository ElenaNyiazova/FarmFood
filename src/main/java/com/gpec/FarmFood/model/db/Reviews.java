package com.gpec.FarmFood.model.db;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Table(name = "reviews")
@NoArgsConstructor
public class Reviews {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinTable(name = "users", //the table that connects them
            joinColumns = @JoinColumn(name = "id"),//todo rename id ?
            inverseJoinColumns = @JoinColumn(name = "id"))//todo rename id ?
    private Long user_id;

    @OneToOne
    @JoinTable(name = "sellers", //the table that connects them
            joinColumns = @JoinColumn(name = "id"),
            inverseJoinColumns = @JoinColumn(name = "id"))
    private Long seller_id;

    @OneToOne
    @JoinTable(name = "sellers", //the table that connects them
            joinColumns = @JoinColumn(name = "id"),
            inverseJoinColumns = @JoinColumn(name = "grade"))
    private int grade; // can be double from 0 to 5

    private String comment;

}
