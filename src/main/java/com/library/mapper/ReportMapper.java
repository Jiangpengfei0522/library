package com.library.mapper;

import com.library.bean.Report;

import java.util.HashMap;
import java.util.List;

public interface ReportMapper {
    //分页查询举报记录
    List<Report> selectReportByPage(HashMap<String,Object> map);
    //更改举报记录状态
    int updateIsConfirmed(HashMap<String,Object> map);
    int selectCountReport();
    Report selectSingleReport(Integer reportId);
}
