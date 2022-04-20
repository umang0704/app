package com.eea.controllers;

import com.eea.dto.response.BaseResponse;
import com.eea.models.AccountDetails;
import com.eea.models.SampleFiles;
import com.eea.resources.ApplicationResource;
import com.eea.services.AccountService;
import com.eea.services.PostService;
import com.eea.services.ResourceService;
import com.eea.services.SampleFilesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(path = "/eea")
@Transactional
public class ResourceController {
    @Autowired
    private AccountService accountService;

    @Autowired
    private PostService postService;

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private SampleFilesService sampleFilesService;

    @GetMapping(path = "/accountImage/{accountId}")
    public ResponseEntity<ByteArrayResource> getProfilePicture(@PathVariable("accountId") Integer accountId) throws IOException {
        AccountDetails accountDetails = accountService.getAccountDetailsByAccountId(accountId);
        byte[] accountImage = accountDetails.getAccountImage();
        if (accountImage == null) {
            File image = new File("src/main/webapp/static/accountAvatar.png");
            accountImage = new byte[(int) image.length()];
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

//    @GetMapping(path = "/founders")
//    public ModelAndView downloadAllMemberPEFileFormat() throws IOException {
//        ModelAndView modelAndView = new ModelAndView("download");
//        BaseResponse baseResponse = new BaseResponse();
//        Map<String,Object> data = new HashMap<>();
//        data.put("filename","founder.xlsx");
//        data.put("filepath","src/main/resources/static/Founder.xlsx");
//        baseResponse.setData(data);
//        modelAndView.addObject("baseResponse",baseResponse);
//        return modelAndView;
//    }
    @GetMapping(path = "/founders")
    public ResponseEntity<ByteArrayResource> downloadFoundersTemplate() throws IOException {
        SampleFiles sampleFiles = new SampleFiles();
        File file1 = new File("src/main/resources/static/Founder.xlsx");
        FileInputStream fileInputStream = new FileInputStream(file1);
        byte[] data = new byte[(int)file1.length()];
        fileInputStream.read(data);
        sampleFiles.setData(data);
        sampleFiles.setFileName(file1.getName());
        sampleFiles.setFileContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,"filename:"+sampleFiles.getFileName())
                .contentType(MediaType.parseMediaType(sampleFiles.getFileContentType()))
                .body(new ByteArrayResource(sampleFiles.getData()));
    }

    @GetMapping(path = "/leaders")
    public ResponseEntity<ByteArrayResource> downloadLeadersTemplate() throws IOException {
        SampleFiles sampleFiles = new SampleFiles();
        File file1 = new File("src/main/resources/static/Leaders.xlsx");
        FileInputStream fileInputStream = new FileInputStream(file1);
        byte[] data = new byte[(int)file1.length()];
        fileInputStream.read(data);
        sampleFiles.setData(data);
        sampleFiles.setFileName(file1.getName());
        sampleFiles.setFileContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,"filename:"+sampleFiles.getFileName())
                .contentType(MediaType.parseMediaType(sampleFiles.getFileContentType()))
                .body(new ByteArrayResource(sampleFiles.getData()));
    }

    @GetMapping(path = "/achievements")
    public ResponseEntity<ByteArrayResource> downloadAllMemberPEFileFormat() throws IOException {
        SampleFiles sampleFiles = new SampleFiles();
        File file1 = new File("src/main/resources/static/Achievements.xlsx");
        FileInputStream fileInputStream = new FileInputStream(file1);
        byte[] data = new byte[(int)file1.length()];
        fileInputStream.read(data);
        sampleFiles.setData(data);
        sampleFiles.setFileName(file1.getName());
        sampleFiles.setFileContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,"filename:"+sampleFiles.getFileName())
                .contentType(MediaType.parseMediaType(sampleFiles.getFileContentType()))
                .body(new ByteArrayResource(sampleFiles.getData()));
    }

    @PostMapping(path = "/uploadFounderDetails")
    public ModelAndView uploadFounderDetails(@RequestParam("founder-details") MultipartFile file) throws IOException {
        ModelAndView modelAndView = new ModelAndView("onboard");
        BaseResponse baseResponse = new BaseResponse();
        Map<String,Object> data = new HashMap<>();
        baseResponse.setMessage(resourceService.uploadFounder(file));
        baseResponse.setMessageType("primary");
        modelAndView.addObject("baseResponse",baseResponse);
        return modelAndView;
    }
}
