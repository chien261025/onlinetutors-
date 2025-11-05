package com.example.onlinetutors.controller;

import com.example.onlinetutors.model.Email;
import com.example.onlinetutors.model.Signup;
import com.example.onlinetutors.service.EmailService;
import com.example.onlinetutors.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class DashboardController {

    private final EmailService emailService;
    private final UserService userService;

    @GetMapping("/admin")
    public String getDashboardPage() {
        return "admin/index";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "admin/login";
    }

    @GetMapping("/email")
    public String getEmailPage(Model model) {
        model.addAttribute("email", new Email());
        return "admin/email";
    }

    @GetMapping("/verification-email")
    public String getVerificationEmailPage(Model model) {
        model.addAttribute("email", new Email());
        return "admin/email";
    }

    @GetMapping("/signup")
    public String getSignupPage(Model model) {
        model.addAttribute("newSignUp", new Signup());
        return "admin/Signup";
    }

    @PostMapping("/signup")
    public String handleSignup(Model model, @Valid @ModelAttribute("newSignUp") Signup signup) {
        try {
            userService.signupUser(signup);
            model.addAttribute("message", "Vui lòng kiểm tra email để xác thực tài khoản!");
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "admin/signup";
        }
        return "admin/signup";
    }

    @GetMapping("/confirm-email")
    public String handleConfirmEmail(@RequestParam("secretCode") String secretCode) {
        userService.verifyUser(secretCode);
        return "redirect:/login";
    }

}
