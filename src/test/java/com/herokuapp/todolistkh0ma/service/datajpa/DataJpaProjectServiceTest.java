package com.herokuapp.todolistkh0ma.service.datajpa;

import com.herokuapp.todolistkh0ma.model.Project;
import com.herokuapp.todolistkh0ma.service.AbstractServiceTest;
import com.herokuapp.todolistkh0ma.service.ProjectService;
import com.herokuapp.todolistkh0ma.util.exception.NotFoundException;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;

import static com.herokuapp.todolistkh0ma.ProjectTestData.*;
import static com.herokuapp.todolistkh0ma.UserTestData.ADMIN_ID;
import static com.herokuapp.todolistkh0ma.UserTestData.USER_ID;

/**
 * Created by kh0ma on 23.01.17.
 */
public class DataJpaProjectServiceTest extends AbstractServiceTest {

    @Autowired
    private ProjectService service;

    @Test
    public void testDelete() throws Exception {
        service.delete(PROJECT1_ID, USER_ID);
        MATCHER.assertCollectionEquals(Arrays.asList(PROJECT2), service.getAll(USER_ID));
    }

    @Test
    public void testDeleteNotFound() throws Exception {
        thrown.expect(NotFoundException.class);
        service.delete(PROJECT1_ID, 1);
    }

    @Test
    public void testSave() throws Exception {
        Project created = getCreated();
        service.save(created, USER_ID);
        MATCHER.assertCollectionEquals(Arrays.asList(created,PROJECT2, PROJECT1), service.getAll(USER_ID));
    }

    @Test
    public void testGet() throws Exception {
        Project actual = service.get(ADMIN_PR_ID, ADMIN_ID);
        MATCHER.assertEquals(ADMIN_PR, actual);
    }

    @Test
    public void testGetNotFound() throws Exception {
        thrown.expect(NotFoundException.class);
        service.get(PROJECT1_ID, ADMIN_ID);
    }

    @Test
    public void testUpdate() throws Exception {
        Project updated = getUpdated();
        service.update(updated, USER_ID);
        MATCHER.assertEquals(updated, service.get(PROJECT1_ID, USER_ID));
    }

    @Test
    public void testNotFoundUpdate() throws Exception {
        Project item = service.get(PROJECT1_ID, USER_ID);
        thrown.expect(NotFoundException.class);
        thrown.expectMessage("Not found entity with id=" + PROJECT1_ID);
        service.update(item, ADMIN_ID);
    }

    @Test
    public void testGetAll() throws Exception {
        MATCHER.assertCollectionEquals(PROJECTS, service.getAll(USER_ID));
    }
}
