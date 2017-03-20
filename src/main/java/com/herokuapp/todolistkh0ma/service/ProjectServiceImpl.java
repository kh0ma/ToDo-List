package com.herokuapp.todolistkh0ma.service;

import com.herokuapp.todolistkh0ma.model.Project;
import com.herokuapp.todolistkh0ma.repository.ProjectRepository;
import com.herokuapp.todolistkh0ma.util.exception.ExceptionUtil;
import com.herokuapp.todolistkh0ma.util.exception.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.List;

/**
 * Created by kh0ma on 23.01.17.
 */
@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectRepository repository;

    @Override
    public Project save(Project project, int userId) {
        Assert.notNull(project, "project must not be null");
        return repository.save(project, userId);
    }

    @Override
    public void delete(int id, int userId) throws NotFoundException {
        ExceptionUtil.checkNotFoundWithId(repository.delete(id,userId),id);
    }

    @Override
    public Project get(int id, int userId) throws NotFoundException {
        return ExceptionUtil.checkNotFoundWithId(repository.get(id,userId),id);
    }

    @Override
    public List<Project> getAll(int userId) {
        return repository.getAll(userId);
    }

    @Override
    public Project update(Project project, int userId) throws NotFoundException {
        Assert.notNull(project, "project must not be null");
        return ExceptionUtil.checkNotFoundWithId(repository.save(project,userId),project.getId());
    }

    @Override
    public void sort(String projects, int userId) {
        String[] projectsArray = projects.split(",");
        for (int i = 0; i < projectsArray.length; i++) {
            int id = 0;
            try {
                id = Integer.parseInt(projectsArray[i]);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            Project project = get(id, userId);
            project.setSortId(i);
            save(project,userId);
        }
    }
}
