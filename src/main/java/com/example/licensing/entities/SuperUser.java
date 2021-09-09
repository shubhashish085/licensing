package com.example.licensing.entities;


import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Data
@Table
@EqualsAndHashCode(callSuper = true)
@ToString
public class SuperUser extends BaseEntity{

    private String username;

    private String password;
    
}
