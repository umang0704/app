package com.eea.models;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "comment")
@Getter
@Setter
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer commentId;

    @Column(name = "comment")
    private String comment;

    @ManyToOne
    @JoinColumn(name = "post_id",referencedColumnName = "postId")
    private Post post;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accountId",referencedColumnName = "accountId")
    private Account account;
}
