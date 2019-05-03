package com.library.bean;

public class Seat {
    private Integer floorId;
    private String blockId;
    private Integer deskId;
    private String seatId;
    private Integer isUsed;
    private String usedDate;

    public Seat() {
    }

    public Seat(Integer floorId, String blockId, Integer deskId, String seatId, Integer isUsed, String usedDate) {
        this.floorId = floorId;
        this.blockId = blockId;
        this.deskId = deskId;
        this.seatId = seatId;
        this.isUsed = isUsed;
        this.usedDate = usedDate;
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

    public Integer getIsUsed() {
        return isUsed;
    }

    public void setIsUsed(Integer isUsed) {
        this.isUsed = isUsed;
    }

    public String getUsedDate() {
        return usedDate;
    }

    public void setUsedDate(String usedDate) {
        this.usedDate = usedDate;
    }
}
