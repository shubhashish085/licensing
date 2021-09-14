package com.example.licensing.services;

import com.example.licensing.entities.LicenseEntity;
import com.example.licensing.helpers.constants.Api;
import com.example.licensing.helpers.constants.Constants;
import com.example.licensing.helpers.constants.Pages;
import com.example.licensing.helpers.dataclass.common.LicenseEntityDTO;
import com.example.licensing.helpers.dataclass.common.User;
import com.example.licensing.repositories.LicenseEntityRepository;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import java.util.List;

@Service
public class LicenseEntityService extends BaseService<LicenseEntity, LicenseEntityDTO>{

    private final LicenseEntityRepository licenseEntityRepository;
    private final AuthenticationService authService;

    public LicenseEntityService( LicenseEntityRepository repository,
                             ModelMapper modelMapper,AuthenticationService authService) {
        super(repository, modelMapper);
        this.licenseEntityRepository = repository;
        this.authService = authService;
    }

    public String getListView(ModelMap model){

        List<LicenseEntityDTO> licenseList = super.getList();

        User user = authService.getTheUser();

        model.put(Constants.DATA,licenseList);
        model.put(Constants.USER_INFO,user);

        return Pages.LICENSE_LIST;
    }

    public String getDetailsView(ModelMap model,String oid,String action){

        User user = authService.getTheUser();
        LicenseEntity licenseEntity;

        if(oid != null && action.equalsIgnoreCase(Constants.ACTION_VIEW)){
            licenseEntity = super.getByOid(oid);
            action = Constants.ACTION_VIEW;

        }else if(oid != null && action.equalsIgnoreCase(Constants.ACTION_EDIT)){
            licenseEntity = super.getByOid(oid);
            action = Constants.ACTION_EDIT;
        }
        else{
            //throw new ServiceExceptionHolder.ResourceNotFoundException("Invalid Oid Provided");
            licenseEntity = new LicenseEntity();
            action = Constants.ACTION_EDIT;
        }

        model.put(Constants.DATA,convertForRead(licenseEntity));
        model.put(Constants.USER_INFO,user);
        model.put(Constants.ACTION,action);

        return Pages.LICENSE_DETAIL;
    }


    public String saveLicense(ModelMap model,LicenseEntityDTO dto){

        User user = authService.getTheUser();
        if(dto.getOid() == null || dto.getOid().equalsIgnoreCase("")){
            dto = super.create(dto);
        }else {
            dto = super.update(dto);
        }

        model.put(Constants.DATA,super.getList());
        model.put(Constants.USER_INFO,user);

        return Api.redirect(Api.LICENSE_URL + Api.LIST_URL);
    }


}
