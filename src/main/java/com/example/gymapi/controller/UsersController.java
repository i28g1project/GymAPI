package com.example.gymapi.controller;

import com.example.gymapi.model.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UsersController {

    @GetMapping("/user")
    public String getUser()
    {
        return "get user";
    }

    @PostMapping("/user")
    public String createUser(@RequestBody User user)
    {
        System.out.println(user);
        return "create user";
    }
}
