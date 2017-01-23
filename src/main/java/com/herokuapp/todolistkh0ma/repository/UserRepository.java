package com.herokuapp.todolistkh0ma.repository;

import com.herokuapp.todolistkh0ma.model.User;

import java.util.List;

/**
 * Created by kh0ma on 22.01.17.
 */
public interface UserRepository {
    User save(User user);

    // false if not found
    boolean delete(int id);

    // null if not found
    User get(int id);

    // null if not found
    User getByEmail(String email);

    //ORDERED by name
    List<User> getAll();
}
