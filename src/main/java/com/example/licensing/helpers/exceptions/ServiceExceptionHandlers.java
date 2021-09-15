package com.example.licensing.helpers.exceptions;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@Slf4j
@ControllerAdvice
@RequiredArgsConstructor
public class ServiceExceptionHandlers {

    @ExceptionHandler(NoHandlerFoundException.class)
    public ModelAndView handleNoHandlerFoundException(HttpServletRequest request,final NoHandlerFoundException e) {

        ModelAndView mv = new ModelAndView();

        mv.addObject("message", "URL is not in use");
        mv.addObject("url", request.getRequestURL());
        mv.addObject("status",HttpStatus.NOT_FOUND.toString());

        mv.setViewName("error");
        return mv;
    }

    @ExceptionHandler(BindException.class)
    public ModelAndView handleMethodArgumentNotValidException(HttpServletRequest request,final BindException ex){

        ModelAndView mv = new ModelAndView();

        String errorMessage = "";
        Errors validationErrors = ex.getBindingResult();

        for (FieldError fieldError : validationErrors.getFieldErrors())
             errorMessage += fieldError.getDefaultMessage() + " ; ";

        System.out.println(errorMessage);

        mv.addObject("message", errorMessage);
        mv.addObject("url", request.getRequestURL());
        mv.addObject("status",HttpStatus.BAD_REQUEST.toString());

        mv.setViewName("error");
        return mv;
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(HttpServletRequest request, Exception ex){

        ModelAndView mv = new ModelAndView();

        System.out.println("Exception caught " + ex.getClass());

        mv.addObject("message", ex.getMessage());
        mv.addObject("url", request.getRequestURL());
        mv.addObject("status",HttpStatus.BAD_REQUEST.toString());

        mv.setViewName("error");
        return mv;
    }

}
