package com.herokuapp.todolistkh0ma.web.task;

import com.herokuapp.todolistkh0ma.model.Task;
import com.herokuapp.todolistkh0ma.service.TaskService;
import com.herokuapp.todolistkh0ma.web.AbstractControllerTest;
import com.herokuapp.todolistkh0ma.web.json.JsonUtil;
import com.herokuapp.todolistkh0ma.web.project.ProjectRestController;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.ResultActions;

import java.util.Arrays;

import static com.herokuapp.todolistkh0ma.ProjectTestData.PROJECT1_ID;
import static com.herokuapp.todolistkh0ma.TaskTestData.getCreated;
import static com.herokuapp.todolistkh0ma.TaskTestData.getUpdated;
import static com.herokuapp.todolistkh0ma.TaskTestData.*;
import static com.herokuapp.todolistkh0ma.UserTestData.USER_ID;
import static org.junit.Assert.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * Created by kh0ma on 08.02.17.
 */
public class TaskRestControllerTest extends AbstractControllerTest {
    private static final String REST_URL = ProjectRestController.REST_URL + '/' + PROJECT1_ID +"/tasks/";

    @Autowired
    private TaskService service;

    @Test
    public void testGet() throws Exception {
        mockMvc.perform(get(REST_URL + TASK1_ID))
                .andExpect(status().isOk())
                .andDo(print())
                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(MATCHER.contentMatcher(TASK1));
    }

    @Test
    public void testDelete() throws Exception {
        mockMvc.perform(delete(REST_URL + TASK1_ID).contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
        MATCHER.assertCollectionEquals(Arrays.asList(TASK4, TASK3, TASK2), service.getAll(PROJECT1_ID,USER_ID));
    }

    @Test
    public void testUpdate() throws Exception {
        Task updated = getUpdated();

        mockMvc.perform(put(REST_URL + TASK1_ID).contentType(MediaType.APPLICATION_JSON)
                .content(JsonUtil.writeValue(updated)))
                .andExpect(status().isOk());

        assertEquals(updated, service.get(TASK1_ID, PROJECT1_ID, USER_ID));
    }

    @Test
    public void testCreate() throws Exception {
        Task created = getCreated();
        ResultActions action = mockMvc.perform(post(REST_URL)
                .contentType(MediaType.APPLICATION_JSON)
                .content(JsonUtil.writeValue(created)));

        Task returned = MATCHER.fromJsonAction(action);
        created.setId(returned.getId());

        MATCHER.assertEquals(created, returned);
        MATCHER.assertCollectionEquals(Arrays.asList(TASK4, TASK3, TASK2, TASK1, created), service.getAll(PROJECT1_ID, USER_ID));
    }

    @Test
    public void testGetAll() throws Exception {
        mockMvc.perform(get(REST_URL).contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andDo(print())
                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(MATCHER.contentListMatcher(TASKS_PJ1));
    }
}
