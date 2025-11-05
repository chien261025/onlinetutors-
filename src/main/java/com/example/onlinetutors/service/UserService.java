package com.example.onlinetutors.service;

import com.example.onlinetutors.model.Signup;
import com.example.onlinetutors.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {

    void handleCreateUser(User user);
    List<User> getAllUsers();
    User getUserById(Long id);
    void handleEditUser(User user);
    void handleUserDeleteId(Long id);
    User getUserByEmail(String email);
    void signupUser(Signup signup);
    String verifyUser(String token);
}
