package com.herokuapp.todolistkh0ma.web.task;

import com.herokuapp.todolistkh0ma.model.Task;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

/**
 * Created by kh0ma on 08.02.17.
 */
@RestController
@RequestMapping(value = TaskRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class TaskRestController extends AbstractTaskController {
    public static final String REST_URL = "/rest/profile/projects/{projectId}/tasks";

    @GetMapping
    public List<Task> getAll(@PathVariable("projectId") int projectId) {
        return super.getAll(projectId);
    }

    @GetMapping("/{id}")
    public Task get(@PathVariable("projectId") int projectId,
                    @PathVariable("id") int id) {
        return super.get(id,projectId);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("projectId") int projectId,
                       @PathVariable("id") int id) {
        super.delete(id,projectId);
    }

    @PutMapping(value = "{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public void update(@RequestBody Task task,
                       @PathVariable("projectId") int projectId,
                       @PathVariable("id") int id) {
        super.update(task, id, projectId);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Task> createWithLocation(@RequestBody Task task,
                                                   @PathVariable("projectId") int projectId) {
        Task created = super.create(task, projectId);

        URI uriOfNewResource = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path(REST_URL + "/{id}")
                .buildAndExpand(created.getProject().getId(),created.getId()).toUri();

        return ResponseEntity.created(uriOfNewResource).body(created);
    }
}
