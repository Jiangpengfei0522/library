package com.library.controller;

import com.library.bean.OccupancyRate;
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
import java.math.BigDecimal;
import java.math.RoundingMode;
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
        SimpleDateFormat Csdf = new SimpleDateFormat("yyyy-MM-dd");
        String yesterday=Csdf.format(new Date().getTime()- 86400000L);
        OccupancyRate result=orderService.selectRate(yesterday);
        BigDecimal rate=result.getRate();
        double weight=0;
        BigDecimal ninety=new BigDecimal(90);
        BigDecimal eighty=new BigDecimal(80);
        BigDecimal seventy=new BigDecimal(70);
        BigDecimal sixty=new BigDecimal(60);
        BigDecimal fifty=new BigDecimal(50);
        if(rate.compareTo(ninety)==1||rate.compareTo(ninety)==0)
            weight=2;
        else if(rate.compareTo(eighty)==1||rate.compareTo(eighty)==0)
            weight=1.8;
        else if(rate.compareTo(seventy)==1||rate.compareTo(seventy)==0)
            weight=1.6;
        else if(rate.compareTo(sixty)==1||rate.compareTo(sixty)==0)
            weight=1.4;
        else if(rate.compareTo(fifty)==1||rate.compareTo(fifty)==0)
            weight=1.2;
        else
            weight=1;
        Order order = orderService.selectByOrderId(orderId);
        String stuId = order.getStuId();
        UserInfo userInfo = userService.selectByStuIdForAuth(stuId);
        Integer score = userInfo.getCreditScore();
        score -= (int)Math.round(20*weight);
        userInfo.setCreditScore(score);
        HashMap<String,Object> map = new HashMap<>();
        map.put("subScore",(int)Math.round(20*weight));
        map.put("orderId",orderId);
        int result1=orderService.updateCreditScoreByOrderId(userInfo);
        int result2=orderService.updateDefaultByOrderId(map);
        if(result2!=0&&result1!=0)
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
    @RequestMapping(value = "querySeat",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> querySeat(@RequestParam(value = "orderDate")String orderDate,
                                        @RequestParam(value = "floor")Integer floor,
                                        @RequestParam(value = "block")String block){
        HashMap<String,Object>  map = new HashMap<>();
        map.put("orderDate",orderDate);
        map.put("floorId",floor);
        map.put("blockId",block);
        List<Order> list = orderService.selectOccupiedSeat(map);
        Integer[] arrA = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        Integer[] arrB = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        Integer[] arrC = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        Integer[] arrD = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        for(Order o:list){
            if(o.getSeatId().equals("A"))
                arrA[o.getDeskId()-1]++;
            else if(o.getSeatId().equals("B"))
                arrB[o.getDeskId()-1]++;
            else if(o.getSeatId().equals("C"))
                arrC[o.getDeskId()-1]++;
            else
                arrD[o.getDeskId()-1]++;
        }
        List<Integer> listA = new ArrayList<>(arrA.length);
        Collections.addAll(listA,arrA);
        List<Integer> listB = new ArrayList<>(arrB.length);
        Collections.addAll(listB,arrB);
        List<Integer> listC = new ArrayList<>(arrC.length);
        Collections.addAll(listC,arrC);
        List<Integer> listD = new ArrayList<>(arrD.length);
        Collections.addAll(listD,arrD);
        map.put("listA",listA);
        map.put("listB",listB);
        map.put("listC",listC);
        map.put("listD",listD);
        return map;
    }
    @Scheduled(cron="0 0/5 * * * ?")
    public void scanDefaultOrder(){
        SimpleDateFormat Csdf = new SimpleDateFormat("yyyy-MM-dd");
        String yesterday=Csdf.format(new Date().getTime()- 86400000L);
        OccupancyRate result=orderService.selectRate(yesterday);
        BigDecimal rate=result.getRate();
        double weight=0;
        BigDecimal ninety=new BigDecimal(90);
        BigDecimal eighty=new BigDecimal(80);
        BigDecimal seventy=new BigDecimal(70);
        BigDecimal sixty=new BigDecimal(60);
        BigDecimal fifty=new BigDecimal(50);
        if(rate.compareTo(ninety)==1||rate.compareTo(ninety)==0)
            weight=2;
        else if(rate.compareTo(eighty)==1||rate.compareTo(eighty)==0)
            weight=1.8;
        else if(rate.compareTo(seventy)==1||rate.compareTo(seventy)==0)
            weight=1.6;
        else if(rate.compareTo(sixty)==1||rate.compareTo(sixty)==0)
            weight=1.4;
        else if(rate.compareTo(fifty)==1||rate.compareTo(fifty)==0)
            weight=1.2;
        else
            weight=1;
        List<Order> list = orderService.selectNoArrivedOrderList();
        for(Order o:list){
            String date = o.getOrderDate()+" "+o.getOrderTime().split("-")[0];
            //System.out.println(date);
            //System.out.println(o);
            String stuId=o.getStuId();
            //System.out.println(stuId);
            UserInfo userInfo = userService.selectByStuIdForAuth(stuId);
            Integer creditScore = userInfo.getCreditScore();
            creditScore -=(int)Math.round(20*weight);
            userInfo.setCreditScore(creditScore);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");//要转换的日期格式，根据实际调整""里面内容
            try {
                String now = sdf.format(new Date());
                //System.out.println(now);
                long nowToSecond = sdf.parse(now).getTime();
                long dateToSecond = sdf.parse(date).getTime();//sdf.parse()实现日期转换为Date格式，然后getTime()转换为毫秒数值
                HashMap<String,Object> map = new HashMap<>();
                map.put("subScore",(int)Math.round(20*weight));
                map.put("orderId",o.getOrderId());
                if(nowToSecond-dateToSecond>900){
                    System.out.println("正在执行更新...");
                    orderService.updateDefaultByOrderId(map);
                    orderService.updateCreditScoreByOrderId(userInfo);
                    System.out.println("更新结束...");
                }
                //System.out.println(nowToSecond);
                //System.out.println(dateToSecond);
            }catch (ParseException e){
                e.printStackTrace();
            }

        }
        System.out.println("正在执行.....");
    }
    @Scheduled(cron="0 0 23 * * ?")
    public void calRate(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String today = sdf.format(new Date());
        System.out.println(today);
        int result=orderService.selectCountOrders(today);
        double rate = result*1.0/1280;
        BigDecimal bg = new BigDecimal(rate).setScale(2, RoundingMode.UP);
        System.out.println("占座率为:"+bg);
        HashMap<String,Object> map = new HashMap<>();
        map.put("usualDate",today);
        map.put("Rate",bg);
        int insertResult=orderService.insertRate(map);
        if(insertResult==1)
            System.out.println("插入成功");
        else
            System.out.println("插入失败");
    }
}
