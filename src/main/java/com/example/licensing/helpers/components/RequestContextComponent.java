package com.example.licensing.helpers.components;

import com.example.licensing.helpers.dataclass.common.IdentityDTO;
import lombok.Data;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.RequestScope;

import java.util.Map;

@Component
@RequestScope
@Data
public class RequestContextComponent {

    private IdentityDTO identity;

    private Map<String,Object> data;

}
