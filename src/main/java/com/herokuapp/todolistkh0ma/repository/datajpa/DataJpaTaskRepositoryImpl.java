package com.herokuapp.todolistkh0ma.repository.datajpa;

import com.herokuapp.todolistkh0ma.model.Task;
import com.herokuapp.todolistkh0ma.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by kh0ma on 24.01.17.
 */
@Repository
public class DataJpaTaskRepositoryImpl implements TaskRepository {

    @Autowired
    CrudTaskRepository crudRepository;

    @Autowired
    CrudProjectRepository crudProjectRepository;

    @Override
    @Transactional
    public Task save(Task task, int projectId) {
        if (!task.isNew() && get(task.getId(), projectId) == null) {
            return null;
        }
        task.setProject(crudProjectRepository.getOne(projectId));
        return crudRepository.save(task);
    }

    @Override
    public boolean delete(int id, int projectId) {
        return crudRepository.delete(id, projectId) != 0;
    }

    @Override
    public Task get(int id, int projectId) {
        Task task = crudRepository.findOne(id);
        return task != null && task.getProject().getId() == projectId ? task : null;
    }

    @Override
    public List<Task> getAll(int projectId) {
        return crudRepository.getAll(projectId);
    }
}
