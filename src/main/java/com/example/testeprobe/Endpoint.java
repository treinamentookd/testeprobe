package com.example.testeprobe;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@RestController
public class Endpoint {

    @GetMapping
    public String ping(){
        System.out.println("Ping chamado: "+ LocalDateTime.now());
        return "pong";
    }
}
