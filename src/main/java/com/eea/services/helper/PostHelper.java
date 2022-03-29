package com.eea.services.helper;

import com.eea.models.Post;
import com.eea.repositories.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

public class PostHelper {

    @Autowired
    private PostRepository postRepository;

    public Post savePost(Post post) {
        return postRepository.save(post);
    }

    public byte[] postImage(Integer postId){
        Post post= postRepository.findByPostId(postId);
        return post.getImage();
    }

    public List<Post> getPostByAccountId(Integer accountId){
        return postRepository.findByAccountDetails_Account_AccountId(accountId);
    }

    public long deletePost(Integer postId,Integer accountId){
        return postRepository.deleteByPostIdAndAccountDetails_Account_AccountId(postId,accountId);
    }

}
