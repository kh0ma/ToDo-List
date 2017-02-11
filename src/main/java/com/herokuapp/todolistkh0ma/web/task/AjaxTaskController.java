package com.herokuapp.todolistkh0ma.web.task;

import com.herokuapp.todolistkh0ma.model.Task;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
