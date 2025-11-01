package com.example.onlinetutors.model;

import com.example.onlinetutors.util.enumclass.StatusUserEnum;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "users")
@AllArgsConstructor
@NoArgsConstructor
public class User extends AbstractEntity {

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "phone")
    private String phone;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private StatusUserEnum statusUser;

    @Column(name = "qualification")
    private String qualification;

    @Column(name = "experience")
    private String experience;

    @Column(name = "profile_description")
    private String profileDescription;

    @Column(name = "address")
    private String address;

    @Column(name = "location")
    private String location;

    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

}
