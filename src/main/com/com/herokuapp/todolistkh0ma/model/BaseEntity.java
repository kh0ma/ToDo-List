package com.herokuapp.todolistkh0ma.model;

/**
 * Created by kh0ma on 22.01.17.
 */
public class BaseEntity {
    public static final int START_SEQ = 100000;

    protected Integer id;
    protected String name;

    public BaseEntity() {
    }

    protected BaseEntity(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public boolean isNew() {
        return (getId() == null);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof BaseEntity)) return false;

        BaseEntity that = (BaseEntity) o;

        if (!getId().equals(that.getId())) return false;
        return getName().equals(that.getName());

    }

    @Override
    public int hashCode() {
        int result = getId().hashCode();
        result = 31 * result + getName().hashCode();
        return result;
    }
}
