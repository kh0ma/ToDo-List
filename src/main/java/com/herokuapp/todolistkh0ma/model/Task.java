package com.herokuapp.todolistkh0ma.model;

import com.herokuapp.todolistkh0ma.util.PriorityConverter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * Created by kh0ma on 22.01.17.
 */
@Entity
@Table(name = "tasks")
public class Task extends BaseEntity {

    @Column(name = "done", nullable = false)
    private boolean done;

    @Column(name = "priority")
    @Convert(converter = PriorityConverter.class)
    private Priority priority;

    @Column(name = "deadline")
    private LocalDateTime deadLine;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "project_id", nullable = false)
    private Project project;

    @NotNull
    @Column(name = "created", nullable = false)
    private LocalDateTime created;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    public Task() {
        if (created == null) {
            this.created = LocalDateTime.now();
        }
        if (priority == null) {
            this.priority = Priority.NORMAL;
        }
    }

    public Priority getPriority() {
        return priority;
    }

    public void setPriority(Priority priority) {
        this.priority = priority;
    }

    public Task(Integer id, String name, boolean done, Priority priority, LocalDateTime deadLine, Project project, LocalDateTime created, User user) {
        super(id, name);
        this.done = done;
        this.priority = priority;
        this.deadLine = deadLine;
        this.project = project;
        this.created = created;
        this.user = user;
    }

    public Task(String name)
    {
        this.name = name;
    }


    public Task(Integer id, String name, boolean done, Priority priority, LocalDateTime deadLine, Project project) {
        super(id, name);
        this.done = done;
        this.priority = priority;
        this.deadLine = deadLine;
        this.project = project;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }

    public LocalDateTime getDeadLine() {
        return deadLine;
    }

    public void setDeadLine(LocalDateTime deadLine) {
        this.deadLine = deadLine;
    }

    public Project getProject() {
        return project;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }


    public static enum  Priority
    {
        NORMAL,HIGH,VERY_HIGH
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Task)) return false;
        if (!super.equals(o)) return false;

        Task task = (Task) o;

        if (isDone() != task.isDone()) return false;
        if (getPriority() != task.getPriority()) return false;
        if (getDeadLine() != null ? !getDeadLine().equals(task.getDeadLine()) : task.getDeadLine() != null)
            return false;
        if (!getProject().getId().equals(task.getProject().getId())) return false;
        return getCreated().equals(task.getCreated());

    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + (isDone() ? 1 : 0);
        result = 31 * result + (getPriority() != null ? getPriority().hashCode() : 0);
        result = 31 * result + (getDeadLine() != null ? getDeadLine().hashCode() : 0);
        result = 31 * result + getProject().getId().hashCode();
        result = 31 * result + getCreated().hashCode();
        return result;
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + getId() +
                ", name=" + getName() +
                ", done=" + isDone() +
                ", priority=" + getPriority() +
                ", deadLine=" + getDeadLine() +
                ", created=" + getCreated() +
                '}';
    }
}
