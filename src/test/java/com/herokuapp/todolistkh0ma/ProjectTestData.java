package com.herokuapp.todolistkh0ma;

import com.herokuapp.todolistkh0ma.matcher.ModelMatcher;
import com.herokuapp.todolistkh0ma.model.Project;

import java.util.Arrays;
import java.util.List;

import static com.herokuapp.todolistkh0ma.UserTestData.*;
import static com.herokuapp.todolistkh0ma.model.BaseEntity.START_SEQ;
import static java.time.LocalDateTime.*;
import static java.time.Month.*;

/**
 * Created by kh0ma on 23.01.17.
 */
public class ProjectTestData {

    public static final ModelMatcher<Project> MATCHER = ModelMatcher.of(Project.class);

    public static final int PROJECT1_ID = START_SEQ + 2;
    public static final int PROJECT2_ID = START_SEQ + 3;
    public static final int ADMIN_PR_ID = START_SEQ + 4;

    public static final Project PROJECT1 = new Project(PROJECT1_ID, "Business", USER,  of(2017, JANUARY, 15, 12, 0));
    public static final Project PROJECT2 = new Project(PROJECT2_ID, "Home",     USER,  of(2017, JANUARY, 20, 18, 0));
    public static final Project ADMIN_PR = new Project(ADMIN_PR_ID, "Tests",    ADMIN, of(2017, JANUARY, 10, 11, 0));

    public static final List<Project> PROJECTS = Arrays.asList(PROJECT2,PROJECT1);

    public static Project getCreated()
    {
        return new Project(null, "New Project", USER, of(2017, JANUARY, 22, 13, 13));
    }

    public static Project getUpdated()
    {
        return new Project(PROJECT1.getId(), "Business updated", PROJECT1.getUser(), PROJECT1.getCreated());
    }

}
