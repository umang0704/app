package com.eea.dto;

import org.springframework.web.multipart.MultipartFile;

public class NewPost {
    private String text;
    private MultipartFile image;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }
}
