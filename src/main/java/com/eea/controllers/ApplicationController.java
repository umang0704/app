package com.eea.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.eea.dto.LogInFormDTO;
import com.eea.dto.ProfileDataDto;
import com.eea.dto.UpdatePasswordDto;
import com.eea.models.Account;
import com.eea.models.AccountDetails;
import com.eea.models.Post;
import com.eea.services.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.eea.dto.SignUpFormDto;
import com.eea.dto.response.BaseResponse;
import com.eea.services.AccountService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "/eea")
@Transactional
public class ApplicationController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private PostService postService;

    @GetMapping(path = "/index")
    public ModelAndView sendList(Model model) {
        ModelAndView modelAndView = new ModelAndView();
        BaseResponse baseResponse = new BaseResponse();
        modelAndView.addObject("baseRespoRnse", baseResponse);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @GetMapping(path = "/signUp")
    public ModelAndView signUpPage(Model model) {
        ModelAndView modelAndView = new ModelAndView();
        BaseResponse baseResponse = new BaseResponse();
        modelAndView.addObject("baseResponse", baseResponse);
        modelAndView.setViewName("signUp");
        return modelAndView;
    }

    @PostMapping(path = "/createAccount")
    public ModelAndView createAccount(@ModelAttribute SignUpFormDto signUpFormDto, Model model) {
        ModelAndView modelAndView = new ModelAndView("signUp");
        BaseResponse baseResponse;
        if(signUpFormDto.getAccountPassword().equals(signUpFormDto.getAccountConfirmPassword())) {
            baseResponse = accountService.createAccount(signUpFormDto);
        }else{
            baseResponse = new BaseResponse();
            baseResponse.setMessage("Please Check Re-Entered Password.");
            baseResponse.setMessageType("danger");
        }
        modelAndView.addObject("baseResponse", baseResponse);
        return modelAndView;
    }

    @PostMapping(path = "/login")
    public ModelAndView logIn(@ModelAttribute LogInFormDTO logInFormDTO) {
        ModelAndView modelAndView = new ModelAndView("home");
        Account account = accountService.checkCredentials(logInFormDTO);
        BaseResponse baseResponse = new BaseResponse();
        if (account == null) {
            baseResponse.setMessageType("danger");
            baseResponse.setMessage("Wrong Credentials. Please Check and LogIn again..");
        } else {
            Map<String, Object> map = new HashMap<>();
            AccountDetails accountDetails = accountService.getAccountDetailsByAccountEmail(account.getAccountEmail());
            map.put("accountDetails", accountDetails);
            baseResponse.setData(map);
            modelAndView.addObject("baseResponse", baseResponse);
        }
        return modelAndView;
    }

    @PostMapping(path = "/profile")
    public ModelAndView profile(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        BaseResponse baseResponse = new BaseResponse();
        HttpSession session = request.getSession();
        Integer accountId = (Integer) session.getAttribute("accountId");
        if (accountId != null) {
            Map<String,Object> map = new HashMap<>();
            AccountDetails accountDetails = accountService.getAccountDetailsByAccountId(accountId);
            map.put("accountDetails",accountDetails);

            baseResponse.setData(map);
            modelAndView.addObject("baseResponse", baseResponse);
            modelAndView.setViewName("profileSettings");
        } else {
            baseResponse.setMessage("Session Timed Out. Please LogIn Again.");
            baseResponse.setMessageType("danger");
            modelAndView.addObject("baseResponse", baseResponse);
            modelAndView.setViewName("index");
        }
        return modelAndView;
    }

    @PostMapping(path = "/update")
    public ModelAndView updateProfile(HttpServletRequest request, @ModelAttribute ProfileDataDto profileDataDto) throws IOException {
        ModelAndView modelAndView = new ModelAndView();
        BaseResponse baseResponse = new BaseResponse();
        HttpSession session = request.getSession();
        Integer accountId = (Integer) session.getAttribute("accountId");
        if(accountId!=null){
            baseResponse.setMessage("Profile Updated Successfully.");
            baseResponse.setMessageType("success");
            Map<String,Object> map = new HashMap<>();
            AccountDetails accountDetails = accountService.getAccountDetailsByAccountId(accountId);
            accountDetails.getAccount().setAccountName(profileDataDto.getAccountName());
            accountDetails.setAbout(profileDataDto.getAbout());
            if(profileDataDto.getAccountImage().getOriginalFilename().length()!=0) {
                accountDetails.setAccountImage(profileDataDto.getAccountImage().getBytes());
            }
            accountDetails = accountService.saveAccountDetails(accountDetails);

            map.put("accountDetails",accountDetails);

            baseResponse.setData(map);
            modelAndView.addObject("baseResponse", baseResponse);
            modelAndView.setViewName("profileSettings");
        }else{
            baseResponse.setMessage("Session Timed Out. Please LogIn Again.");
            baseResponse.setMessageType("danger");
            modelAndView.addObject("baseResponse", baseResponse);
            modelAndView.setViewName("index");
        }
        return modelAndView;
    }

    @GetMapping(path="/home/{accountId}")
    public ModelAndView goToHome(@PathVariable(name = "accountId") Integer accountId){
        ModelAndView modelAndView = new ModelAndView();
        BaseResponse baseResponse = new BaseResponse();
        Map<String,Object> data = new HashMap<>();
        AccountDetails accountDetails = accountService.getAccountDetailsByAccountId(accountId);
        data.put("accountDetails",accountDetails);
        baseResponse.setData(data);
        modelAndView.addObject("baseResponse",baseResponse);
        modelAndView.setViewName("home");
        return modelAndView;
    }

    @GetMapping(path = "/logout")
    public ModelAndView logout(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("index");
        request.getSession().invalidate();
        BaseResponse baseResponse = new BaseResponse();
        baseResponse.setMessage("Logged out successfully.!");
        baseResponse.setMessageType("success");
        modelAndView.addObject("baseResponse",baseResponse);
        return modelAndView;
    }

    @GetMapping(path = "/posts")
    public ModelAndView myPosts(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("myPosts");
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(300);
        Integer accountId = (Integer) session.getAttribute("accountId");
        AccountDetails accountDetails = accountService.getAccountDetailsByAccountId(accountId);
        List<Post> posts = postService.getPostByAccountId(accountId);
        accountDetails.setAccountPost(posts);
        session.setAttribute("accountDetails",accountDetails);
        return modelAndView;
    }

    @PostMapping(path = "/deletePost/{accountId}/{postId}")
    public ModelAndView deletePost(HttpServletRequest request,@PathVariable(name = "postId") Integer postId,@PathVariable(name = "accountId")Integer accountId){
        ModelAndView modelAndView = new ModelAndView("myPosts");
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(300);
        postService.deletePost(postId,accountId);
        AccountDetails accountDetails = accountService.getAccountDetailsByAccountId(accountId);
        List<Post> posts = postService.getPostByAccountId(accountId);
        accountDetails.setAccountPost(posts);
        session.setAttribute("accountDetails",accountDetails);
        return modelAndView;
    }

    @PostMapping(path = "/accountSetting")
    public ModelAndView openAccountSetting(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(300);
        Integer accountId = (Integer) session.getAttribute("accountId");
        AccountDetails accountDetails = accountService.getAccountDetailsByAccountId(accountId);
        session.setAttribute("accountDetails",accountDetails);
        modelAndView.setViewName("accountSetting");
        return modelAndView;
    }

    @PostMapping(path = "/updateAccountPassword")
    public ModelAndView updateAccountPassword(HttpServletRequest request,@ModelAttribute UpdatePasswordDto updatePasswordDto){
        ModelAndView modelAndView = new ModelAndView();
        BaseResponse baseResponse = new BaseResponse();
        HttpSession session = request.getSession();
        Integer accountId = (Integer) session.getAttribute("accountId");
        if(updatePasswordDto.getNewAccountPassword().equals(updatePasswordDto.getConfirmNewAccountPassword())) {
            Account account = accountService.getAccountDetailsByAccountId(accountId).getAccount();
            account.setAccountPassword(updatePasswordDto.getNewAccountPassword());
            accountService.saveAccount(account);
            baseResponse.setMessage("Password Updated Successfully.");
            baseResponse.setMessageType("success");
            session.setAttribute("baseResponse",baseResponse);
        }else{
            baseResponse.setMessage("Please Check Re-Entered Password.");
            baseResponse.setMessageType("danger");
            session.setAttribute("baseResponse",baseResponse);
        }
        modelAndView.setViewName("accountSetting");
        return modelAndView;
    }
}
