package com.gpec.FarmFood.model.db;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.File;

@Data
@Entity
@Table(name = "products")
@NoArgsConstructor
public class Products {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    String name;
    String description;
    String weight;
    String unit;
    double price;
    File image;

    @ManyToOne
    @JoinColumn(name = "seller.id", nullable = false)
    Seller seller;
}
