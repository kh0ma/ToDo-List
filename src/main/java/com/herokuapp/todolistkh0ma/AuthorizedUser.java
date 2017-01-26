package com.herokuapp.todolistkh0ma;

import com.herokuapp.todolistkh0ma.model.BaseEntity;

/**
 * Created by kh0ma on 26.01.17.
 */
public class AuthorizedUser {
    public static int id = BaseEntity.START_SEQ;

    public static int id() {
        return id;
    }

    public static void setId(int id) {
        AuthorizedUser.id = id;
    }

}
