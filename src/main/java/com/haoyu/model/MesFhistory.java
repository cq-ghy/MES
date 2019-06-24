package com.haoyu.model;

import java.util.Date;

import com.haoyu.model.MesFactory.MesFactoryBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MesFhistory {
    private Integer id;

    private Integer fhistoryFactoryid;

    private String fhistoryStep;

    private Date fhistoryStarttime;

    private Date fhistoryEndtime;

    private String fhistoryRemark;

    private String fhistoryOperator;

    private Date fhistoryOperateTime;

    private String fhistoryOperateIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFhistoryFactoryid() {
        return fhistoryFactoryid;
    }

    public void setFhistoryFactoryid(Integer fhistoryFactoryid) {
        this.fhistoryFactoryid = fhistoryFactoryid;
    }

    public String getFhistoryStep() {
        return fhistoryStep;
    }

    public void setFhistoryStep(String fhistoryStep) {
        this.fhistoryStep = fhistoryStep == null ? null : fhistoryStep.trim();
    }

    public Date getFhistoryStarttime() {
        return fhistoryStarttime;
    }

    public void setFhistoryStarttime(Date fhistoryStarttime) {
        this.fhistoryStarttime = fhistoryStarttime;
    }

    public Date getFhistoryEndtime() {
        return fhistoryEndtime;
    }

    public void setFhistoryEndtime(Date fhistoryEndtime) {
        this.fhistoryEndtime = fhistoryEndtime;
    }

    public String getFhistoryRemark() {
        return fhistoryRemark;
    }

    public void setFhistoryRemark(String fhistoryRemark) {
        this.fhistoryRemark = fhistoryRemark == null ? null : fhistoryRemark.trim();
    }

    public String getFhistoryOperator() {
        return fhistoryOperator;
    }

    public void setFhistoryOperator(String fhistoryOperator) {
        this.fhistoryOperator = fhistoryOperator == null ? null : fhistoryOperator.trim();
    }

    public Date getFhistoryOperateTime() {
        return fhistoryOperateTime;
    }

    public void setFhistoryOperateTime(Date fhistoryOperateTime) {
        this.fhistoryOperateTime = fhistoryOperateTime;
    }

    public String getFhistoryOperateIp() {
        return fhistoryOperateIp;
    }

    public void setFhistoryOperateIp(String fhistoryOperateIp) {
        this.fhistoryOperateIp = fhistoryOperateIp == null ? null : fhistoryOperateIp.trim();
    }
}