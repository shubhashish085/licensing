package com.example.licensing.helpers.validators.annotations;

import com.example.licensing.entities.BaseEntity;
import com.example.licensing.helpers.validators.implementations.EntityOidValidityCheckerExtended;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = EntityOidValidityCheckerExtended.class)
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidEntityOid {
    Class<? extends BaseEntity> value();
    String message() default "invalid oid provided";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
