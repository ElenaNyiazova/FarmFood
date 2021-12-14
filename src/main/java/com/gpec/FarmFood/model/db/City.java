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

//    @NotNull
    String city;

    @OneToMany(mappedBy = "report", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    List<Seller> localSellersByCity(String city){
       return SellerServises.getLocalSellers(city);
    }

//    @JoinColumn(name = "city", nullable = false)
//    ALLWORLD,

//    MINSK,
//    KEIV,
//    SAINT_PETERBURG,
//    YEREVAN,
//    ALMATY

}
