package com.herokuapp.todolistkh0ma.repository;

import com.herokuapp.todolistkh0ma.model.Project;

import java.util.List;

/**
 * Created by kh0ma on 22.01.17.
 */
public interface ProjectRepository {
    // null if updated project do not belong to userId
    Project save(Project project, int userId);

    // false if project do not belong to userId
    boolean delete(int id, int userId);

    // null if project do not belong to userId
    Project get(int id, int userId);

    // ORDERED by created
    List<Project> getAll(int userId);
}
