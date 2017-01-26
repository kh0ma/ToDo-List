package com.herokuapp.todolistkh0ma.web.json;

import com.herokuapp.todolistkh0ma.TaskTestData;
import com.herokuapp.todolistkh0ma.model.Task;
import com.herokuapp.todolistkh0ma.rest.json.JsonUtil;
import org.junit.Test;

import java.util.List;

/**
 * Created by kh0ma on 26.01.17.
 */
public class JsonUtilTest {

    @Test
    public void testReadWriteValue() throws Exception {
        String json = JsonUtil.writeValue(TaskTestData.TASK1);
        System.out.println(json);
        Task task = JsonUtil.readValue(json, Task.class);
        TaskTestData.MATCHER.assertEquals(TaskTestData.TASK1, task);
    }

    @Test
    public void testReadWriteValues() throws Exception {
        String json = JsonUtil.writeValue(TaskTestData.TASKS_PJ1);
        System.out.println(json);
        List<Task> tasks = JsonUtil.readValues(json, Task.class);
        TaskTestData.MATCHER.assertCollectionEquals(TaskTestData.TASKS_PJ1, tasks);
    }
}
