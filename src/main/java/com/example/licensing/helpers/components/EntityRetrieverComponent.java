package com.example.licensing.helpers.components;

import com.example.licensing.entities.BaseEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class EntityRetrieverComponent {

    private final RepositoryFactoryComponent repositoryFactoryComponent;


    public <E extends BaseEntity> E getByOidForRead(Class<E> cls, String oid) {
        return getOptionalEntity(cls, oid)
                .orElseThrow(() -> new ServiceExceptionHolder.ResourceNotFoundException(
                        getMessage(oid, cls)));
    }

    public <E extends BaseEntity> List<E> getListByOidsForRead(Class<E> entityClass, List<String> oids){
        return getEntitiesByOids(entityClass,oids);
    }


    public <E extends BaseEntity> E getByOidForWrite(Class<E> cls, String oid) {
        return getOptionalEntity(cls, oid)
                .orElseThrow(() -> new ServiceExceptionHolder.ResourceNotFoundDuringWriteRequestException(
                        getMessage(oid, cls)));
    }


    private <E extends BaseEntity> List<E> getEntitiesByOids(Class<E> cls,List<String> oids){
        return repositoryFactoryComponent.getRepository(cls)
                .findByOidIn(oids);

    }


    private <E extends BaseEntity> Optional<E> getOptionalEntity(Class<E> cls, String oid) {
        return repositoryFactoryComponent.getRepository(cls)
                .findByOidAndIsDeleted(oid, "No");
    }

    private String getMessage(String oid, Class<?> cls) {
        return "No " + String.join(" ", cls.getSimpleName().split("(?=\\p{Upper})"))
                + " Found with ID : " + oid;
    }

}

