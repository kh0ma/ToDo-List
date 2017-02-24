package com.herokuapp.todolistkh0ma.web.user;

import com.herokuapp.todolistkh0ma.model.User;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

import static com.herokuapp.todolistkh0ma.web.user.AdminAjaxController.AJAX_URL;


/**
 * Created by kh0ma on 23.02.17.
 */
@RestController
@RequestMapping(value = AJAX_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class AdminAjaxController extends AbstractUserController {
    public static final String AJAX_URL = "/ajax/profile";

    @GetMapping(value = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public User get(@PathVariable("id") int id) {
        return super.get(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> createWithLocation(@RequestBody User user) {
        User created = super.create(user);

        URI uriOfNewResource = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path(AJAX_URL + "/{id}")
                .buildAndExpand(created.getId()).toUri();

        return ResponseEntity.created(uriOfNewResource).body(created);
    }
}
