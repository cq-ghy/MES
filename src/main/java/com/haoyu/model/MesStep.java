package com.haoyu.model;

import java.util.Date;

import com.haoyu.model.MesStock.MesStockBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MesStep {
    private Integer id;

    private String stepName;

    private String stepRemark;

    private String stepOperator;

    private Date stepOperateTime;

    private String stepOperateIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStepName() {
        return stepName;
    }

    public void setStepName(String stepName) {
        this.stepName = stepName == null ? null : stepName.trim();
    }

    public String getStepRemark() {
        return stepRemark;
    }

    public void setStepRemark(String stepRemark) {
        this.stepRemark = stepRemark == null ? null : stepRemark.trim();
    }

    public String getStepOperator() {
        return stepOperator;
    }

    public void setStepOperator(String stepOperator) {
        this.stepOperator = stepOperator == null ? null : stepOperator.trim();
    }

    public Date getStepOperateTime() {
        return stepOperateTime;
    }

    public void setStepOperateTime(Date stepOperateTime) {
        this.stepOperateTime = stepOperateTime;
    }

    public String getStepOperateIp() {
        return stepOperateIp;
    }

    public void setStepOperateIp(String stepOperateIp) {
        this.stepOperateIp = stepOperateIp == null ? null : stepOperateIp.trim();
    }
}