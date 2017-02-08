package com.herokuapp.todolistkh0ma.web.project;

import com.herokuapp.todolistkh0ma.ProjectTestData;
import com.herokuapp.todolistkh0ma.model.Project;
import com.herokuapp.todolistkh0ma.service.ProjectService;
import com.herokuapp.todolistkh0ma.web.AbstractControllerTest;
import com.herokuapp.todolistkh0ma.web.json.JsonUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.ResultActions;

import java.util.Arrays;

import static com.herokuapp.todolistkh0ma.ProjectTestData.*;
import static com.herokuapp.todolistkh0ma.UserTestData.USER_ID;
import static com.herokuapp.todolistkh0ma.model.BaseEntity.START_SEQ;
import static org.junit.Assert.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * Created by kh0ma on 08.02.17.
 */
public class ProjectRestControllerTest extends AbstractControllerTest {
    private static final String REST_URL = ProjectRestController.REST_URL + '/';

    @Autowired
    ProjectService service;

    @Test
    public void testGet() throws Exception {
        mockMvc.perform(get(REST_URL + ProjectTestData.PROJECT1_ID))
                .andExpect(status().isOk())
                .andDo(print())
                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(MATCHER.contentMatcher(PROJECT1));
    }

    @Test
    public void testDelete() throws Exception {
        mockMvc.perform(delete(REST_URL + PROJECT1_ID).contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
        MATCHER.assertCollectionEquals(Arrays.asList(PROJECT2), service.getAll(USER_ID));
    }

    @Test
    public void testUpdate() throws Exception {
        Project updated = getUpdated();

        mockMvc.perform(put(REST_URL + PROJECT1_ID).contentType(MediaType.APPLICATION_JSON)
                .content(JsonUtil.writeValue(updated)))
                .andExpect(status().isOk());

        assertEquals(updated, service.get(PROJECT1_ID, USER_ID));
    }


    @Test
    public void testCreate() throws Exception {
        Project created = getCreated();
        ResultActions action = mockMvc.perform(post(REST_URL)
                .contentType(MediaType.APPLICATION_JSON)
                .content(JsonUtil.writeValue(created)));

        Project returned = MATCHER.fromJsonAction(action);
        created.setId(returned.getId());

        MATCHER.assertEquals(created, returned);
        MATCHER.assertCollectionEquals(Arrays.asList(created, PROJECT2, PROJECT1), service.getAll(START_SEQ));
    }

    @Test
    public void testGetAll() throws Exception {
        mockMvc.perform(get(REST_URL).contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andDo(print())
                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(MATCHER.contentListMatcher(PROJECTS));
    }
}
