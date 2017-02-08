package com.herokuapp.todolistkh0ma.service.datajpa;

import com.herokuapp.todolistkh0ma.TaskTestData;
import com.herokuapp.todolistkh0ma.model.Task;
import com.herokuapp.todolistkh0ma.service.AbstractServiceTest;
import com.herokuapp.todolistkh0ma.service.TaskService;
import com.herokuapp.todolistkh0ma.util.exception.NotFoundException;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;

import static com.herokuapp.todolistkh0ma.ProjectTestData.PROJECT1_ID;
import static com.herokuapp.todolistkh0ma.ProjectTestData.PROJECT2_ID;
import static com.herokuapp.todolistkh0ma.TaskTestData.*;
import static com.herokuapp.todolistkh0ma.UserTestData.USER;
import static com.herokuapp.todolistkh0ma.UserTestData.USER_ID;

/**
 * Created by kh0ma on 24.01.17.
 */
public class DataJpaTaskServiceTest extends AbstractServiceTest {

    @Autowired
    private TaskService service;

    @Test
    public void testDelete() throws Exception {
        service.delete(TASK1_ID, PROJECT1_ID, USER_ID);
        MATCHER.assertCollectionEquals(Arrays.asList(TASK4,TASK3,TASK2), service.getAll(PROJECT1_ID, USER_ID));

        service.delete(TASK5_ID, PROJECT2_ID, USER_ID);
        MATCHER.assertCollectionEquals(Arrays.asList(TASK8,TASK7,TASK6), service.getAll(PROJECT2_ID, USER_ID));
    }

    @Test
    public void testDeleteNotFound() throws Exception {
        thrown.expect(NotFoundException.class);
        service.delete(TASK1_ID, 1, 1);
    }

    @Test
    public void testSave() throws Exception {
        Task created = getGreated();
        service.save(created, PROJECT1_ID, USER_ID);
        MATCHER.assertCollectionEquals(Arrays.asList(TASK4, TASK3, TASK2, TASK1, created), service.getAll(PROJECT1_ID, USER_ID));

        Task created2 = getGreated();
        service.save(created2, PROJECT2_ID, USER_ID);
        MATCHER.assertCollectionEquals(Arrays.asList(TASK8, TASK7, TASK6, TASK5, created2), service.getAll(PROJECT2_ID, USER_ID));
    }

    @Test
    public void testGet() throws Exception {
        Task actual = service.get(TASK1_ID, PROJECT1_ID, USER_ID);
        MATCHER.assertEquals(TASK1, actual);

        Task actual2 = service.get(TASK5_ID, PROJECT2_ID, USER_ID);
        MATCHER.assertEquals(TASK5, actual2);
    }

    @Test
    public void testGetNotFound() throws Exception {
        thrown.expect(NotFoundException.class);
        service.get(TASK1_ID, PROJECT2_ID, USER_ID);
    }

    @Test
    public void testUpdate() throws Exception {
        Task updated = getUdated();
        service.update(updated, PROJECT1_ID, USER_ID);
        MATCHER.assertEquals(updated, service.get(TASK1_ID, PROJECT1_ID, USER_ID));
    }

    @Test
    public void testNotFoundUpdate() throws Exception {
        Task item = service.get(TASK1_ID, PROJECT1_ID, USER_ID);
        thrown.expect(NotFoundException.class);
        thrown.expectMessage("Not found entity with id=" + TASK1_ID);
        service.update(item, PROJECT2_ID, USER_ID);
    }

    @Test
    public void testGetAll() throws Exception {
        MATCHER.assertCollectionEquals(TASKS_PJ1, service.getAll(PROJECT1_ID, USER_ID));

        MATCHER.assertCollectionEquals(TASKS_PJ2, service.getAll(PROJECT2_ID, USER_ID));
    }
}
