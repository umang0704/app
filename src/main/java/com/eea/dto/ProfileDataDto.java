package com.eea.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProfileDataDto {
    private String accountName;
    private String accountEmail;
    private String about;
    private MultipartFile accountImage;

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getAccountEmail() {
        return accountEmail;
    }

    public void setAccountEmail(String accountEmail) {
        this.accountEmail = accountEmail;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public MultipartFile getAccountImage() {
        return accountImage;
    }

    public void setAccountImage(MultipartFile accountImage) {
        this.accountImage = accountImage;
    }

    @Override
    public String toString() {
        return "ProfileDataDto{" +
                "accountName='" + accountName + '\'' +
                ", accountEmail='" + accountEmail + '\'' +
                ", about='" + about + '\'' +
                ", accountImage=" + accountImage +
                '}';
    }
}
