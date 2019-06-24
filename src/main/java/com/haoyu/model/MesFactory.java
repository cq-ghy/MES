package com.haoyu.model;

import java.util.Date;

import com.haoyu.model.MesOrder.MesOrderBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MesFactory {
    private Integer id;

    private Integer factoryStorageid;

    private Integer factoryProductid;

    private Integer factoryOrderid;

    private Integer factoryPreid;

    private String factoryProstatus;

    private String factoryRemark;

    private Integer factoryStatus;

    private String factoryOperator;

    private Date factoryOperateTime;

    private String factoryOperateIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFactoryStorageid() {
        return factoryStorageid;
    }

    public void setFactoryStorageid(Integer factoryStorageid) {
        this.factoryStorageid = factoryStorageid;
    }

    public Integer getFactoryProductid() {
        return factoryProductid;
    }

    public void setFactoryProductid(Integer factoryProductid) {
        this.factoryProductid = factoryProductid;
    }

    public Integer getFactoryOrderid() {
        return factoryOrderid;
    }

    public void setFactoryOrderid(Integer factoryOrderid) {
        this.factoryOrderid = factoryOrderid;
    }

    public Integer getFactoryPreid() {
        return factoryPreid;
    }

    public void setFactoryPreid(Integer factoryPreid) {
        this.factoryPreid = factoryPreid;
    }

    public String getFactoryProstatus() {
        return factoryProstatus;
    }

    public void setFactoryProstatus(String factoryProstatus) {
        this.factoryProstatus = factoryProstatus == null ? null : factoryProstatus.trim();
    }

    public String getFactoryRemark() {
        return factoryRemark;
    }

    public void setFactoryRemark(String factoryRemark) {
        this.factoryRemark = factoryRemark == null ? null : factoryRemark.trim();
    }

    public Integer getFactoryStatus() {
        return factoryStatus;
    }

    public void setFactoryStatus(Integer factoryStatus) {
        this.factoryStatus = factoryStatus;
    }

    public String getFactoryOperator() {
        return factoryOperator;
    }

    public void setFactoryOperator(String factoryOperator) {
        this.factoryOperator = factoryOperator == null ? null : factoryOperator.trim();
    }

    public Date getFactoryOperateTime() {
        return factoryOperateTime;
    }

    public void setFactoryOperateTime(Date factoryOperateTime) {
        this.factoryOperateTime = factoryOperateTime;
    }

    public String getFactoryOperateIp() {
        return factoryOperateIp;
    }

    public void setFactoryOperateIp(String factoryOperateIp) {
        this.factoryOperateIp = factoryOperateIp == null ? null : factoryOperateIp.trim();
    }
}