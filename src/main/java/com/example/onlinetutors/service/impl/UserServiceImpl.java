package com.example.onlinetutors.service.impl;

import com.example.onlinetutors.model.User;
import com.example.onlinetutors.repository.RoleRepository;
import com.example.onlinetutors.repository.UserRepository;
import com.example.onlinetutors.service.UserService;
import com.example.onlinetutors.util.enumclass.StatusUserEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository,
                           RoleRepository roleRepository,
                           PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void handleCreateUser(User user) {
        log.info("Creating user: {}", user.getName());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(this.roleRepository.findByName(user.getRole().getName()));
        this.userRepository.save(user);
    }

    @Override
    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    @Override
    public User getUserById(Long id) {
        log.info("Fetching user with id: {}", id);
        Optional<User> user = this.userRepository.findById(id);
        if (user.isPresent()) {
            if (user.get().getStatusUser() == StatusUserEnum.ACTIVE) {
                log.info("User found: {}", user.get().getName());
                return user.get();
            }
        } else {
            log.error("User with id: {} not found", id);
            throw new RuntimeException("User not found");
        }
        log.error("User with id: {} is not active", id);
        throw new RuntimeException("User is not active");
    }

    @Override
    public void handleEditUser(User user) {
        User existingUser = getUserById(user.getId());
        if (existingUser != null) {
            existingUser.setName(user.getName());
            existingUser.setEmail(user.getEmail());
            existingUser.setPhone(user.getPhone());
            existingUser.setAddress(user.getAddress());
            existingUser.setRole(this.roleRepository.findByName(user.getRole().getName()));
            existingUser.setStatusUser(user.getStatusUser());
            this.userRepository.save(existingUser);
        } else {
            log.error("Cannot edit user. User with id: {} not found", user.getId());
            throw new RuntimeException("User not found for editing");
        }
    }

    @Override
    public void handleUserDeleteId(Long id) {
        User user = getUserById(id);
        user.setStatusUser(
                StatusUserEnum.INACTIVE
        );
        this.userRepository.save(user);
    }

    @Override
    public User getUserByEmail(String email) {
        log.info("Fetching user with email: {}", email);
        Optional<User> user = this.userRepository.findByEmail(email);
        if (user.isPresent()) {
            log.info("User found: {}", user.get().getName());
            return user.get();
        } else {
            log.error("User with email: {} not found", email);
            throw new RuntimeException("User not found for editing");
        }
    }
}
