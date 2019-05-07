package com.library.mapper;

import com.library.bean.Order;
import com.library.bean.UserInfo;

import java.util.HashMap;
import java.util.List;

public interface OrderMapper {
    //根据订单号查询一条订单记录
    Order selectByOrderId(Integer orderId);
    //分页查询订单
    List<Order> selectOrderByPage(HashMap<String,Object> map);
    //更新为确认到达状态
    int updateConfirmByOrderId(Integer orderId);
    //更新为违约状态
    int updateDefaultByOrderId(Integer orderId);
    //更新信用分
    int updateCreditScoreByOrderId(UserInfo userInfo);
    //获得符合要求的订单总数
    int selectCount();
    //获得符合要求的订单结果集
    List<Order> selectOrderList();
    List<Order> selectNoArrivedOrderList();

    List<String> selectStuIdSetByDate(String orderDate);
    int selectCollegeByStuId(String stuId);
}
