package com.gpec.FarmFood;

import com.gpec.FarmFood.configs.MainConfig;
import com.gpec.FarmFood.model.db.SellerDAO;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

@SpringBootApplication
public class FarmFoodApplication {

	public static void main(String[] args) {

		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(MainConfig.class);
		SellerDAO sellerDAO = context.getBean(SellerDAO.class);
		System.out.println(sellerDAO.getName() + " hello ");
		//SpringApplication.run(FarmFoodApplication.class, args);
	}

}
