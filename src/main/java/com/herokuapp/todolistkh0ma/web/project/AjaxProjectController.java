package com.herokuapp.todolistkh0ma.web.project;

import com.herokuapp.todolistkh0ma.model.Project;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by kh0ma on 11.02.17.
 */

@RestController
@RequestMapping(value = "/ajax/profile/projects")
public class AjaxProjectController extends AbstractProjectController{
    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Project> getAll() {
        return super.getAll();
    }
}
