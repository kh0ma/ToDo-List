package com.herokuapp.todolistkh0ma.web.task;

import com.herokuapp.todolistkh0ma.model.Task;
import com.herokuapp.todolistkh0ma.service.TaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by kh0ma on 26.01.17.
 */
public abstract class AbstractTaskController {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private TaskService service;

    public List<Task> getAll(int projectId)
    {
        log.info("getAll Tasks");
        return service.getAll(projectId);
    }

    public Task get(int id, int projectId)
    {
        log.info("getOne Task");
        return service.get(id,projectId);
    }

    public Task create(Task task, int projectId) {
        task.setId(null);
        log.info("create Task " + task);
        return service.save(task, projectId);
    }

    public void delete(int id, int projectId) {
        log.info("delete Task " + id);
        service.delete(id, projectId);
    }

    public void update(Task task, int projectId) {
        task.setId(projectId);
        log.info("update Project " + task);
        service.update(task, projectId);
    }
}
