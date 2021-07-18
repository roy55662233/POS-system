package com.pos.chicken;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class i18nrunner implements CommandLineRunner {
	@Autowired
	private MessageSource messageSource;
	//method1
	@Value("${demo.settings.key}")
	private String demoKey1;
	
	//method2
	@Autowired
	private Environment environment;
	
	@Override
	public void run(String... args) throws Exception {
		
		String message=messageSource.getMessage("login.failed",null,Locale.TAIWAN);

		String phrase =environment.getProperty("demo.settings.key");


	}

}
