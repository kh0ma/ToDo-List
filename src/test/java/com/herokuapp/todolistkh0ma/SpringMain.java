package com.herokuapp.todolistkh0ma;

import org.springframework.context.support.GenericXmlApplicationContext;
import java.util.Arrays;

/**
 * User: gkislin
 * Date: 22.08.2014
 */
public class SpringMain {
    public static void main(String[] args) {
        // java 7 Automatic resource management
        try (GenericXmlApplicationContext appCtx = new GenericXmlApplicationContext()) {
            appCtx.load("spring/spring-app.xml", "spring/spring-db.xml");
            appCtx.refresh();

            System.out.println("Bean definition names: " + Arrays.toString(appCtx.getBeanDefinitionNames()));
            /*AdminRestController adminUserController = appCtx.getBean(AdminRestController.class);
            adminUserController.create(UserTestData.USER);*/
            System.out.println();
        }
    }
}
