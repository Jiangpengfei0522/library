package com.library.service;

import com.library.bean.PageBean;
import com.library.bean.Report;

import java.util.HashMap;
import java.util.List;

public interface IReportService {
    //分页查询举报记录
    PageBean<Report> selectReportByPage(int currentPage,String stuId);
    //更改举报记录状态
    int updateIsConfirmed(HashMap<String,Object> map);
    Report selectSingleReport(Integer reportId);
}
