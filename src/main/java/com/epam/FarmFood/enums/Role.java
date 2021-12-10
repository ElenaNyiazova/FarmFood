package com.epam.FarmFood.enums;

public enum Role {
    NO_AUTOR_USER("no_autor_user"),
    USER_ROLE("user_role"),
    SELLER("seller"),
    ADMIN_ROLE("admin_role");

    private String name;

    Role(final String role) {
        this.name = role;
    }

    @Override
    public String toString() {
        return name;
    }
}
