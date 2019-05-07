package com.library.mapper;

import com.library.bean.UserInfo;

import java.util.HashMap;
import java.util.List;

public interface UserMapper {
    //查询一个用户
    UserInfo selectByStuId(String stuId);
    UserInfo selectByStuIdForAuth(String stuId);
    //分页操作
    List<UserInfo> selectByPage(HashMap<String,Object> map);
    List<UserInfo> selectByPageForAuth(HashMap<String,Object> map);
    //查询所有未审核的用户
    List<UserInfo> selectUserList();
    //查询未审核用户记录总数
    int selectCount();
    int selectCountForAuth();
    //更新用户状态为已审核
    int updateByPrimaryKey(UserInfo record);
    //更新用户账号权限
    int updateAuthByPrimaryKey(UserInfo record);
    int countLostFaithPeople();
}
