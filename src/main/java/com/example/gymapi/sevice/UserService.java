package com.example.gymapi.sevice;

import com.example.gymapi.model.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    public User create(User user);
}
