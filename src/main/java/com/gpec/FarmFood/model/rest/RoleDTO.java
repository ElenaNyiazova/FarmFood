package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.model.db.City;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RoleDTO {
    @Id
    private Long id;
    private String name;

//    public CityDTO(City city) {
//        this.id = city.getId();
//        this.name = city.getName();
//
//    }
}
