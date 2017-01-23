package com.herokuapp.todolistkh0ma.util.exception;

/**
 * Created by kh0ma on 23.01.17.
 */
public class NotFoundException extends RuntimeException {
    public NotFoundException(String message) {
        super(message);
    }
}