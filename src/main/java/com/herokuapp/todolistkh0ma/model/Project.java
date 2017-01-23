package com.herokuapp.todolistkh0ma.model;


import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * Created by kh0ma on 22.01.17.
 */

@Entity
@Table(name = "projects")
public class Project extends BaseEntity {
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @NotNull
    @Column(name = "created", nullable = false)
    private LocalDateTime created;

    public Project() {
    }

    public Project(Integer id, String name, User user, LocalDateTime created) {
        super(id, name);
        this.user = user;
        this.created = created;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + getId() +
                ", name=" + getName() +
                ", user=" + getUser().getId() +
                ", created=" + getCreated() +
                '}';
    }
}
