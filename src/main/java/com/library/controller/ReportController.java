package com.library.controller;

import com.library.bean.*;
import com.library.service.IOrderService;
import com.library.service.IReportService;
import com.library.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/report")
public class ReportController {
    @Resource(name="oService")
    private IOrderService orderService;
    @Resource(name="uService")
    private IUserService userService;
    @Resource(name="rService")
    private IReportService reportService;

    @RequestMapping(value = "/queryReport",method = RequestMethod.GET)
    public String doReportQuery(@RequestParam(value="currentPage",defaultValue = "1",required = false) int currentPage,
                          Map<String,Object> map){
        PageBean<Report> pageBean= reportService.selectReportByPage(currentPage);
        map.put("reportPageMsg",pageBean);
        System.out.println(pageBean);
        return "reportSet";
    }
    @RequestMapping(value = "/updateConfirm",method = RequestMethod.GET)
    public String updateConfirm(@RequestParam(value = "isConfirmed") int isConfirmed,@RequestParam(value = "reportId") Integer reportId){
        HashMap<String,Object> map = new HashMap<>();
        HashMap<String,Object> userMap = new HashMap<>();
        Report report = reportService.selectSingleReport(reportId);
        SimpleDateFormat Csdf = new SimpleDateFormat("yyyy-MM-dd");
        String yesterday=Csdf.format(new Date().getTime()- 86400000L);
        OccupancyRate result=orderService.selectRate(yesterday);
        BigDecimal rate=result.getRate();
        double weight=0;
        int subScore=0;
        int addScore=0;
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
        Order order = orderService.selectByOrderId(report.getOrderId());
        UserInfo userInfo1 = userService.selectByStuIdForAuth(order.getStuId());
        UserInfo userInfo2 = userService.selectByStuIdForAuth(report.getStuId());
        map.put("isConfirmed",isConfirmed);
        map.put("reportId",reportId);
        if(isConfirmed==1){
            Integer score1=userInfo1.getCreditScore();
            Integer score2=userInfo2.getCreditScore();
            subScore=(int)Math.round(20*weight);
            addScore=subScore;
            score1-=subScore;
            score2+=5;
            userInfo1.setCreditScore(score1);
            userInfo2.setCreditScore(score2);
            userMap.put("subScore",subScore);
            userMap.put("orderId",report.getOrderId());
            orderService.updateCreditScoreByOrderId(userInfo1);
            orderService.updateCreditScoreByOrderId(userInfo2);
            orderService.updateDefaultByOrderId(userMap);
            map.put("subScore",subScore);
            map.put("addScore",addScore);
        }
        if(isConfirmed==2){
            map.put("subScore",0);
            map.put("addScore",0);
        }
        if(isConfirmed==3) {
            Integer score2=userInfo2.getCreditScore();
            subScore = (int) Math.round(20 * weight);
            score2-=subScore;
            userInfo2.setCreditScore(score2);
            orderService.updateCreditScoreByOrderId(userInfo2);
            map.put("subScore",subScore);
            map.put("addScore",addScore);
        }
        int result1=reportService.updateIsConfirmed(map);
        if(result1==1)
            System.out.println("更新举报成功！");
        return "reportSet";
    }
}
