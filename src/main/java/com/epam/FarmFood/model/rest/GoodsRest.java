package com.epam.FarmFood.model.rest;

import com.epam.FarmFood.enums.GoodsCategory;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.File;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GoodsRest {//контретные товары

    private Long id;
    private String name;
    private String description;

    private GoodsCategory goodsCategory;
    private Long sellerId;
    private Double weight; //пока в кг по умолчанию, потом можно граммовку/унции добавить
    private Long price;//по умолчанию в долларах
    private File image;//если нет файла картинка по умолчанию


    // добавить картинку к каждому продукту
}
