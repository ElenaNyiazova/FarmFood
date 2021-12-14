package com.gpec.FarmFood.enums;

public enum RoleEnum {
    NO_AUTOR_USER("no_autor_user"),
    USER_ROLE("user_role"),
    SELLER_ROLE("seller_role"),
    ADMIN_ROLE("admin_role");

    private String name;

    RoleEnum(final String role) {
        this.name = role;
    }

    @Override
    public String toString() {
        return name;
    }
}
