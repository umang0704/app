package com.eea.controllers;

import com.eea.models.AccountDetails;
import com.eea.services.AccountService;
import com.eea.services.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.*;

@RestController
@RequestMapping(path = "/eea")
@Transactional
public class ResourceController {
    @Autowired
    private AccountService accountService;

    @Autowired
    private PostService postService;

    @GetMapping(path = "/accountImage/{accountId}")
    public ResponseEntity<ByteArrayResource> getProfilePicture(@PathVariable("accountId") Integer accountId) throws IOException {
        AccountDetails accountDetails = accountService.getAccountDetailsByAccountId(accountId);
        byte[] accountImage = accountDetails.getAccountImage();
        if (accountImage == null) {
            File image = new File("src/main/webapp/static/accountAvatar.png");
            accountImage = new byte[(int)image.length()];
            new FileInputStream(image).read(accountImage);
        }
        return ResponseEntity.ok()
                .body(new ByteArrayResource(accountImage));
    }
    @GetMapping(path = "/postImage/{postId}")
    public ResponseEntity<ByteArrayResource> getPostPicture(@PathVariable("postId") Integer postId) throws IOException {
        byte[] accountImage = postService.postImage(postId);
        return ResponseEntity.ok()
                .body(new ByteArrayResource(accountImage));
    }
}
