package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.model.db.Product;
import com.gpec.FarmFood.model.db.Seller;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import java.io.File;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {

    @Id
    private Long id;
    String name;
    String description;
    String weight;
    String unit;
    double price;
    File image;
    Seller seller;

    public ProductDTO(Product product) {
        this.id = product.getId();
        this.name = product.getName();
        this.description = product.getDescription();
        this.weight = product.getWeight();
        this.unit = product.getUnit();
        this.price = product.getPrice();
        this.image = product.getImage();
        this.seller = product.getSeller();
    }
}
