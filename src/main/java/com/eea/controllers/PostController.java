package com.eea.controllers;

import com.eea.dto.NewPost;
import com.eea.dto.response.BaseResponse;
import com.eea.models.AccountDetails;
import com.eea.models.Post;
import com.eea.services.AccountService;
import com.eea.services.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "/eea")
@Transactional
public class PostController {
    @Autowired
    private PostService postService;

    @Autowired
    private AccountService accountService;

    @PostMapping(path = "/createPost")
    public ModelAndView createPost(HttpServletRequest request, @ModelAttribute NewPost newPost) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        Integer accountId = (Integer)session.getAttribute("accountId");
        AccountDetails accountDetails = accountService.getAccountDetailsByAccountId(accountId);
        Post post=new Post();
        post.setText(newPost.getText());
        post.setImage(newPost.getImage().getBytes());
        post.setAccountDetails(accountDetails);
        postService.savePost(post);
        BaseResponse baseResponse = new BaseResponse();
        Map<String,Object> data = new HashMap<>();
        List<Post> postByAccountId = postService.getPostByAccountId(accountId);
        data.put("accountDetails",accountDetails);
        data.put("createdPost",postByAccountId.get(postByAccountId.size()-1));
        baseResponse.setData(data);
        baseResponse.setMessage("Post Created Successfully.");
        baseResponse.setMessageType("success");
        modelAndView.addObject("baseResponse",baseResponse);
        modelAndView.setViewName("home");
        return modelAndView;
    }
}
