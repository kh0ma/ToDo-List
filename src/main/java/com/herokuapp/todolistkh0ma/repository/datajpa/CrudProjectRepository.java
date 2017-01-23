package com.herokuapp.todolistkh0ma.repository.datajpa;

import com.herokuapp.todolistkh0ma.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by kh0ma on 23.01.17.
 */
@Transactional(readOnly = true)
public interface CrudProjectRepository extends JpaRepository<Project, Integer> {

    @Modifying
    @Transactional
    @Query("DELETE FROM Project p WHERE p.id=:id AND p.user.id=:userId")
    int delete(@Param("id") int id, @Param("userId") int userId);

    @Override
    Project save(Project project);

    @Query("SELECT p FROM Project p WHERE p.user.id=:userId ORDER BY p.created DESC")
    List<Project> getAll(@Param("userId") int userId);
}
