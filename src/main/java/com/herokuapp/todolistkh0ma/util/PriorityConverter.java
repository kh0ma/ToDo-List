package com.herokuapp.todolistkh0ma.util;

import com.herokuapp.todolistkh0ma.model.Task;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

/**
 * Created by kh0ma on 22.01.17.
 */
@Converter
public class PriorityConverter implements AttributeConverter<Task.Priority, Integer> {

    @Override
    public Integer convertToDatabaseColumn(Task.Priority priority) {
        switch (priority){
            case HIGH:      return 2;
            case VERY_HIGH: return 3;
        }
        return 1;
    }

    @Override
    public Task.Priority convertToEntityAttribute(Integer i) {
        switch (i){
            case 2: return Task.Priority.HIGH;
            case 3: return Task.Priority.VERY_HIGH;
        }
        return Task.Priority.NORMAL;
    }
}
