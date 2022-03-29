package com.eea.repositories;

import com.eea.models.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Post,Integer> {
    Post findByPostId(Integer postId);

    List<Post> findByAccountDetails_Account_AccountId(Integer accountId);

    long deleteByPostIdAndAccountDetails_Account_AccountId(Integer postId, Integer accountId);

}
