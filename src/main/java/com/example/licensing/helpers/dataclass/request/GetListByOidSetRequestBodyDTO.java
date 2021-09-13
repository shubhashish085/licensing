package com.example.licensing.helpers.dataclass.request;


import lombok.Data;

import java.util.List;

@Data
public class GetListByOidSetRequestBodyDTO implements IRequestBodyDTO {

    private List<String> oids;
}
