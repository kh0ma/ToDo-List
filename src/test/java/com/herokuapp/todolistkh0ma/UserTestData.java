package com.herokuapp.todolistkh0ma;

import com.herokuapp.todolistkh0ma.matcher.ModelMatcher;
import com.herokuapp.todolistkh0ma.model.Role;
import com.herokuapp.todolistkh0ma.model.User;


import java.util.Objects;

import static com.herokuapp.todolistkh0ma.model.BaseEntity.START_SEQ;


/**
 * GKislin
 * 24.09.2015.
 */
public class UserTestData {
    public static final int USER_ID = START_SEQ;
    public static final int ADMIN_ID = START_SEQ + 1;

    public static final User USER = new User(USER_ID, "User", "user@rubygarage.com.ua", "password", Role.ROLE_USER);
    public static final User ADMIN = new User(ADMIN_ID, "Admin", "admin@gmail.com", "admin", Role.ROLE_ADMIN, Role.ROLE_USER);

    public static final ModelMatcher<User> MATCHER = ModelMatcher.of(User.class,
            (expected, actual) -> expected == actual ||
                    (Objects.equals(expected.getPassword(), actual.getPassword())
                            && Objects.equals(expected.getId(), actual.getId())
                            && Objects.equals(expected.getName(), actual.getName())
                            && Objects.equals(expected.getEmail(), actual.getEmail())
                            && Objects.equals(expected.isEnabled(), actual.isEnabled())
                            && Objects.equals(expected.getRoles(), actual.getRoles())
                    )
    );
}