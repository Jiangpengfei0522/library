package com.library.controller;

import com.library.bean.Order;
import com.library.bean.UserInfo;
import com.library.service.IOrderService;
import com.library.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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
        map.put("pageMsg",orderService.selectOrderByPage(currentPage));
        //System.out.println(map.get("pageMsg"));
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
    public void scanDefaultOrder(){
        List<Order> list = orderService.selectNoArrivedOrderList();
        for(Order o:list){
//            String date = "2017-01-18 16:50:50";
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//要转换的日期格式，根据实际调整""里面内容
//            try {
//                long dateToSecond = sdf.parse(date).getTime();//sdf.parse()实现日期转换为Date格式，然后getTime()转换为毫秒数值
//                System.out.print(dateToSecond);
//            }catch (ParseException e){
//                e.printStackTrace();
//            }

        }
    }
}
