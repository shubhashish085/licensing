package com.example.licensing.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.util.Date;

@Component
@MappedSuperclass
@Data
public class BaseEntity {

    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
    private String oid;

    @Column(name = "is_deleted",columnDefinition="varchar(10) default 'No'")
    private String isDeleted;

    //todo: replace with user id
    @Column(name = "created_by", nullable = false, updatable = false)
    private String createdBy;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_on", nullable = false, updatable = false)
    @CreatedDate
    @JsonIgnore
    private Date createdOn;

    @Column(name = "updated_by")
    private String updatedBy;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_on")
    @LastModifiedDate
    @JsonIgnore
    private Date updatedOn;

}

