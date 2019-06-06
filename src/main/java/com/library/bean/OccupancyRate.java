package com.library.bean;

import java.math.BigDecimal;

public class OccupancyRate {
    private String usualDate;
    private BigDecimal rate;

    public OccupancyRate() { }

    public OccupancyRate(String usualDate, BigDecimal rate) {
        this.usualDate = usualDate;
        this.rate = rate;
    }

    public String getUsualDate() {
        return usualDate;
    }

    public void setUsualDate(String usualDate) {
        this.usualDate = usualDate;
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }
}
