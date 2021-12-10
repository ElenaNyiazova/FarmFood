package com.epam.FarmFood.constants;

@SuppressWarnings("squid:S1214")
public interface Endpoints {

    String CSS = "/static/css/{.*\\.css$}";

    String JS = "/static/js/{.*\\.js$}";

    String MANIFEST = "/manifest.json";

    String ICON = "/favicon.ico";

    String ID = "/{id}";

    String PAGE_USERS = "/users";

    String PAGE_ERROR = "/error";

    String MAIN_PAGE = "/main";

    /**
     * API calls:
     */

    String API_PREFIX = "/api/v1";

    /**
     * User management
     */

    String PAGE_LOGIN = "/login";

    String PAGE_USER_PROFILE = "/user";

    String USER_ID = "/{id}";

    String PAGE_USER_REGISTRATION = PAGE_USER_PROFILE + "/registration";

    /**
     * Admin management
     */

    String ADMIN = "/admin";

    /**
     * Actions
     */

    String SUCCESS = "/success ";//сообщение об удачном действии: регистрации, сохранении и т.д

    String WARNING = "/warning";//сообщение об ошибке


}
