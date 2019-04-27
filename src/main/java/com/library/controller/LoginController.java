package com.library.controller;


import com.alibaba.fastjson.JSONArray;
import com.library.service.IManagerService;
import com.library.service.impl.ManagerServiceImpl;
import com.library.util.JsonMsg;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@CrossOrigin(origins = "*",maxAge = 3600)
@RequestMapping("/library")
public class LoginController {
    @Resource(name="mService")
    private IManagerService managerService;

    @RequestMapping(value="/login",method = RequestMethod.GET)
    public String login(){return "index";}

    @RequestMapping(value="/dologin",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> doLogin(@RequestParam("username")String username, @RequestParam("password") String password){
        System.out.println(username + password);
        String queryPass = managerService.getPassByName(username);
        System.out.println(queryPass);
        Map<String, String> map = new HashMap<String,String>(1);

        if(password.equals(queryPass)){
            map.put("success", "true");
            System.out.println(map);
            return map;
        }
        else{
            map.put("success", "false");
            System.out.println(map);
            return map;
        }

    }

    @RequestMapping(value="/main",method = RequestMethod.GET)
    public String toMain(){return "mainIndex";}

    @RequestMapping(value="/logout",method = RequestMethod.GET)
    public String toLogin(){return "index";}

    @RequestMapping(value="/accountAuthority",method = RequestMethod.GET)
    public String toAccountAuthority(){return "accountAuthority";}
    @RequestMapping(value="/accountCheck",method = RequestMethod.GET)
    public String toAccountCheck(){return "accountCheck";}
    @RequestMapping(value="/arrivedPeople",method = RequestMethod.GET)
    public String toArrivedPeople(){return "arrivedPeople";}
    @RequestMapping(value="/confirmSeated",method = RequestMethod.GET)
    public String toConfirmSeated(){return "confirmSeated";}
    @RequestMapping(value="/lostFaithPeople",method = RequestMethod.GET)
    public String toLostFaithPeople(){return "lostFaithPeople";}
    @RequestMapping(value="/seatCondition",method = RequestMethod.GET)
    public String toSeatCondition(){return "seatCondition";}
}
