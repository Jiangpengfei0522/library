package com.library.bean;

public class Order {
    private String stuId;
    private Integer floorId;
    private String blockId;
    private Integer deskId;
    private String seatId;
    private String orderDate;
    private String orderTime;
    private String orderWeek;
    private Integer isUsing;
    private Integer sub_score;
    private Integer orderId;
    private String arrivedPhoto;
    private Integer isArrived;
    private String stepOutTime;

    public Order() {
    }

    public Order(String stuId, Integer floorId, String blockId, Integer deskId, String seatId, String orderDate, String orderTime, String orderWeek, Integer isUsing, Integer sub_score, Integer orderId, String arrivedPhoto, Integer isArrived, String stepOutTime) {
        this.stuId = stuId;
        this.floorId = floorId;
        this.blockId = blockId;
        this.deskId = deskId;
        this.seatId = seatId;
        this.orderDate = orderDate;
        this.orderTime = orderTime;
        this.orderWeek = orderWeek;
        this.isUsing = isUsing;
        this.sub_score = sub_score;
        this.orderId = orderId;
        this.arrivedPhoto = arrivedPhoto;
        this.isArrived = isArrived;
        this.stepOutTime = stepOutTime;
    }

    public String getStepOutTime() {
        return stepOutTime;
    }

    public void setStepOutTime(String stepOutTime) {
        this.stepOutTime = stepOutTime;
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

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getOrderWeek() {
        return orderWeek;
    }

    public void setOrderWeek(String orderWeek) {
        this.orderWeek = orderWeek;
    }

    public Integer getIsUsing() {
        return isUsing;
    }

    public void setIsUsing(Integer isUsing) {
        this.isUsing = isUsing;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getArrivedPhoto() {
        return arrivedPhoto;
    }

    public void setArrivedPhoto(String arrivedPhoto) {
        this.arrivedPhoto = arrivedPhoto;
    }

    public Integer getIsArrived() {
        return isArrived;
    }

    public void setIsArrived(Integer isArrived) {
        this.isArrived = isArrived;
    }

    public Integer getSub_score() {
        return sub_score;
    }

    public void setSub_score(Integer sub_score) {
        this.sub_score = sub_score;
    }

    @Override
    public String toString() {
        return "Order{" +
                "stuId='" + stuId + '\'' +
                ", floorId=" + floorId +
                ", blockId='" + blockId + '\'' +
                ", deskId=" + deskId +
                ", seatId='" + seatId + '\'' +
                ", orderDate='" + orderDate + '\'' +
                ", orderTime='" + orderTime + '\'' +
                ", orderWeek='" + orderWeek + '\'' +
                ", isUsing=" + isUsing +
                ", sub_score=" + sub_score +
                ", orderId=" + orderId +
                ", arrivedPhoto='" + arrivedPhoto + '\'' +
                ", isArrived=" + isArrived +
                ",stepOutTime" + stepOutTime+
                '}';
    }
}
