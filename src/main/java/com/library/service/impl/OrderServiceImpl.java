package com.library.service.impl;

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
    public  PageBean<Order> selectOrderByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Order> pageBean = new PageBean<Order>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = orderMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Order> lists = orderMapper.selectOrderByPage(map);
        pageBean.setLists(lists);

        return pageBean;
    }

    @Override
    public int updateConfirmByOrderId(Integer orderId) {
        return orderMapper.updateConfirmByOrderId(orderId);
    }

    @Override
    public int updateDefaultByOrderId(Integer orderId) {
        return orderMapper.updateDefaultByOrderId(orderId);
    }

    @Override
    public int updateCreditScoreByOrderId(UserInfo userInfo) {
        return orderMapper.updateCreditScoreByOrderId(userInfo);
    }

    @Override
    public List<Order> selectOrderList() {
        return orderMapper.selectOrderList();
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
}
