package com.example.onlinetutors.config;

import com.example.onlinetutors.service.UserService;
import com.sendgrid.SendGrid;
import jakarta.servlet.DispatcherType;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
public class SecurityConfiguration {

    @Value("${spring.sendgrid.api-key}")
    private String sendGridApiKey;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService(UserService userService) {
        return new CustomUserDetailsService(userService);
    }

    // DaoAuthenticationProvider
    // AuthenticationManager bean required for authentication
    @Bean
    public AuthenticationManager authenticationManager(
            AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    public AuthenticationSuccessHandler successHandler() {
        return new CustomSuccessHandle ();
    }

    @Bean
    public SendGrid sendGrid() {
        return new SendGrid(sendGridApiKey);
    }

    // Security filter chain
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http ) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                        .dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE)
                        .permitAll()
                        .requestMatchers( "/login", "/css/**", "/js/**",
                                "/client/**", "/uploads/images/**", "/signup", "/error")
                        .permitAll()
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .anyRequest().authenticated())
                .logout(logout -> logout.deleteCookies("JSESSIONID").invalidateHttpSession(true))
                .formLogin(formLogin -> formLogin
                        .loginPage("/login")
                        .failureUrl("/login?error")
                        .successHandler(successHandler())
                        .permitAll())
                .exceptionHandling(ex -> ex.accessDeniedPage("/error"));

        return http.build();
    }

}
