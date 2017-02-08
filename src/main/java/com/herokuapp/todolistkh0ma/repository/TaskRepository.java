package com.herokuapp.todolistkh0ma.repository;

import com.herokuapp.todolistkh0ma.model.Task;

import java.util.List;

/**
 * Created by kh0ma on 22.01.17.
 */
public interface TaskRepository {
    // null if updated task do not belong to project
    Task save(Task task, int projectId, int userId);

    // false if task do not belong to project
    boolean delete(int id, int projectId, int userId);

    // null if task do not belong to project
    Task get(int id, int projectId, int userId);

    // ORDERED by created
    List<Task> getAll(int projectId, int userId);
}
