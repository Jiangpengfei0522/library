package com.library.service.impl;

import com.library.bean.PageBean;
import com.library.bean.Report;
import com.library.mapper.ReportMapper;
import com.library.service.IReportService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("rService")
public class ReportServiceImpl implements IReportService {

    @Resource
    ReportMapper reportMapper;

    @Override
    public PageBean<Report> selectReportByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Report> pageBean = new PageBean<Report>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = reportMapper.selectCountReport();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Report> lists = reportMapper.selectReportByPage(map);
        pageBean.setLists(lists);

        return pageBean;
    }

    @Override
    public int updateIsConfirmed(HashMap<String, Object> map) {
        return reportMapper.updateIsConfirmed(map);
    }

    @Override
    public Report selectSingleReport(Integer reportId) {
        return reportMapper.selectSingleReport(reportId);
    }
}
