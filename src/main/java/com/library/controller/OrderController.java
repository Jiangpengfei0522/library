package com.library.controller;

import com.library.bean.Order;
import com.library.bean.PageBean;
import com.library.bean.UserInfo;
import com.library.service.IOrderService;
import com.library.service.IUserService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Resource(name="oService")
    private IOrderService orderService;
    @Resource(name="uService")
    private IUserService userService;

    @RequestMapping(value = "/queryOrder",method = RequestMethod.GET)
    public String doQuery(@RequestParam(value="currentPage",defaultValue = "1",required = false) int currentPage,
                          Map<String,Object> map){
        PageBean<Order> pageBean= orderService.selectOrderByPage(currentPage);
        map.put("orderPageMsg",pageBean);
        System.out.println(pageBean);
        return "confirmSeated";
    }

    @RequestMapping(value = "/confirm",method = RequestMethod.GET)
    public String doConfirm(@RequestParam(value = "orderId") Integer orderId){
        int result=orderService.updateConfirmByOrderId(orderId);
        if(result!=0)
            System.out.println("更新成功");
        return "confirmSeated";
    }
    @RequestMapping(value = "/default",method = RequestMethod.GET)
    public String doDefault(@RequestParam(value = "orderId") Integer orderId){
        Order order = orderService.selectByOrderId(orderId);
        String stuId = order.getStuId();
        UserInfo userInfo = userService.selectByStuId(stuId);
        Integer score = userInfo.getCreditScore();
        score -= 10;
        userInfo.setCreditScore(score);
        int result1=orderService.updateCreditScoreByOrderId(userInfo);
        int result=orderService.updateConfirmByOrderId(orderId);
        if(result!=0&&result1!=0)
            System.out.println("更新成功");
        return "confirmSeated";
    }

    @RequestMapping(value = "/queryPeople",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,List<Integer>> queryPeople(@RequestParam(value="orderDate",required = false,defaultValue = "2019-05-04")String orderDate){
        System.out.println(orderDate);
        List<String> list = orderService.selectStuIdSetByDate(orderDate);
        List<Integer> collegeList = new ArrayList<>();
        Map<String,List<Integer>> map = new HashMap<>();
        int[] collegeArr = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        for(String s:list){
            System.out.println(s);
            int result=orderService.selectCollegeByStuId(s);
            collegeArr[result]+=1;
        }
        System.out.println("1:"+collegeArr);
        for(int i=0;i<collegeArr.length;i++){
            collegeList.add(collegeArr[i]);
        }
        System.out.println(collegeArr);
        System.out.println(collegeList);
        map.put("success",collegeList);
        return map;
    }

    @Scheduled(cron="0 0/5 * * * ?")
    public void scanDefaultOrder(){
        List<Order> list = orderService.selectNoArrivedOrderList();
        for(Order o:list){
            String date = o.getOrderDate()+" "+o.getOrderTime().split("-")[0];
            System.out.println(date);
            System.out.println(o);
            String stuId=o.getStuId();
            System.out.println(stuId);
            UserInfo userInfo = userService.selectByStuIdForAuth(stuId);
            Integer creditScore = userInfo.getCreditScore();
            creditScore -=10;
            userInfo.setCreditScore(creditScore);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");//要转换的日期格式，根据实际调整""里面内容
            try {
                String now = sdf.format(new Date());
                System.out.println(now);
                long nowToSecond = sdf.parse(now).getTime();
                long dateToSecond = sdf.parse(date).getTime();//sdf.parse()实现日期转换为Date格式，然后getTime()转换为毫秒数值
                if(nowToSecond-dateToSecond>900){
                    System.out.println("正在执行更新...");
                    orderService.updateDefaultByOrderId(o.getOrderId());
                    orderService.updateCreditScoreByOrderId(userInfo);
                    System.out.println("更新结束...");
                }
                System.out.println(nowToSecond);
                System.out.println(dateToSecond);
            }catch (ParseException e){
                e.printStackTrace();
            }

        }
        System.out.println("正在执行.....");
    }
}
