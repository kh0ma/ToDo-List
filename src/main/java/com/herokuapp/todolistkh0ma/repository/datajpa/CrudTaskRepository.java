package com.herokuapp.todolistkh0ma.repository.datajpa;

import com.herokuapp.todolistkh0ma.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by kh0ma on 24.01.17.
 */
@Transactional(readOnly = true)
public interface CrudTaskRepository extends JpaRepository<Task, Integer> {

    @Modifying
    @Transactional
    @Query("DELETE FROM Task t WHERE t.id=:id AND t.project.id=:projectId AND t.user.id=:userId")
    int delete(@Param("id") int id, @Param("projectId") int projectId, @Param("userId") int userId);

    @Query("SELECT t FROM Task t WHERE t.project.id=:projectId AND t.user.id=:userId ORDER BY t.sortId ASC, t.created DESC")
    List<Task> getAll(@Param("projectId") int projectId, @Param("userId") int userId);
}
