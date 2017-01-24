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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Project)) return false;
        if (!super.equals(o)) return false;

        Project project = (Project) o;

        if (getUser().getId() != null ? !getUser().getId().equals(project.getUser().getId()) : project.getUser().getId() != null) return false;
        return getCreated().equals(project.getCreated());

    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + (getUser().getId() != null ? getUser().getId().hashCode() : 0);
        result = 31 * result + getCreated().hashCode();
        return result;
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
