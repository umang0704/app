package com.eea.models;

import jdk.jfr.events.CertificateId;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "political_entity")
@Getter
@Setter
public class PoliticalEntityModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer politicalEntityId;

    @Column(name = "name",nullable = false)
    private String name;

    @Column(name = "email",nullable = false)
    private String email;

    @Column(name = "password",nullable = false)
    private String password;

    @Column(name = "formed_on",nullable = false)
    private Date formedOn;

    @Column(name = "about", nullable = false)
    private String about;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "website",nullable = false)
    private String website;
}
