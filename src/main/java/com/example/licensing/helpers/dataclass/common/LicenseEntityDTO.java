package com.example.licensing.helpers.dataclass.common;

import com.example.licensing.entities.LicenseEntity;
import com.example.licensing.helpers.dataclass.request.IOidHolderRequestBodyDTO;
import com.example.licensing.helpers.validators.annotations.ValidEntityOid;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
public class LicenseEntityDTO implements IOidHolderRequestBodyDTO {

    @ValidEntityOid(LicenseEntity.class)
    private String oid;

    @NotBlank(message = "Client Name can not be empty")
    private String clientName;

    @NotBlank(message = "Mac Address can not be empty")
    private String macAddress;

    @NotBlank(message = "Token can not be empty")
    private String token;

    @NotNull(message =  "Start Date can not be empty")
    private Date startDate;

    private Date endDate;

}
