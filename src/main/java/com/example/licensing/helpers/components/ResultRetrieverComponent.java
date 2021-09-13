package com.example.licensing.helpers.components;

import com.example.licensing.helpers.dataclass.request.IRequestBodyDTO;

import java.util.List;

public interface ResultRetrieverComponent<R extends IRequestBodyDTO,B extends IRequestBodyDTO> {
     List<R> retrieve(B requestDTO);
}
