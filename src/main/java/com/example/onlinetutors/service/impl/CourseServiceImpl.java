package com.example.onlinetutors.service.impl;


import com.example.onlinetutors.model.Course;
import com.example.onlinetutors.repository.CourseRepository;
import com.example.onlinetutors.service.CourseService;
import com.example.onlinetutors.util.enumclass.StatusCourseEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class CourseServiceImpl implements CourseService {


    private final CourseRepository courseRepository;

    @Override
    public void handleCreateCourse(Course course) {
        course.setStatusCourse(StatusCourseEnum.ACTIVE);
        this.courseRepository.save(course);
    }

    @Override
    public List<Course> handleGetCoursesByEmail(String email) {
        if (email == null || email.isBlank()) {
            throw new IllegalArgumentException("Email must not be null or blank");
        }
        return courseRepository.findByAuthor(email);
    }

    @Override
    public List<Course> handleGetCoursesBySubject(String subject) {
        if (subject == null || subject.isBlank()) {
            throw new IllegalArgumentException("Subject must not be null or blank");
        }
        return courseRepository.findBySubject(subject);
    }

    @Override
    public List<Course> handleGetAllCourses() {
        return courseRepository.findAll();
    }

    @Override
    public Course handleGetCourseById(Long id) {
        return courseRepository.findById(id).orElseThrow(() -> new RuntimeException("Course not found with id: " + id));
    }
}
