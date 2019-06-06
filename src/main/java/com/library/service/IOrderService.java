package com.library.service;


import com.library.bean.OccupancyRate;
import com.library.bean.Order;
import com.library.bean.PageBean;
import com.library.bean.UserInfo;

import java.util.HashMap;
import java.util.List;


public interface IOrderService {
    Order selectByOrderId(Integer orderId);
    PageBean<Order> selectOrderByPage(int currentPage);
    int updateConfirmByOrderId(Integer orderId);
    int updateDefaultByOrderId(HashMap<String,Object> map);
    int updateCreditScoreByOrderId(UserInfo userInfo);
    List<Order> selectOrderList();
    List<Order> selectNoArrivedOrderList();
    List<String> selectStuIdSetByDate(String orderDate);
    int selectCollegeByStuId(String stuId);
    List<Order> selectOccupiedSeat(HashMap<String,Object> map);
    OccupancyRate selectRate(String usualDate);
    int selectCountOrders(String orderDate);
    int insertRate(HashMap<String,Object> map);
}
