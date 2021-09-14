package com.example.licensing.helpers.constants;

public interface Api {

    String DETAIL_URL = "/details";
    String VIEW_URL = "/view";
    String EDIT_URL = "/edit";
    String SAVE_URL = "/save";
    String LIST_URL = "/list";
    String LICENSE_URL = "/license";
    String USER_URL = "/user";

    static String redirect(String url) {
        return "redirect:" + url;
    }

}
