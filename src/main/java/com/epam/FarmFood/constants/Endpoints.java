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

}
