package com.example.onlinetutors.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebMVCConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/admin/user/css/**").addResourceLocations("classpath:/static/admin/css/");
        registry.addResourceHandler("/admin/user/assets/**").addResourceLocations("classpath:/static/admin/assets/");
        registry.addResourceHandler("/admin/user/js/**").addResourceLocations("classpath:/static/admin/js/");
        registry.addResourceHandler("/admin/user/lib/**").addResourceLocations("classpath:/static/admin/lib/");
        registry.addResourceHandler("/admin/user/img/**").addResourceLocations("classpath:/static/admin/img/");


    }

}
