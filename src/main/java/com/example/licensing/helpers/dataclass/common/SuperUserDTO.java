package com.example.licensing.helpers.dataclass.common;

import com.example.licensing.entities.SuperUser;
import com.example.licensing.helpers.dataclass.request.IOidHolderRequestBodyDTO;
import com.example.licensing.helpers.validators.annotations.ValidEntityOid;
import lombok.Data;

import javax.validation.constraints.NotBlank;


@Data
public class SuperUserDTO implements IOidHolderRequestBodyDTO {

    @ValidEntityOid(SuperUser.class)
    private String oid;

    @NotBlank
    private String name;

    @NotBlank
    private String username;

    @NotBlank
    private String password;

}
