package com.example.onlinetutors.controller;

import com.example.onlinetutors.model.Course;
import com.example.onlinetutors.model.Role;
import com.example.onlinetutors.model.User;
import com.example.onlinetutors.service.CourseService;
import com.example.onlinetutors.service.MomoService;
import com.example.onlinetutors.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ParentController {

    private final CourseService courseService;
    private final UserService  userService;
    private final MomoService momoService;

    @GetMapping("/home-parent")
    public String getHomePage(Model model) {
        log.info("Accessing home page");
        model.addAttribute("role", "PARENT");
        return "client/parent/homeParent";
    }

    @GetMapping("/parent/courses")
    public String getCoursesPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        List<String> subjects = List.of("TOAN",
                "LY",
                "HOA",
                "SINH",
                "ANH",
                "SU",
                "ĐIA",
                "VAN");
        if(session == null) {
            model.addAttribute("subjects", subjects);
            return "client/parent/courseParent";
        }
        String roleName = (String) session.getAttribute("role");
        model.addAttribute("subjects", subjects);
        model.addAttribute("role", roleName);
        log.info("Accessing courses page");
        return "client/parent/courseParent";
    }

    @GetMapping("/parent/courses/details")
    public String getCoursesDetailsPage(Model model, @RequestParam("id") Long id) {
        Course course = this.courseService.handleGetCourseById(id);
        model.addAttribute("course", course);
        log.info("Accessing course details page");
        return "client/parent/listCourse";
    }

    @GetMapping("/parent/profile")
    public String getProfilePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User parent = this.userService.getUserByEmail(email);
        model.addAttribute("role", "PARENT");
        model.addAttribute("parent", parent);
        log.info("Accessing profile page");
        return "client/parent/parentProfile";
    }

    @GetMapping("/parent/profile/update")
    public String updateParentProfile(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);
        model.addAttribute("parent", user);
        log.info("Accessing update profile page");
        return "client/parent/updateProfileParent";
    }

    @PostMapping("/parent/update-profile")
    public String postUpdateTutorProfile(@ModelAttribute("parent") User user,
                                         @RequestParam("imageUser") MultipartFile file) {
        Role role = new Role();
        role.setName("PARENT");
        user.setRole(role);
        this.userService.handleEditUser(user, file);
        return "redirect:/parent/profile";
    }

    @GetMapping("/parent/details")
    public String getParentDetailsPage(Model model, @RequestParam("id") Long id) {
        Course course = this.courseService.handleGetCourseById(id);
        User author = this.userService.getUserByEmail(course.getAuthor());
        model.addAttribute("course", course);
        model.addAttribute("author", author);
        model.addAttribute("note", "Thanh toán hóa đơn");

        log.info("Accessing parent details page");
        return "client/parent/courseDetailed";
    }

    @GetMapping("/payment/momo-qr")
    public String getBuyCoursePage(@RequestParam("amount") String  amount,
                                   @RequestParam("note") String note,
                                      @RequestParam("id") Long id,
                                      Model model
                                   ) throws Exception {
        String paymentUrl = this.momoService.handleMomoPayment(amount, note);
        String qrBase64 = this.momoService.generateQRCode(paymentUrl);
        log.info("Accessing buy course page");
        model.addAttribute("amount", amount);
        model.addAttribute("note", note);
        model.addAttribute("qrBase64", qrBase64);
        model.addAttribute("courseId", id);
        return "client/parent/buyCourse";
    }

}
