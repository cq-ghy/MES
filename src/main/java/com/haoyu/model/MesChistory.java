package com.haoyu.model;

import java.util.Date;

import com.haoyu.model.MesFhistory.MesFhistoryBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MesChistory {
    private Integer id;

    private Integer chistoryFactoryid;

    private String chistoryStep;

    private Date chistoryTime;

    private String chistoryGoal;

    private String chistoryResult;

    private Integer chistoryStorageid;

    private String chistoryRemark;

    private Integer chistoryStatus;

    private String chistoryOperator;

    private Date chistoryOperateTime;

    private String chistoryOperateIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getChistoryFactoryid() {
        return chistoryFactoryid;
    }

    public void setChistoryFactoryid(Integer chistoryFactoryid) {
        this.chistoryFactoryid = chistoryFactoryid;
    }

    public String getChistoryStep() {
        return chistoryStep;
    }

    public void setChistoryStep(String chistoryStep) {
        this.chistoryStep = chistoryStep == null ? null : chistoryStep.trim();
    }

    public Date getChistoryTime() {
        return chistoryTime;
    }

    public void setChistoryTime(Date chistoryTime) {
        this.chistoryTime = chistoryTime;
    }

    public String getChistoryGoal() {
        return chistoryGoal;
    }

    public void setChistoryGoal(String chistoryGoal) {
        this.chistoryGoal = chistoryGoal == null ? null : chistoryGoal.trim();
    }

    public String getChistoryResult() {
        return chistoryResult;
    }

    public void setChistoryResult(String chistoryResult) {
        this.chistoryResult = chistoryResult == null ? null : chistoryResult.trim();
    }

    public Integer getChistoryStorageid() {
        return chistoryStorageid;
    }

    public void setChistoryStorageid(Integer chistoryStorageid) {
        this.chistoryStorageid = chistoryStorageid;
    }

    public String getChistoryRemark() {
        return chistoryRemark;
    }

    public void setChistoryRemark(String chistoryRemark) {
        this.chistoryRemark = chistoryRemark == null ? null : chistoryRemark.trim();
    }

    public Integer getChistoryStatus() {
        return chistoryStatus;
    }

    public void setChistoryStatus(Integer chistoryStatus) {
        this.chistoryStatus = chistoryStatus;
    }

    public String getChistoryOperator() {
        return chistoryOperator;
    }

    public void setChistoryOperator(String chistoryOperator) {
        this.chistoryOperator = chistoryOperator == null ? null : chistoryOperator.trim();
    }

    public Date getChistoryOperateTime() {
        return chistoryOperateTime;
    }

    public void setChistoryOperateTime(Date chistoryOperateTime) {
        this.chistoryOperateTime = chistoryOperateTime;
    }

    public String getChistoryOperateIp() {
        return chistoryOperateIp;
    }

    public void setChistoryOperateIp(String chistoryOperateIp) {
        this.chistoryOperateIp = chistoryOperateIp == null ? null : chistoryOperateIp.trim();
    }
}