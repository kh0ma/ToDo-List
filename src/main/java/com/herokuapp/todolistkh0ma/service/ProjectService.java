package com.herokuapp.todolistkh0ma.service;

import com.herokuapp.todolistkh0ma.model.Project;
import com.herokuapp.todolistkh0ma.util.exception.NotFoundException;

import java.util.List;

/**
 * Created by kh0ma on 23.01.17.
 */
public interface ProjectService {

    Project save(Project project, int userId);

    void delete(int id, int userId) throws NotFoundException;

    Project get(int id, int userId) throws NotFoundException;

    List<Project> getAll(int userId);

    Project update(Project project, int userId) throws NotFoundException;
}
