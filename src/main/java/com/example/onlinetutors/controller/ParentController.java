package com.example.onlinetutors.controller;

import com.example.onlinetutors.model.Course;
import com.example.onlinetutors.model.User;
import com.example.onlinetutors.service.CourseService;
import com.example.onlinetutors.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.http.HttpRequest;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ParentController {

    private final CourseService courseService;
    private final UserService  userService;

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
    public String getCoursesDetailsPage(Model model, @RequestParam("id") String subject) {
        log.info(subject);
        List<Course> courses = this.courseService.handleGetCoursesBySubject(subject);
        model.addAttribute("courses", courses);
        log.info("Accessing course details page");
        return "client/parent/listCourse";
    }

    @GetMapping("/parent/profile")
    public String getProfilePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User parent = this.userService.getUserByEmail(email);
        model.addAttribute("parent", parent);
        log.info("Accessing profile page");
        return "client/parent/parentProfile";
    }


}
