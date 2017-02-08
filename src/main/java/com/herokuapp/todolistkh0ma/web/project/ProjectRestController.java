package com.herokuapp.todolistkh0ma.web.project;

import com.herokuapp.todolistkh0ma.model.Project;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by kh0ma on 07.02.17.
 */
@RestController
@RequestMapping(value = ProjectRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class ProjectRestController extends AbstractProjectController{
    public static final String REST_URL = "/rest/profile/projects";

    @GetMapping
    public List<Project> getAll() {
        return super.getAll();
    }

    @GetMapping("/{id}")
    public Project get(@PathVariable("id") int id) {
        return super.get(id);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public void update(@RequestBody Project project, @PathVariable("id") int id) {
        super.update(project, id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public void createWithLocation(@RequestBody Project project) {
        super.create(project);
    }

}
