package com.library.mapper;

import org.apache.ibatis.annotations.Param;

public interface ManagerMapper {
    String selectPassByName(@Param("username") String username);
}
