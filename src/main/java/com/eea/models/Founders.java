package com.eea.models;

import java.sql.Date;

import javax.persistence.*;

@Entity
@Table(name = "founders")
public class Founders {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer founderId;

    @Column(name = "founder_name")
    private String founderName;

    @Column(name = "founder_birthdate")
    private Date birthDate;
    @Column(name = "founder_age")
    private Integer age;
    @Column(name = "founder_city")
    private String city;
    @Column(name = "founder_state")
    private String state;
    @Column(name = "founder_about")
    private String about;
    @Lob
    @Column(name = "founder_image")
    private byte[] image;

    
    
//    public AccountDetails getAccountDetails() {
//		return accountDetails;
//	}
//
//	public void setAccountDetails(AccountDetails accountDetails) {
//		this.accountDetails = accountDetails;
//	}

	public Integer getFounderId() {
        return founderId;
    }

    public void setFounderId(Integer founderId) {
        this.founderId = founderId;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }


    public String getFounderName() {
        return founderName;
    }

    public void setFounderName(String founderName) {
        this.founderName = founderName;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

}
