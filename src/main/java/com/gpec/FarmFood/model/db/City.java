package com.gpec.FarmFood.model.db;


import com.gpec.FarmFood.servises.SellerServises;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "cities")
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class City {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    String city;

    String description;

    //@OneToMany(mappedBy = "report", cascade = CascadeType.ALL)
    List<Seller> localSellersByCity(String city){
       return null; //SellerServises.getLocalSellers(city);
    }

//    @JoinColumn(name = "city", nullable = false)
}
