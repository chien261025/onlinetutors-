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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class TutorController {

    private final UserService userService;
    private final CourseService courseService;

    @GetMapping("/tutor")
    public String getParentDashboard(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        List<Course> courses = this.courseService.handleGetCoursesByEmail(email);
        model.addAttribute("courses", courses);
        return "client/tutor/homeTutor";
    }

    @GetMapping("/tutor/profile")
    public String getTutorProfile(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);
        List<Course> courses = this.courseService.handleGetCoursesByEmail(email);
        model.addAttribute("tutor", user);
        model.addAttribute("courses", courses);
        return "client/tutor/profileTutor";
    }

    @GetMapping("/tutor/profile/update")
    public String updateTutorProfile(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);
        model.addAttribute("tutor", user);
        return "client/tutor/updateProfileTutor";
    }

    @PostMapping("/tutor/update-profile")
    public String postUpdateTutorProfile() {
        return "redirect:/tutor/profile";
    }

    @GetMapping("/tutor/schedule")
    public String getTutorSchedule() {
        return "client/scheduleTutor";
    }

    @GetMapping("/tutor/profile/create-course")
    public String getCreateCourse(Model model) {
        Course course = new Course();
        model.addAttribute("course", course);
        return "client/tutor/createCourse";
    }

    @PostMapping("tutor/createCourse")
    public String postCreateCourse(
            @ModelAttribute("course") Course course,
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        log.info("Course Info: {}", course);
        course.setAuthor(email);
        this.courseService.handleCreateCourse(course);
        return "redirect:/tutor/profile";
    }

}
