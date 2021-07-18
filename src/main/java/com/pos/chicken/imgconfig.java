package com.pos.chicken;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class imgconfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        System.out.println("MyPicConfig 圖檔設定");
		registry.addResourceHandler("/img/**").addResourceLocations("file:C:\\JavaFramework\\eclipse-workspace\\pos-3.0\\src\\main\\resources\\static\\img\\");
	}

}
