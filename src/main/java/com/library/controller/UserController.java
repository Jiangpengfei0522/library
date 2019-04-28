package com.library.controller;

import com.library.bean.PageBean;
import com.library.bean.UserInfo;
import com.library.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource(name="uService")
    private IUserService userService;

    @RequestMapping(value = "/doQuery",method = RequestMethod.GET)
    public String query(@RequestParam(value="currentPage",defaultValue = "1",required = false) int currentPage,
                                                 @RequestParam(value="stuId",required = false) String stuID,
                                                Map<String,Object> map) {
        System.out.println(stuID);
        if(stuID==null || stuID==""){
            map.put("pageMsg",userService.findByPage(currentPage));
            System.out.println(map.get("pageMsg"));
        }
        return "accountCheck";
    }
}
