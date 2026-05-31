package com.bolsadeideas.springboot.app;

import java.util.TimeZone;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//import com.bolsadeideas.springboot.app.models.service.IUploadFileService;



@SpringBootApplication
public class SpringBootDataJpaApplication implements CommandLineRunner  {
	
	
	
	public static void main(String[] args) {
		SpringApplication.run(SpringBootDataJpaApplication.class, args);
	}
	@Override
	public void run(String... args) throws Exception {		
		
	}
	
	
	@Bean
	public WebMvcConfigurer corsConfigurer() {
		
		return new WebMvcConfigurer() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/v0").allowedOrigins("/**").allowedMethods("*").allowedHeaders("/**");
			}
		};
	}

}
