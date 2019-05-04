package com.library.bean;

public class UserInfo {
    private String stuId;
    private String name;
    private String university;
    private String college;
    private Integer creditScore;
    private Integer isConfirmed;
    private String selfPhoto;
    private  String telephone;
    private Integer isForbidden;

    public UserInfo() {
    }

    public UserInfo(String stuId, String name, String university, String college, Integer creditScore, Integer isConfirmed, String selfPhoto, String telephone, Integer isForbidden) {
        this.stuId = stuId;
        this.name = name;
        this.university = university;
        this.college = college;
        this.creditScore = creditScore;
        this.isConfirmed = isConfirmed;
        this.selfPhoto = selfPhoto;
        this.telephone = telephone;
        this.isForbidden = isForbidden;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public Integer getIsConfirmed() {
        return isConfirmed;
    }

    public void setIsConfirmed(Integer isConfirmed) {
        this.isConfirmed = isConfirmed;
    }

    public String getSelfPhoto() {
        return selfPhoto;
    }

    public void setSelfPhoto(String selfPhoto) {
        this.selfPhoto = selfPhoto;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Integer getIsForbidden() {
        return isForbidden;
    }

    public void setIsForbidden(Integer isForbidden) {
        this.isForbidden = isForbidden;
    }

    public Integer getCreditScore() {
        return creditScore;
    }

    public void setCreditScore(Integer creditScore) {
        this.creditScore = creditScore;
    }
}
