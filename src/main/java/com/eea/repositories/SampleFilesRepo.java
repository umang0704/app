package com.eea.repositories;

import com.eea.models.SampleFiles;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SampleFilesRepo extends JpaRepository<SampleFiles,Integer> {

}