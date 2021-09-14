package com.example.licensing.services;

import com.example.licensing.entities.SuperUser;
import com.example.licensing.helpers.constants.Constants;
import com.example.licensing.helpers.constants.Pages;
import com.example.licensing.helpers.dataclass.common.LicenseEntityDTO;
import com.example.licensing.helpers.dataclass.common.User;
import com.example.licensing.repositories.SuperUserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import java.util.List;

@RequiredArgsConstructor
@Service
public class AuthenticationService {

    @Autowired
    private LicenseEntityService licenseService;

    private final SuperUserRepository superUserRepository;


    public User getTheUser() {

        String username;

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }

        SuperUser superUser = superUserRepository.findByUsernameAndIsDeleted(username, "No");

        if (superUser == null) {
            return null;
        }

        User user = new User(superUser);

        return user;

    }


    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return Pages.LOGIN;
    }

    public String welcome(ModelMap model) {

        List<LicenseEntityDTO> licenseList = licenseService.getList();

        User user = getTheUser();

        model.put(Constants.DATA,licenseList);
        model.put(Constants.USER_INFO,user);

        return Pages.LICENSE_LIST;
    }



}