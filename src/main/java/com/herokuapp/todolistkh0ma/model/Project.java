package com.herokuapp.todolistkh0ma.model;

import java.time.LocalDateTime;

/**
 * Created by kh0ma on 22.01.17.
 */
public class Project extends BaseEntity {
    private User user;
    private LocalDateTime created;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
