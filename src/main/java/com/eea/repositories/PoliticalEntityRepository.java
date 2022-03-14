package com.eea.repositories;

import com.eea.models.PoliticalEntityModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PoliticalEntityRepository extends JpaRepository<Integer, PoliticalEntityModel> {
}
