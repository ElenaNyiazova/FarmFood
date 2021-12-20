package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.model.db.Category;
import com.gpec.FarmFood.model.db.City;
import com.gpec.FarmFood.model.db.Products;
import com.gpec.FarmFood.model.db.Seller;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.File;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductsDTO {

    @Id
    private Long id;
    String name;
    String description;
    String weight;
    String unit;
    double price;
    File image;
    Seller seller;

    public ProductsDTO(Products products) {
        this.id = products.getId();
        this.name = products.getName();
        this.description = products.getDescription();
        this.weight = products.getWeight();
        this.unit = products.getUnit();
        this.price = products.getPrice();
        this.image = products.getImage();
        this.seller = products.getSeller();
    }
}
