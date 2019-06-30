package com.library.service.impl;

import com.library.bean.OccupancyRate;
import com.library.bean.Order;
import com.library.bean.PageBean;
import com.library.bean.UserInfo;
import com.library.mapper.OrderMapper;
import com.library.service.IOrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("oService")
public class OrderServiceImpl implements IOrderService {
    @Resource
    OrderMapper orderMapper;

    @Override
    public Order selectByOrderId(Integer orderId) {
        return orderMapper.selectByOrderId(orderId);
    }

    @Override
    public List<Order> selectNotConfirmedEnd() {
        return orderMapper.selectNotConfirmedEnd();
    }

    @Override
    public int updateEnd(Integer orderId) {
        return orderMapper.updateEnd(orderId);
    }

    @Override
    public List<Order> selectStepOutSet() {
        return orderMapper.selectStepOutSet();
    }

    @Override
    public  PageBean<Order> selectOrderByPage(int currentPage,String stuId) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Order> pageBean = new PageBean<Order>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = orderMapper.selectCount(stuId);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        map.put("stuId",stuId);
        //封装每页显示的数据
        List<Order> lists = orderMapper.selectOrderByPage(map);
        pageBean.setLists(lists);
        pageBean.setStuId(stuId);
        return pageBean;
    }

    @Override
    public int updateConfirmByOrderId(Integer orderId) {
        return orderMapper.updateConfirmByOrderId(orderId);
    }

    @Override
    public int updateDefaultByOrderId(HashMap<String,Object> map) {
        return orderMapper.updateDefaultByOrderId(map);
    }

    @Override
    public int updateCreditScoreByOrderId(UserInfo userInfo) {
        return orderMapper.updateCreditScoreByOrderId(userInfo);
    }

    @Override
    public List<Order> selectNoArrivedOrderList() {
        return orderMapper.selectNoArrivedOrderList();
    }

    @Override
    public List<String> selectStuIdSetByDate(String orderDate) {
        return orderMapper.selectStuIdSetByDate(orderDate);
    }

    @Override
    public int selectCollegeByStuId(String stuId) {
        return orderMapper.selectCollegeByStuId(stuId);
    }

    @Override
    public List<Order> selectOccupiedSeat(HashMap<String,Object> map) {
        return orderMapper.selectOccupiedSeat(map);
    }

    @Override
    public OccupancyRate selectRate(String usualDate) {
        return orderMapper.selectRate(usualDate);
    }

    @Override
    public int selectCountOrders(String orderDate) {
        return orderMapper.selectCountOrders(orderDate);
    }

    @Override
    public int insertRate(HashMap<String, Object> map) {
        return orderMapper.insertRate(map);
    }
}
