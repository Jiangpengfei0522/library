package com.library.service;


import com.library.bean.Order;
import com.library.bean.PageBean;
import com.library.bean.UserInfo;

import java.util.List;


public interface IOrderService {
    Order selectByOrderId(Integer orderId);
    PageBean<Order> selectOrderByPage(int currentPage);
    int updateConfirmByOrderId(Integer orderId);
    int updateDefaultByOrderId(Integer orderId);
    int updateCreditScoreByOrderId(UserInfo userInfo);
    List<Order> selectOrderList();
    List<Order> selectNoArrivedOrderList();
    List<String> selectStuIdSetByDate(String orderDate);
    int selectCollegeByStuId(String stuId);
}
