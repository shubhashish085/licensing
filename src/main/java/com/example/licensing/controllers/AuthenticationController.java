package com.example.licensing.controllers;

import com.example.licensing.services.AuthenticationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@RequiredArgsConstructor
@Controller
public class AuthenticationController{

    private final AuthenticationService authService;

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        return authService.login(model,error,logout);
    }

    @GetMapping({"/", "/welcome"})
    public String welcome(ModelMap model) {
        return authService.welcome(model);
    }

}
