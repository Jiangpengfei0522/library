package com.library.mapper;


import com.library.service.impl.ManagerServiceImpl;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:MyBatis.xml"})

public class ManagerMapperTest {
    private static Logger logger = Logger.getLogger(ManagerMapperTest.class);
    //  private ApplicationContext ac = null;
    @Resource(name="managerService")
    ManagerServiceImpl managerService;

//  @Before
//  public void before() {
//      ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//      userService = (IUserService) ac.getBean("userService");
//  }

    @Test
    public void test1() {
        String result = managerService.getPassByName("jiangpengfei");
        // System.out.println(user.getUserName());
        // logger.info("值："+user.getUserName());
        logger.info(result);
    }
}