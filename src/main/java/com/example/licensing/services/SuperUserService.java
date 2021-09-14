package com.example.licensing.services;

import com.example.licensing.entities.SuperUser;
import com.example.licensing.helpers.dataclass.common.SuperUserDTO;
import com.example.licensing.repositories.SuperUserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class SuperUserService extends BaseService<SuperUser, SuperUserDTO>{

    private final SuperUserRepository superUserRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public SuperUserService( SuperUserRepository repository,
                              ModelMapper modelMapper,BCryptPasswordEncoder passwordEncoder) {
        super(repository, modelMapper);
        this.superUserRepository = repository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    protected SuperUser convertForCreate(SuperUserDTO dto){

        SuperUser superUser = super.convertForCreate(dto);
        superUser.setPassword(passwordEncoder.encode(dto.getPassword()));
        return superUser;
    }

    @Override
    protected SuperUser convertForUpdate(SuperUserDTO dto,SuperUser superUser){

        superUser = super.convertForUpdate(dto,superUser);
        superUser.setPassword(passwordEncoder.encode(dto.getPassword()));
        return superUser;
    }

}
