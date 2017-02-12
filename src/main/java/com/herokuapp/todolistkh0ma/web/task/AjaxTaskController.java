package com.herokuapp.todolistkh0ma.web.task;

import com.herokuapp.todolistkh0ma.model.Task;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by kh0ma on 11.02.17.
 */
@RestController
@RequestMapping(value = "/ajax/profile/projects/{projectId}/tasks", produces = MediaType.APPLICATION_JSON_VALUE)
public class AjaxTaskController extends AbstractTaskController{
    @GetMapping
    public List<Task> getAll(@PathVariable("projectId") int projectId) {
        return super.getAll(projectId);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("projectId") int projectId,
                       @PathVariable("id") int id) {
        super.delete(id,projectId);
    }
}
