package com.library.service.impl;

import com.library.mapper.ManagerMapper;
import com.library.service.IManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("mService")
public class ManagerServiceImpl implements IManagerService {
    @Resource
    private ManagerMapper managerMapper;

    public String getPassByName(String username){
        return this.managerMapper.selectPassByName(username);
    }
}
