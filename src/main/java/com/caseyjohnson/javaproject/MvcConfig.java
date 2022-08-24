package com.caseyjohnson.javaproject;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		Path workoutUploadDir = Paths.get("./workout-images");
		String workoutUploadPath = workoutUploadDir.toFile().getAbsolutePath();
		
		registry.addResourceHandler("/workout-images/**").addResourceLocations("file:/" + workoutUploadPath + "/");
	}
	
	
}
