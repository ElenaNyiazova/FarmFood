package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.model.db.Category;
import com.gpec.FarmFood.model.db.City;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CityDTO {

    @Id
    private long id;
    private String name;

    public CityDTO(City city) {
        this.id = city.getId();
        this.name = city.getName();
    }
}
