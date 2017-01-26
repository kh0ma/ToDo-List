package com.herokuapp.todolistkh0ma.service;

import com.herokuapp.todolistkh0ma.model.User;
import com.herokuapp.todolistkh0ma.to.UserTo;
import com.herokuapp.todolistkh0ma.util.exception.NotFoundException;

import java.util.List;

/**
 * Created by kh0ma on 23.01.17.
 */
public interface UserService {

    User save(User user);

    void delete(int id) throws NotFoundException;

    User get(int id) throws NotFoundException;

    User getByEmail(String email) throws NotFoundException;

    List<User> getAll();

    void update(User user);

    void evictCache();

    void enable(int id, boolean enable);

    void update(UserTo user);
}
