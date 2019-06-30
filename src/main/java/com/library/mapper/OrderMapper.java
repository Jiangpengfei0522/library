package com.library.mapper;

import com.library.bean.OccupancyRate;
import com.library.bean.Order;
import com.library.bean.UserInfo;
import org.apache.ibatis.annotations.Param;

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
    int updateDefaultByOrderId(HashMap<String,Object> map);
    //更新信用分
    int updateCreditScoreByOrderId(UserInfo userInfo);
    //获得符合要求的订单总数
    int selectCount(@Param("stuId") String stuId);
    //获得符合要求的订单结果集
    List<Order> selectNoArrivedOrderList();
    //查询未确认结束的预约
    List<Order> selectNotConfirmedEnd();
    //更新预约状态为已结束
    int updateEnd(Integer orderId);
    //查询暂时离座的集合
    List<Order> selectStepOutSet();

    List<String> selectStuIdSetByDate(String orderDate);
    int selectCollegeByStuId(String stuId);
    List<Order> selectOccupiedSeat(HashMap<String,Object> map);
    OccupancyRate selectRate(String usualDate);
    int selectCountOrders(String orderDate);
    int insertRate(HashMap<String,Object> map);
}
