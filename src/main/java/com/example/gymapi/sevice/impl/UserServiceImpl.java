package com.example.gymapi.sevice.impl;

import com.example.gymapi.model.User;
import com.example.gymapi.repository.UserRepository;
import com.example.gymapi.sevice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Override
    public User create(User user) {
        return userRepository.save(user);
    }
}
