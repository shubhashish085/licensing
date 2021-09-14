package com.example.licensing.helpers.dataclass.request;

import lombok.Data;

@Data
public class OidHolderRequestBodyDTO implements IOidHolderRequestBodyDTO{

    private String oid;

}
