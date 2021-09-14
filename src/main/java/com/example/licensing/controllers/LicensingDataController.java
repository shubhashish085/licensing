package com.example.licensing.controllers;

import com.example.licensing.helpers.constants.Api;
import com.example.licensing.helpers.constants.Constants;
import com.example.licensing.helpers.dataclass.common.LicenseEntityDTO;
import com.example.licensing.services.LicenseEntityService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = Api.LICENSE_URL)
public class LicensingDataController {

    private final LicenseEntityService licenseService;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
        dateFormat.setLenient(false);
        webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping(value = Api.LIST_URL)
    public String getTheList(ModelMap modelMap){
        return licenseService.getListView(modelMap);
    }

    @GetMapping(value = Api.DETAIL_URL + Api.VIEW_URL)
    public String getTheDetailsForView(@RequestParam(required = false) String id, ModelMap model){
        return licenseService.getDetailsView(model,id, Constants.ACTION_VIEW);
    }

    @GetMapping(value = Api.DETAIL_URL + Api.EDIT_URL)
    public String getTheDetailsForEdit(@RequestParam(required = false) String id, ModelMap model){
        return licenseService.getDetailsView(model,id,Constants.ACTION_EDIT);
    }

    @PostMapping(value = Api.DETAIL_URL + Api.SAVE_URL)
    public String saveLicenseEntity(@Valid @ModelAttribute("data")LicenseEntityDTO dto,ModelMap modelMap){
        return licenseService.saveLicense(modelMap,dto);
    }



}
