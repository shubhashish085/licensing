package com.example.licensing.helpers.components;

import com.example.licensing.entities.BaseEntity;
import com.example.licensing.repositories.ServiceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.lang.reflect.ParameterizedType;
import java.util.List;


@Component
@RequiredArgsConstructor
public class RepositoryFactoryComponent {

    private final List<ServiceRepository> serviceRepositories;

    public <E extends BaseEntity> ServiceRepository<E> getRepository(Class<E> entityClass) {
        //noinspection unchecked

        return (ServiceRepository<E>) serviceRepositories.stream()
                .filter(sr -> isMatchingType(sr, entityClass))
                .findFirst()
                .orElse(null);
    }

    private boolean isMatchingType(ServiceRepository repository, Class clazz) {


        return ((ParameterizedType) ((Class) repository.getClass()
                .getGenericInterfaces()[0])
                .getGenericInterfaces()[0])
                .getActualTypeArguments()[0]
                .getTypeName().equals(clazz.getTypeName());
    }
}

