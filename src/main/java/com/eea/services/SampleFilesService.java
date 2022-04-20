package com.eea.services;

import com.eea.models.SampleFiles;
import com.eea.repositories.SampleFilesRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.Optional;

@Service
@Transactional(rollbackFor = { SQLException.class })
public class SampleFilesService {
    @Autowired
    private SampleFilesRepo repo;

    public SampleFiles save(SampleFiles files){
        return repo.save(files);
    }

}