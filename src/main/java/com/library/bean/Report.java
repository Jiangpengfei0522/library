package com.library.bean;

public class Report {
    private String stuId;
    private Integer floorId;
    private String blockId;
    private Integer deskId;
    private String seatId;
    private String reportDate;
    private String reportTime;
    private Integer orderId;
    private Integer isConfirmed;
    private Integer subScore;
    private Integer addScore;
    private Integer reportId;

    public Report() {
    }

    public Report(String stuId, Integer floorId, String blockId, Integer deskId, String seatId, String reportDate, String reportTime, Integer orderId, Integer isConfirmed, Integer subScore, Integer addScore, Integer reportId) {
        this.stuId = stuId;
        this.floorId = floorId;
        this.blockId = blockId;
        this.deskId = deskId;
        this.seatId = seatId;
        this.reportDate = reportDate;
        this.reportTime = reportTime;
        this.orderId = orderId;
        this.isConfirmed = isConfirmed;
        this.subScore = subScore;
        this.addScore = addScore;
        this.reportId = reportId;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public Integer getFloorId() {
        return floorId;
    }

    public void setFloorId(Integer floorId) {
        this.floorId = floorId;
    }

    public String getBlockId() {
        return blockId;
    }

    public void setBlockId(String blockId) {
        this.blockId = blockId;
    }

    public Integer getDeskId() {
        return deskId;
    }

    public void setDeskId(Integer deskId) {
        this.deskId = deskId;
    }

    public String getSeatId() {
        return seatId;
    }

    public void setSeatId(String seatId) {
        this.seatId = seatId;
    }

    public String getReportDate() {
        return reportDate;
    }

    public void setReportDate(String reportDate) {
        this.reportDate = reportDate;
    }

    public String getReportTime() {
        return reportTime;
    }

    public void setReportTime(String reportTime) {
        this.reportTime = reportTime;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getIsConfirmed() {
        return isConfirmed;
    }

    public void setIsConfirmed(Integer isConfirmed) {
        this.isConfirmed = isConfirmed;
    }

    public Integer getSubScore() {
        return subScore;
    }

    public void setSubScore(Integer subScore) {
        this.subScore = subScore;
    }

    public Integer getAddScore() {
        return addScore;
    }

    public void setAddScore(Integer addScore) {
        this.addScore = addScore;
    }

    public Integer getReportId() {
        return reportId;
    }

    public void setReportId(Integer reportId) {
        this.reportId = reportId;
    }
}
