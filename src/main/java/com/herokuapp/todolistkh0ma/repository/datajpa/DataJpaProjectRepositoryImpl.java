package com.herokuapp.todolistkh0ma.repository.datajpa;

import com.herokuapp.todolistkh0ma.model.Project;
import com.herokuapp.todolistkh0ma.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by kh0ma on 23.01.17.
 */
@Repository
public class DataJpaProjectRepositoryImpl implements ProjectRepository{

    @Autowired
    CrudProjectRepository crudRepository;

    @Autowired
    private CrudUserRepository crudUserRepository;

    @Override
    @Transactional
    public Project save(Project project, int userId) {
        if (!project.isNew() && get(project.getId(), userId) == null) {
            return null;
        }
        project.setUser(crudUserRepository.getOne(userId));
        return crudRepository.save(project);
    }

    @Override
    public boolean delete(int id, int userId) {
        return crudRepository.delete(id, userId) != 0;
    }

    @Override
    public Project get(int id, int userId) {
        Project project = crudRepository.findOne(id);
        return project != null && project.getUser().getId() == userId ? project : null;
    }

    @Override
    public List<Project> getAll(int userId) {
        return crudRepository.getAll(userId);
    }
}
