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
    @Column(name="Id")
    @ManyToOne
    @JoinTable(
            name = "product_categories",
            joinColumns = @JoinColumn(
                    name = "role_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "privilege_id", referencedColumnName = "id"))

    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    String name;
    String description;
    int weight;
    String unit;
    double price;
    File image;
    File image_blob;
}
