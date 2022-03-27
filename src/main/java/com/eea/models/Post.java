package com.eea.models;

import javax.persistence.*;
import javax.xml.crypto.Data;
import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "post")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer postId;

    private Date timestamp;

    private String text;

    private byte[] image;

    @OneToMany(fetch = FetchType.EAGER, mappedBy ="commentId")
    private List<Comment> commentsList;
}
