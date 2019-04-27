package com.library.service.impl;

import com.library.bean.PageBean;
import com.library.bean.UserInfo;
import com.library.mapper.UserMapper;
import com.library.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("uService")
public class UserServiceImpl implements IUserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public UserInfo selectByStuId(String stuId) {
        return userMapper.selectByStuId(stuId);
    }

    @Override
    public PageBean<UserInfo> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<UserInfo> pageBean = new PageBean<UserInfo>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = userMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<UserInfo> lists = userMapper.selectByPage(map);
        pageBean.setLists(lists);

        return pageBean;
    }

    @Override
    public List<UserInfo> selectUserList() {
        return userMapper.selectUserList();
    }

    @Override
    public int selectCount() {
        return userMapper.selectCount();
    }

    @Override
    public int updateByPrimaryKey(UserInfo record) {
        return userMapper.updateByPrimaryKey(record);
    }
}
