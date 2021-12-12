package com.epam.FarmFood.model.rest;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BuyerRest extends AdminRest {

    private List<Long> favoriteSellers;
    private List<Long> userReviewsIds;
}
