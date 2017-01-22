package com.herokuapp.todolistkh0ma.model;

import java.time.LocalDateTime;

/**
 * Created by kh0ma on 22.01.17.
 */
public class Task extends BaseEntity {
    private boolean status;
    private Priority priority;
    private LocalDateTime deadLine;
    private Project project;

    public Task(String name)
    {
        this.name = name;
    }


    public Task(Integer id, String name, boolean status, Priority priority, LocalDateTime deadLine, Project project) {
        super(id, name);
        this.status = status;
        this.priority = priority;
        this.deadLine = deadLine;
        this.project = project;
    }



    public static enum  Priority
    {
        NORMAL,HIGH,VERY_HIGH
    }
}
