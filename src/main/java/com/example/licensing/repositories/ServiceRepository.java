package com.example.licensing.repositories;

import com.example.licensing.entities.BaseEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import java.util.List;
import java.util.Optional;

@NoRepositoryBean
public interface ServiceRepository<E extends BaseEntity> extends JpaRepository<E, String> {
    Optional<E> findByOidAndIsDeleted(String oid, String isDeleted);
    List<E> findByIsDeleted(String isDeleted);

}
