package com.eea.services;

import com.eea.models.Post;
import com.eea.services.helper.PostHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class PostService {

    @Autowired
    private PostHelper postHelper;

    public Post savePost(Post post) {
        post.setTimestamp(new Timestamp(System.currentTimeMillis()));
        return postHelper.savePost(post);
    }
    public byte[] postImage(Integer postId){
        return postHelper.postImage(postId);
    }
    public List<Post> getPostByAccountId(Integer accountId){
        return postHelper.getPostByAccountId(accountId);
    }
    public long deletePost(Integer postId,Integer accountId){
        return postHelper.deletePost(postId,accountId);
    }
}
