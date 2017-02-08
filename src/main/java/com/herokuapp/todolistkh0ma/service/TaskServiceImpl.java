package com.herokuapp.todolistkh0ma.service;

import com.herokuapp.todolistkh0ma.model.Task;
import com.herokuapp.todolistkh0ma.repository.TaskRepository;
import com.herokuapp.todolistkh0ma.util.exception.ExceptionUtil;
import com.herokuapp.todolistkh0ma.util.exception.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.List;

/**
 * Created by kh0ma on 24.01.17.
 */
@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository repository;

    @Override
    public Task save(Task task, int projectId, int userId) {
        Assert.notNull(task, "task must not be null");
        return repository.save(task, projectId, userId);
    }

    @Override
    public void delete(int id, int projectId, int userId) throws NotFoundException {
        ExceptionUtil.checkNotFoundWithId(repository.delete(id,projectId, userId),id);
    }

    @Override
    public Task get(int id, int projectId, int userId) throws NotFoundException {
        return ExceptionUtil.checkNotFoundWithId(repository.get(id,projectId, userId),id);
    }

    @Override
    public List<Task> getAll(int projectId, int userId) {
        return repository.getAll(projectId, userId);
    }

    @Override
    public Task update(Task task, int projectId, int userId) throws NotFoundException {
        Assert.notNull(task,"task must not be null");
        return ExceptionUtil.checkNotFoundWithId(repository.save(task,projectId, userId),task.getId());
    }
}
