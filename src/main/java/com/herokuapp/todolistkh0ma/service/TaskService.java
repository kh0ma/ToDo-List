package com.herokuapp.todolistkh0ma.service;

import com.herokuapp.todolistkh0ma.model.Task;
import com.herokuapp.todolistkh0ma.util.exception.NotFoundException;

import java.util.List;

/**
 * Created by kh0ma on 23.01.17.
 */
public interface TaskService {

    Task save(Task task, int projectId);

    void delete(int id, int projectId) throws NotFoundException;

    Task get(int id, int projectId) throws NotFoundException;

    List<Task> getAll(int projectId);

    Task update(Task task, int projectId) throws NotFoundException;
}
