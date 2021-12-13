package com.epam.gpec.FarmFood.model.db;


import com.epam.gpec.FarmFood.servises.SellerServises;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "cities")
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CityDAO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

//    @NotNull
    String city;

    @OneToMany(mappedBy = "report", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    List<SellerDAO> localSellersByCity(String city){
       return SellerServises.getLocalSellers(city);
    }
//    @JoinColumn(name = "city", nullable = false)
//    ALLWORLD,
//    MINSK,
//    KIEV,
//    SAINT_PITERBURG,
//    BUDAPEST,
//    YEREVAN,
//    ALMATY
}
