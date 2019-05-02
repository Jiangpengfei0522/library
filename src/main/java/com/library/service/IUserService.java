package com.library.service;

import com.library.bean.PageBean;
import com.library.bean.UserInfo;

import java.util.HashMap;
import java.util.List;

public interface IUserService {
//    //查询一个用户
//    UserInfo selectByStuId(String stuId);
//    //分页操作
//    List<UserInfo> selectByPage(HashMap<String,Object> map);
//    //查询所有未审核的用户
//    List<UserInfo> selectUserList();
//    //查询未审核用户记录总数
//    int selectCount();
//    //更新用户状态为已审核
//    int updateByPrimaryKey(UserInfo record);
    UserInfo selectByStuId(String stuId);
    UserInfo selectByStuIdForAuth(String stuId);
    PageBean<UserInfo> findByPage(int currentPage);
    PageBean<UserInfo> findByPageForAuth(int currentPage);
    List<UserInfo> selectUserList();
    int selectCount();
    int selectCountForAuth();
    int updateByPrimaryKey(UserInfo record);
    int updateAuthByPrimaryKey(UserInfo record);
}
