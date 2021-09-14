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

    @NotBlank
    private String clientName;

    @NotBlank
    private String macAddress;

    private String generatedToken;

    @NotNull
    private Date startDate;

    private Date endDate;

}
