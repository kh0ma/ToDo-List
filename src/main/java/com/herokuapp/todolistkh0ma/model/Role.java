package com.herokuapp.todolistkh0ma.model;

import org.springframework.security.core.GrantedAuthority;

/**
 * Created by kh0ma on 22.01.17.
 */
public enum Role implements GrantedAuthority {
    ROLE_USER,
    ROLE_ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
