package com.eea.services;

import com.eea.services.helper.ExcelHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Service
public class ResourceService {
    @Autowired
    private ExcelHelper excelHelper;
    public String uploadFounder(MultipartFile file) throws IOException {
        return excelHelper.readDataFounder(file);
    }
}
