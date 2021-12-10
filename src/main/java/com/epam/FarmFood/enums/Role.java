package com.epam.FarmFood.enums;

public enum Role {
    NO_AUTOR_USER("no_autor_user"),
    BUYER_ROLE("buyer_role"),
    SELLER_ROLE("seller_role"),
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
