package com.example.onlinetutors.service;

import com.example.onlinetutors.model.Course;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CourseService {
    void handleCreateCourse(Course course);
    List<Course> handleGetCoursesByEmail(String email);

}
