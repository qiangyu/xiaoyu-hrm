package com.xiaoyu.hrm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan(basePackages = "com.xiaoyu.hrm.mapper")
public class XiaoyuHrmApplication {

    public static void main(String[] args) {
        SpringApplication.run(XiaoyuHrmApplication.class, args);
    }

}
