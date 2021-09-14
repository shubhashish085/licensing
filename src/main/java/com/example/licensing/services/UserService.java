package com.example.licensing.services;

import com.example.licensing.entities.SuperUser;
import com.example.licensing.helpers.dataclass.common.User;
import com.example.licensing.helpers.exceptions.ServiceExceptionHolder;
import com.example.licensing.repositories.SuperUserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service("userService")
public class UserService implements UserDetailsService {

    private final SuperUserRepository superUserRepository;

    public UserDetails convertSuperUserToUserDetails(SuperUser superUser){
        return new User(superUser);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        SuperUser superUser = superUserRepository.findByUsernameAndIsDeleted(username,"No");

        if(superUser == null){
            throw new ServiceExceptionHolder.ResourceNotFoundException("No User Found : " + username);
        }

        return convertSuperUserToUserDetails(superUser);
    }


}
