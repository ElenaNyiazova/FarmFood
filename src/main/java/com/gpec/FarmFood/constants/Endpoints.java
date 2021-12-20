package com.gpec.FarmFood.constants;

@SuppressWarnings("squid:S1214")
public interface Endpoints {

    String CSS = "/static/css/{.*\\.css$}";

    String JS = "/static/js/{.*\\.js$}";

    String MANIFEST = "/manifest.json";

    String ICON = "/favicon.ico";

    String ID = "/{id}";

    String PAGE_USERS = "/users";

    String PAGE_ERROR = "/error";

    String HOME = "/home";

    String PAGE_LOGIN = "/login";

    String PAGE_USER_PROFILE = "/user";

    String PAGE_USER_REGISTRATION = PAGE_USER_PROFILE + "/registration";

    /**
     * Admin management
     */

    String ADMIN = "/admin";

    /**
     * Actions
     */

    String SUCCESS = "/success ";

    String WARNING = "/warning";

    /**
     * API calls:
     */

    String API_PREFIX = "/api/v1";

    String API_SELLERS = API_PREFIX + "/sellers";

    String API_HOME = API_SELLERS + "/{cityName}";

    String API_SELLER = API_SELLERS + ID;
}
