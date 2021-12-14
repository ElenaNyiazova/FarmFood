package com.gpec.FarmFood.configs;

import com.gpec.FarmFood.model.db.Seller;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MainConfig {

    @Bean
    public Seller sellerDAO() {
        return new Seller();
    }
}
