package com.jiankowalski.basicspring.datasources.config;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import javax.sql.DataSource;

@Configuration
@EnableJpaRepositories("com.jiankowalski.basicspring.datasources")
@Profile("PRD")
public class DatasourceConfiguration {

    @Bean
    public DataSource dataSource() {
        return DataSourceBuilder
                .create()
                .driverClassName("com.mysql.cj.jdbc.Driver")
                .url("jdbc:mysql://127.0.0.1:3306/courses")
                .username("courses")
                .password("courses")
                .build();
    }
}
