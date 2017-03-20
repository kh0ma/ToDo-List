package com.herokuapp.todolistkh0ma.web.project;

import com.herokuapp.todolistkh0ma.model.Project;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

import static com.herokuapp.todolistkh0ma.web.project.AjaxProjectController.AJAX_URL;

/**
 * Created by kh0ma on 11.02.17.
 */

@RestController
@RequestMapping(value = AJAX_URL)
public class AjaxProjectController extends AbstractProjectController{
    public static final String AJAX_URL = "/ajax/profile/projects";

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Project> getAll() {
        return super.getAll();
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Project> createWithLocation(@RequestBody Project project) {
        Project created = super.create(project);

        URI uriOfNewResource = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path(AJAX_URL + "/{id}")
                .buildAndExpand(created.getId()).toUri();

        return ResponseEntity.created(uriOfNewResource).body(created);
    }

    @GetMapping("/{id}")
    public Project get(@PathVariable("id") int id) {
        return super.get(id);
    }

    @PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public void update(@RequestBody Project project, @PathVariable("id") int id) {
        super.update(project, id);
    }

    @PostMapping(value = "/sort")
    public void sort(@RequestParam("projects") String tasks) {
        super.sort(tasks);
    }
}
