package com.example.onlinetutors.controller;

import com.example.onlinetutors.model.Course;
import com.example.onlinetutors.service.CourseService;
import com.example.onlinetutors.service.UploadFileService;
import jakarta.servlet.http.HttpServletRequest;
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

@Controller
@Slf4j
@RequiredArgsConstructor
public class CourseController {

    private final CourseService courseService;
    private final UploadFileService uploadFileService;

    @GetMapping("/tutor/profile/create-course")
    public String getCreateCourse(Model model) {
        Course course = new Course();
        model.addAttribute("course", course);
        return "client/tutor/createCourse";
    }

    @PostMapping("tutor/createCourse")
    public String postCreateCourse(
            @ModelAttribute("course") Course course,
            HttpServletRequest request,
            @RequestParam("imageCourse") MultipartFile  file
    ) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        log.info("Course Info: {}", course);
        course.setAuthor(email);
        String uploadFile = this.uploadFileService.handleSaveUploadFile(file, "uploads/client/images");
        course.setImageUrl(uploadFile);
        this.courseService.handleCreateCourse(course);
        return "redirect:/tutor/profile";
    }
}
