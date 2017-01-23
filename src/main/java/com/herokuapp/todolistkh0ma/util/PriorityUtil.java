package com.herokuapp.todolistkh0ma.util;

import com.herokuapp.todolistkh0ma.model.Task;

/**
 * Created by kh0ma on 22.01.17.
 */
public class PriorityUtil {
    public Task.Priority getPriorityByInt(int i)
    {
        switch (i){
            case 2: return Task.Priority.HIGH;
            case 3: return Task.Priority.VERY_HIGH;
        }
        return Task.Priority.NORMAL;
    }

    public int getIntByPriority(Task.Priority priority)
    {
        switch (priority){
            case HIGH:      return 2;
            case VERY_HIGH: return 3;
        }
        return 1;
    }
}
