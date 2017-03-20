package com.herokuapp.todolistkh0ma.service;

import com.herokuapp.todolistkh0ma.model.Task;
import com.herokuapp.todolistkh0ma.util.exception.NotFoundException;

import java.util.List;

/**
 * Created by kh0ma on 23.01.17.
 */
public interface TaskService {

    Task save(Task task, int projectId, int userId);

    void delete(int id, int projectId, int userId) throws NotFoundException;

    Task get(int id, int projectId, int userId) throws NotFoundException;

    List<Task> getAll(int projectId, int userId);

    Task update(Task task, int projectId, int userId) throws NotFoundException;

    void setEnabled(boolean enabled, int id,int projectId, int userId);

    void sort(String tasks, int projectId, int userId);
}
