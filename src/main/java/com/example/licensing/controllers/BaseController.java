package com.example.licensing.controllers;

import com.example.licensing.helpers.components.RequestContextComponent;
import com.example.licensing.helpers.dataclass.request.IRequestBodyDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

@Slf4j
public class BaseController {

    @Autowired
    HttpServletRequest request;

    @Autowired
    private RequestContextComponent requestContextComponent;


    protected <B extends IRequestBodyDTO> String send(
            String url,
            ResultRetrieverComponent<R, B> retriever
    ) {

        log.info("RequestSource {}", url);
        log.info("RequestBody {}", requestDTO);

        requestContextComponent.setRequestDTO(requestDTO);
        //requestContextComponent.setHeaderDTO(headerDTO);

        R responseDTO = retriever.retrieve(requestDTO);

        log.info("RequestSource {}", url);
        log.info("ResponseBody {}", responseDTO);

        return responseDTO;
    }

    protected <R extends ServiceResponseDTO, B extends IRequestBodyDTO> R sendForData(
            String url,
            B requestDTO,
            ResultRetrieverComponent<R, B> retriever
    ) {

        //HeaderDTO headerDTO = tokenDecodingComponent.decode(request.getHeader("Authorization"));

        log.info("RequestSource {}", url);
        log.info("RequestBody {}", requestDTO);

        requestContextComponent.setRequestDTO(requestDTO);
        //requestContextComponent.setHeaderDTO(headerDTO);

        R responseDTO = retriever.retrieve(requestDTO);

        log.info("RequestSource {}", url);
        log.info("ResponseBody {}", responseDTO);

        return responseDTO;
    }

}
