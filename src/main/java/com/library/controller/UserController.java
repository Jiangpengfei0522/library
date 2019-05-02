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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
        else{
            UserInfo userInfo=userService.selectByStuId(stuID);
            if(userInfo==null)
                map.put("pageMsg",null);
            else{
                List<UserInfo> list = new ArrayList<UserInfo>();
                list.add(userInfo);
                PageBean<UserInfo> pageBean = new PageBean<>();
                pageBean.setCurrPage(1);
                pageBean.setLists(list);
                pageBean.setPageSize(1);
                pageBean.setTotalCount(1);
                pageBean.setTotalPage(1);
                map.put("pageMsg",pageBean);
            }
        }
        return "accountCheck";
    }
    @RequestMapping(value = "/doAuthQuery",method = RequestMethod.GET)
    public String queryAuth(@RequestParam(value="currentPage",defaultValue = "1",required = false) int currentPage,
                        @RequestParam(value="stuId",required = false) String stuID,
                        Map<String,Object> map) {
        System.out.println(stuID);
        if(stuID==null || stuID==""){
            map.put("pageMsgForAuth",userService.findByPageForAuth(currentPage));
            System.out.println(map.get("pageMsgForAuth"));
        }
        else{
            UserInfo userInfo=userService.selectByStuIdForAuth(stuID);
            if(userInfo==null)
                map.put("pageMsgForAuth",null);
            else{
                List<UserInfo> list = new ArrayList<UserInfo>();
                list.add(userInfo);
                PageBean<UserInfo> pageBean = new PageBean<>();
                pageBean.setCurrPage(1);
                pageBean.setLists(list);
                pageBean.setPageSize(1);
                pageBean.setTotalCount(1);
                pageBean.setTotalPage(1);
                map.put("pageMsgForAuth",pageBean);
            }
        }
        return "accountAuthority";
    }
    @RequestMapping(value="/forbidden")
    public String doForbidden(@RequestParam(value="stuId") String stuId,@RequestParam(value="isForbidden")Integer isForbidden){
        UserInfo userInfo = new UserInfo();
        userInfo.setStuId(stuId);
        userInfo.setIsForbidden(isForbidden);
        int result=userService.updateAuthByPrimaryKey(userInfo);
        if(result==0)
            System.out.println("更新失败");
            return "accountAuthority";
    }
    @RequestMapping(value="/check")
    public String doCheck(@RequestParam(value="stuId") String stuId){
        UserInfo userInfo = new UserInfo();
        userInfo.setStuId(stuId);
        userInfo.setIsConfirmed(1);
        int result=userService.updateByPrimaryKey(userInfo);
        if(result==0)
            System.out.println("更新失败");
        return "accountCheck";
    }
}
