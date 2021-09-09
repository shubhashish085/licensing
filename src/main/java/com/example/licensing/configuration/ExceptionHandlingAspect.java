package com.example.licensing.configuration;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.annotation.Configuration;

import java.util.Arrays;

@Slf4j
@Aspect
@Configuration
@RequiredArgsConstructor
public class ExceptionHandlingAspect {

    @AfterThrowing(pointcut = "execution(* com.cokreates.payroll.*.*.*(..))", throwing = "ex")
    public void logBasePackageError(Exception ex) {
        logException(ex);
    }

    @AfterThrowing(pointcut = "execution(* com.cokreates.payroll.*.*.*(..))", throwing = "ex")
    public void logHelperError(Exception ex) {
        logException(ex);
    }

    private void logException(Exception ex) {
        log.error("CLASS: " + ex.getClass().getCanonicalName());
        log.error("CAUSE: " + ex.getCause());
        log.error("MESSAGE: " + ex.getMessage());

        Arrays.stream(ex.getStackTrace())
                .filter(element -> element.getClassName().startsWith("com.cokreates.payroll"))
                .map(StackTraceElement::toString)
                .forEach(log::error);
    }

}
