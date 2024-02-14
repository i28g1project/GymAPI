package com.example.gymapi.controller;

import com.example.gymapi.model.User;
import com.example.gymapi.sevice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UsersController {

    @Autowired
    UserService userService;

    @GetMapping("/user")
    public String getUser()
    {
        return "get user";
    }

    @PostMapping("/user")
    public User saveUser(@RequestBody User user)
    {
         return userService.create(user);
    }
}
