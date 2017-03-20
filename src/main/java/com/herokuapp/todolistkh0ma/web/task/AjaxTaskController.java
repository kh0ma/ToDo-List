package com.herokuapp.todolistkh0ma.web.task;

import com.herokuapp.todolistkh0ma.model.Task;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

import static com.herokuapp.todolistkh0ma.web.task.AjaxTaskController.AJAX_URL;

/**
 * Created by kh0ma on 11.02.17.
 */
@RestController
@RequestMapping(value = AJAX_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class AjaxTaskController extends AbstractTaskController{

    public static final String AJAX_URL = "/ajax/profile/projects/{projectId}/tasks";

    @GetMapping
    public List<Task> getAll(@PathVariable("projectId") int projectId) {
        return super.getAll(projectId);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("projectId") int projectId,
                       @PathVariable("id") int id) {
        super.delete(id,projectId);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Task> createWithLocation(@RequestBody Task task,
                                                   @PathVariable("projectId") int projectId) {
        Task created = super.create(task, projectId);

        URI uriOfNewResource = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path(AJAX_URL + "/{id}")
                .buildAndExpand(created.getProject().getId(),created.getId()).toUri();

        return ResponseEntity.created(uriOfNewResource).body(created);
    }

    @GetMapping("/{id}")
    public Task get(@PathVariable("projectId") int projectId,
                    @PathVariable("id") int id) {
        return super.get(id,projectId);
    }

    @PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public void update(@RequestBody Task task,
                       @PathVariable("projectId") int projectId,
                       @PathVariable("id") int id) {
        super.update(task, id, projectId);
    }

    @PostMapping(value = "/{id}/status")
    public void setEnabled(@RequestParam("done") boolean done,
                           @PathVariable("projectId") int projectId,
                           @PathVariable("id") int id) {
        super.setEnabled(done,id,projectId);
    }

    @PostMapping(value = "/sort")
    public void sort(@RequestParam("tasks") String tasks,
                     @PathVariable("projectId") int projectId) {
        super.sort(tasks,projectId);
    }
}
