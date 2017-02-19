package com.herokuapp.todolistkh0ma;

import com.herokuapp.todolistkh0ma.matcher.ModelMatcher;
import com.herokuapp.todolistkh0ma.model.Task;


import java.util.Arrays;
import java.util.List;

import static com.herokuapp.todolistkh0ma.ProjectTestData.ADMIN_PR;
import static com.herokuapp.todolistkh0ma.ProjectTestData.PROJECT1;
import static com.herokuapp.todolistkh0ma.ProjectTestData.PROJECT2;
import static com.herokuapp.todolistkh0ma.UserTestData.ADMIN;
import static com.herokuapp.todolistkh0ma.UserTestData.USER;
import static com.herokuapp.todolistkh0ma.model.BaseEntity.START_SEQ;
import static com.herokuapp.todolistkh0ma.model.Task.Priority.*;
import static java.time.LocalDateTime.*;
import static java.time.Month.*;


/**
 * Created by kh0ma on 24.01.17.
 */
public class TaskTestData {
    public static final ModelMatcher<Task> MATCHER = ModelMatcher.of(Task.class);

    public static final int TASK1_ID = START_SEQ + 5;
    public static final int TASK2_ID = START_SEQ + 6;
    public static final int TASK3_ID = START_SEQ + 7;
    public static final int TASK4_ID = START_SEQ + 8;
    public static final int TASK5_ID = START_SEQ + 9;
    public static final int TASK6_ID = START_SEQ + 10;
    public static final int TASK7_ID = START_SEQ + 11;
    public static final int TASK8_ID = START_SEQ + 12;

    public static final int ADMT1_ID = START_SEQ + 13;
    public static final int ADMT2_ID = START_SEQ + 14;

    public static final Task TASK1 = new Task(TASK1_ID,"Revise the contract",   false,      HIGH, of(2017,  JANUARY,22,12, 0),PROJECT1,of(2017,JANUARY,15,12, 5), USER);
    public static final Task TASK2 = new Task(TASK2_ID,"Sign the contract",     false, VERY_HIGH, of(2017, FEBRUARY,02,12, 0),PROJECT1,of(2017,JANUARY,16,13,15), USER);
    public static final Task TASK3 = new Task(TASK3_ID,"Meet customer",          true,    NORMAL, of(2017, FEBRUARY,03,12, 0),PROJECT1,of(2017,JANUARY,17,14,25), USER);
    public static final Task TASK4 = new Task(TASK4_ID,"Call boss",             false,    NORMAL, of(2017, FEBRUARY,04,12, 0),PROJECT1,of(2017,JANUARY,18,15,35), USER);
    public static final Task TASK5 = new Task(TASK5_ID,"Fix the chair",         false,    NORMAL, of(2017, FEBRUARY,01,12, 0),PROJECT2,of(2017,JANUARY,21, 8,13), USER);
    public static final Task TASK6 = new Task(TASK6_ID,"Feed cat",              false,    NORMAL, of(2017, FEBRUARY,01,12, 0),PROJECT2,of(2017,JANUARY,22, 9, 1), USER);
    public static final Task TASK7 = new Task(TASK7_ID,"Buy bread",              true,    NORMAL, of(2017,  JANUARY,25,23,23),PROJECT2,of(2017,JANUARY,25,22,22), USER);
    public static final Task TASK8 = new Task(TASK8_ID,"Buy milk",              false,    NORMAL, of(2017, FEBRUARY,01,12, 0),PROJECT2,of(2017,JANUARY,29,21,31), USER);

    public static final Task ADMT1 = new Task(ADMT1_ID,"Test1",                 false,    NORMAL, of(2017, FEBRUARY,01,12, 0),ADMIN_PR,of(2017,JANUARY,15,12,05), ADMIN);
    public static final Task ADMT2 = new Task(ADMT2_ID,"Test1",                 false,    NORMAL, of(2017, FEBRUARY,01,12, 0),ADMIN_PR,of(2017,JANUARY,15,12,05), ADMIN);

    public static final List<Task> TASKS_PJ1 = Arrays.asList(TASK4,TASK3,TASK2,TASK1);
    public static final List<Task> TASKS_PJ2 = Arrays.asList(TASK8,TASK7,TASK6,TASK5);

    public static Task getCreated()
    {
        return new Task(null,"New Task",false,VERY_HIGH,of(1999,DECEMBER,1,12,0),PROJECT1,of(1998,JUNE,17,11,6), USER);
    }

    public static Task getUpdated()
    {
        return new Task(TASK1_ID,TASK1.getName()+" Updated",TASK1.isDone(),TASK1.getPriority(),TASK1.getDeadLine(),TASK1.getProject(),TASK1.getCreated(), USER);
    }

}
