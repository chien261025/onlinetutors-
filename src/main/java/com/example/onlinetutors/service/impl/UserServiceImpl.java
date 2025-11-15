package com.example.onlinetutors.service.impl;

import com.example.onlinetutors.model.Signup;
import com.example.onlinetutors.model.User;
import com.example.onlinetutors.model.VerificationTokens;
import com.example.onlinetutors.repository.RoleRepository;
import com.example.onlinetutors.repository.SignupRepository;
import com.example.onlinetutors.repository.UserRepository;
import com.example.onlinetutors.repository.VerificationTokensRepository;
import com.example.onlinetutors.service.EmailService;
import com.example.onlinetutors.service.UserService;
import com.example.onlinetutors.util.enumclass.StatusUserEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public  class UserServiceImpl implements UserService {

    @Value("${spring.sendgrid.verification-link}")
    private String link;

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;
    private final SignupRepository signupRepository;
    private final VerificationTokensRepository verificationTokensRepository;
    private final EmailService emailService;

    public UserServiceImpl(UserRepository userRepository,
                           RoleRepository roleRepository,
                           PasswordEncoder passwordEncoder,
                           SignupRepository signupRepository,
                           VerificationTokensRepository verificationTokensRepository,
                           EmailService emailService) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
        this.signupRepository = signupRepository;
        this.verificationTokensRepository = verificationTokensRepository;
        this.emailService = emailService;
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

    @Override
    @Transactional
    public void signupUser(Signup signup) {
        if (userRepository.existsByEmail(signup.getEmail())){
            log.error("Email already in use: {}", signup.getEmail());
            throw new RuntimeException("Email is already in use");
        }
        log.info("Signing up user: {}", signup.getEmail());
        signup.setPassword(passwordEncoder.encode(signup.getPassword()));
        signupRepository.save(signup);

        // tạo token xác thực và gửi email xác thực ở đây
        String token = java.util.UUID.randomUUID().toString();
        VerificationTokens verificationToken = new VerificationTokens(token, signup,
                java.time.LocalDateTime.now().plusHours(24));
        verificationTokensRepository.save(verificationToken);

        // tao link xac thuc
        String verifyUrl = link + "?secretCode=" + token;

        emailService.emailVerificationCode(signup.getEmail(), signup.getName(), verifyUrl);
        log.info("Verification email sent to: {}", signup.getEmail());
    }

    @Override
    public String verifyUser(String token) {
        Optional<VerificationTokens> optionalToken = verificationTokensRepository.findByToken(token);
        if (optionalToken.isPresent()) {
            VerificationTokens tokenSignup = optionalToken.get();
            if (tokenSignup.getExpiryDate().isAfter(java.time.LocalDateTime.now())) {
                Signup signup = tokenSignup.getSignup();
                User user = new User();
                user.setName(signup.getName());
                user.setEmail(signup.getEmail());
                user.setPassword(signup.getPassword());
                user.setStatusUser(StatusUserEnum.ACTIVE);
                user.setRole(roleRepository.findByName("PARENT"));
                userRepository.save(user);
                // xoa token sau khi xac thuc
                verificationTokensRepository.delete(tokenSignup);
                log.info("User verified and created: {}", user.getName());
                return "User verified successfully";
            } else {
                log.error("Verification token expired for token: {}", token);
                return "Verification token has expired";
            }
        }
        return "Invalid Token!";
    }


}
