package com.herokuapp.todolistkh0ma.web;

import com.herokuapp.todolistkh0ma.service.ProjectService;
import com.herokuapp.todolistkh0ma.to.UserTo;
import com.herokuapp.todolistkh0ma.util.UserUtil;
import com.herokuapp.todolistkh0ma.web.user.AbstractUserController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.validation.Valid;

/**
 * Created by kh0ma on 11.02.17.
 */
@Controller
public class RootController extends AbstractUserController {

    @Autowired
    ProjectService projectService;

    @GetMapping("/")
    public String root() {
        return "redirect:mainpanel";
    }

    @GetMapping("/mainpanel")
    public String meals(ModelMap model) {
        model.put("projects", projectService.getAll(100000));
        return "mainpanel";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model,
                        @RequestParam(value = "error", required = false) boolean error,
                        @RequestParam(value = "message", required = false) String message) {
        model.put("error", error);
        model.put("message", message);
        return "login";
    }

    @PostMapping("/login")
    public String saveRegister(@Valid UserTo userTo, BindingResult result, SessionStatus status, ModelMap model) {
        if (!result.hasErrors()) {
            try {
                super.create(UserUtil.createNewFromTo(userTo));
                status.setComplete();
                return "redirect:login?message='successful'";
            } catch (DataIntegrityViolationException ex) {
                result.rejectValue("email", "duplicate email");
            }
        }
        model.addAttribute("register", true);
        return "login";
    }

}
