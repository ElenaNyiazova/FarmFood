package com.epam.FarmFood.model.db;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "goods")
@NoArgsConstructor
public class GoodsDAO {

}
