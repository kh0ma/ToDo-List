package com.herokuapp.todolistkh0ma.web.task;

import com.herokuapp.todolistkh0ma.AuthorizedUser;
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
        int userId = AuthorizedUser.id();
        log.info("getAll Tasks from Project {} for User {}", projectId, userId);
        return service.getAll(projectId, userId);
    }

    public Task get(int id, int projectId)
    {
        int userId = AuthorizedUser.id();
        log.info("getOne Task with id {} for User {}",id,userId);
        return service.get(id, projectId, userId);
    }

    public Task create(Task task, int projectId) {
        int userId = AuthorizedUser.id();
        task.setId(null);
        log.info("create Task " + task);
        return service.save(task, projectId, userId);
    }

    public void delete(int id, int projectId) {
        int userId = AuthorizedUser.id();
        log.info("delete Task " + id);
        service.delete(id, projectId, userId);
    }

    public void update(Task task, int id, int projectId) {
        int userId = AuthorizedUser.id();
        task.setId(id);
        log.info("update Task " + task);
        service.update(task, projectId, userId);
    }

    public void setEnabled(boolean enabled, int id, int projectId) {
        int userId = AuthorizedUser.id();
        log.info("Task id=" + id + " is="+ (enabled ? "enable" : "disable"));
        service.setEnabled(enabled,id,projectId,userId);
    }

    public void sort(String tasks, int projectId) {
        int userId = AuthorizedUser.id();
        log.info("Sort tasks [{}] to project = {}",tasks,projectId);
        service.sort(tasks,projectId,userId);
    }
}
