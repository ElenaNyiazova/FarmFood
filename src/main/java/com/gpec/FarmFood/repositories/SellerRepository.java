package com.gpec.FarmFood.repositories;

import com.gpec.FarmFood.model.db.Seller;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface SellerRepository extends JpaRepository<Seller, Long> {
    List<Seller> findAll();
//    {
//        List<Seller> list = new ArrayList<Seller>();
//        list.add(new Seller());
//        return list;   //"products:[product_id: 789, seller_id: 123456, product_category: fruits,product_name: apple,";
////                "product_weight": "1 kg",
////                "product_price": "8", //local currency
////                "product_image": "apple.jpg",
////
////            "product_id": 790,
////                "seller_id": 123456,
////                "product_category": "fruits",
////                "product_name": "apricot",
////                "product_weight": "1 kg",
////                "product_price": "12",
////                "product_image": "apricot.png"]
//    }
}
