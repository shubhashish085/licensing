package com.example.licensing.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Data
@Table
@EqualsAndHashCode(callSuper = true)
@ToString
public class LicenseEntity extends BaseEntity{

    private String clientName;

    private String macAddress;

    private String generatedToken;

    private Date startDate;

    private Date endDate;

}
