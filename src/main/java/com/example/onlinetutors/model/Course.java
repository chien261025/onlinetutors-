package com.example.onlinetutors.model;

import com.example.onlinetutors.util.enumclass.StatusCourseEnum;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "courses")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Course extends AbstractEntity  {

    @Column(name = "name_course")
    private String nameCourse;

    @Column(name = "key_course")
    private String keyCourse;

    @Column(name = "description_course")
    private String descriptionCourse;

    @Column(name = "price_course")
    private Double priceCourse;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "status_course")
    private StatusCourseEnum statusCourse;

    @Column(name = "author")
    private String author;

    @ManyToMany(mappedBy = "courses", fetch = FetchType.LAZY)
    private List<User> users = new ArrayList<>();
}
