package com.library.mapper;


import com.library.bean.PageBean;
import com.library.bean.UserInfo;
import com.library.service.impl.ManagerServiceImpl;
import com.library.service.impl.UserServiceImpl;
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
    @Resource(name="uService")
    UserServiceImpl userService;

//  @Before
//  public void before() {
//      ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//      userService = (IUserService) ac.getBean("userService");
//  }

    @Test
    public void test1() {
//        UserInfo userInfo=userService.selectByStuId("2016210402018");
//        System.out.println(userInfo.getName()+","+userInfo.getUniversity());
        PageBean<UserInfo> pageBean = userService.findByPage(1);
        for(UserInfo userInfo:pageBean.getLists()){
            System.out.println(userInfo.getName());
        }
    }
}