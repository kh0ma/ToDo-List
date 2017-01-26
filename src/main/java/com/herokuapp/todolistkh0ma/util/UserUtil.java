package com.herokuapp.todolistkh0ma.util;

import com.herokuapp.todolistkh0ma.model.Role;
import com.herokuapp.todolistkh0ma.model.User;
import com.herokuapp.todolistkh0ma.to.UserTo;

/**
 * Created by kh0ma on 26.01.17.
 */
public class UserUtil {

    public static User createNewFromTo(UserTo newUser) {
        return new User(null, newUser.getName(), newUser.getEmail().toLowerCase(), newUser.getPassword(), Role.ROLE_USER);
    }

    public static User updateFromTo(User user, UserTo userTo) {
        user.setName(userTo.getName());
        user.setEmail(userTo.getEmail().toLowerCase());
        user.setPassword(userTo.getPassword());
        return user;
    }
}
