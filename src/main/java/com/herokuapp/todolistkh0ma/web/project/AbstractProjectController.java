package com.herokuapp.todolistkh0ma.web.project;

import com.herokuapp.todolistkh0ma.AuthorizedUser;
import com.herokuapp.todolistkh0ma.model.Project;
import com.herokuapp.todolistkh0ma.service.ProjectService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by kh0ma on 26.01.17.
 */
public abstract class AbstractProjectController {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private ProjectService service;

    public List<Project> getAll()
    {
        int userId = AuthorizedUser.id();
        log.info("getAll projects for User {}", userId);
        return service.getAll(userId);
    }

    public Project get(int id)
    {
        int userId = AuthorizedUser.id();
        log.info("get project {} for User {}", id, userId);
        return service.get(id,userId);
    }

    public Project create(Project project) {
        int userId = AuthorizedUser.id();
        project.setId(null);
        log.info("create project {} for User {}", project, userId);
        return service.save(project, userId);
    }

    public void delete(int id) {
        int userId = AuthorizedUser.id();
        log.info("delete Project for User {}" + id);
        service.delete(id, userId);
    }

    public void update(Project project, int id) {
        int userId = AuthorizedUser.id();
        project.setId(id);
        log.info("update project {} for User {} ", project, userId);
        service.update(project, userId);
    }

    public void sort(String projects) {
        int userId = AuthorizedUser.id();
        log.info("Sort projects [{}]",projects);
        service.sort(projects,userId);
    }
}
