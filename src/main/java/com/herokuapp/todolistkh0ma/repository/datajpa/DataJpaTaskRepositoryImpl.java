package com.herokuapp.todolistkh0ma.repository.datajpa;

import com.herokuapp.todolistkh0ma.model.Task;
import com.herokuapp.todolistkh0ma.repository.ProjectRepository;
import com.herokuapp.todolistkh0ma.repository.TaskRepository;
import com.herokuapp.todolistkh0ma.repository.UserRepository;
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
    ProjectRepository projectRepository;

    @Autowired
    UserRepository userRepository;

    @Override
    @Transactional
    public Task save(Task task, int projectId, int userId) {
        if (!task.isNew() && get(task.getId(), projectId, userId) == null) {
            return null;
        }
        task.setProject(projectRepository.get(projectId,userId));
        task.setUser(userRepository.get(userId));
        return crudRepository.save(task);
    }

    @Override
    public boolean delete(int id, int projectId, int userId) {
        return crudRepository.delete(id, projectId, userId) != 0;
    }

    @Override
    public Task get(int id, int projectId, int userId) {
        Task task = crudRepository.findOne(id);
        return task != null && task.getProject().getId() == projectId && task.getUser().getId() == userId ? task : null;
    }

    @Override
    public List<Task> getAll(int projectId, int userId) {
        return crudRepository.getAll(projectId, userId);
    }
}
