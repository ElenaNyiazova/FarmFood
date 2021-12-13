package com.gpec.FarmFood.configs;

import com.gpec.FarmFood.model.db.SellerDAO;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MainConfig {

    @Bean
    public SellerDAO sellerDAO() {
        return new SellerDAO();
    }
}
