package com.example.licensing.repositories;

import com.example.licensing.entities.SuperUser;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface SuperUserRepository extends ServiceRepository<SuperUser> {

    SuperUser findByUsernameAndIsDeleted(String username,String isDeleted);
}
