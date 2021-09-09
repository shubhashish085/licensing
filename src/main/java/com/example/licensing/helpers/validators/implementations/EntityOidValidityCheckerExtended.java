package com.example.licensing.helpers.validators.implementations;

import com.example.licensing.entities.BaseEntity;
import com.example.licensing.helpers.validators.annotations.ValidEntityOid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.RequestScope;

@Component
@RequestScope
@RequiredArgsConstructor
public class EntityOidValidityCheckerExtended implements ConstraintValidator<ValidEntityOid, String> {

    private final RepositoryFactoryComponent repositoryFactoryComponent;

    private Class<? extends BaseEntity> entityClass;

    @Override
    public void initialize(ValidEntityOid annotation) {
        entityClass = annotation.value();
    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        return s == null || repositoryFactoryComponent.getRepository(entityClass).findByOidAndIsDeleted(s, "No").isPresent();
    }

}