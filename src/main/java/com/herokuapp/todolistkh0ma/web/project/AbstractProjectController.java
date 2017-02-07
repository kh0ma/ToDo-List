package com.herokuapp.todolistkh0ma.web.project;

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

    public List<Project> getAll(int userId)
    {
        log.info("getAll Projects");
        return service.getAll(userId);
    }

    public Project get(int id, int userId)
    {
        log.info("getOne Project");
        return service.get(id,userId);
    }

    public Project create(Project project, int userId) {
        project.setId(null);
        log.info("create Project " + project);
        return service.save(project, userId);
    }

    public void delete(int id, int userId) {
        log.info("delete Project " + id);
        service.delete(id, userId);
    }

    public void update(Project project, int userId) {
        project.setId(userId);
        log.info("update Project " + project);
        service.update(project, userId);
    }
}
