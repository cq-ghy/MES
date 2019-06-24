package com.haoyu.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MesOrder {
    private Integer id;

    private String orderId;

    private String orderClientname;

    private String orderProductname;

    private String orderContractid;

    private String orderImgid;

    private String orderMaterialname;

    private Date orderCometime;

    private Date orderCommittime;

    private Integer orderInventorystatus;

    private String orderSalestatus;

    private String orderMaterialsource;

    private Integer orderHurrystatus;

    private Integer orderStatus;

    private String orderRemark;

    private String orderOperator;

    private Date orderOperateTime;

    private String orderOperateIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getOrderClientname() {
        return orderClientname;
    }

    public void setOrderClientname(String orderClientname) {
        this.orderClientname = orderClientname == null ? null : orderClientname.trim();
    }

    public String getOrderProductname() {
        return orderProductname;
    }

    public void setOrderProductname(String orderProductname) {
        this.orderProductname = orderProductname == null ? null : orderProductname.trim();
    }

    public String getOrderContractid() {
        return orderContractid;
    }

    public void setOrderContractid(String orderContractid) {
        this.orderContractid = orderContractid == null ? null : orderContractid.trim();
    }

    public String getOrderImgid() {
        return orderImgid;
    }

    public void setOrderImgid(String orderImgid) {
        this.orderImgid = orderImgid == null ? null : orderImgid.trim();
    }

    public String getOrderMaterialname() {
        return orderMaterialname;
    }

    public void setOrderMaterialname(String orderMaterialname) {
        this.orderMaterialname = orderMaterialname == null ? null : orderMaterialname.trim();
    }

    public Date getOrderCometime() {
        return orderCometime;
    }

    public void setOrderCometime(Date orderCometime) {
        this.orderCometime = orderCometime;
    }

    public Date getOrderCommittime() {
        return orderCommittime;
    }

    public void setOrderCommittime(Date orderCommittime) {
        this.orderCommittime = orderCommittime;
    }

    public Integer getOrderInventorystatus() {
        return orderInventorystatus;
    }

    public void setOrderInventorystatus(Integer orderInventorystatus) {
        this.orderInventorystatus = orderInventorystatus;
    }

    public String getOrderSalestatus() {
        return orderSalestatus;
    }

    public void setOrderSalestatus(String orderSalestatus) {
        this.orderSalestatus = orderSalestatus == null ? null : orderSalestatus.trim();
    }

    public String getOrderMaterialsource() {
        return orderMaterialsource;
    }

    public void setOrderMaterialsource(String orderMaterialsource) {
        this.orderMaterialsource = orderMaterialsource == null ? null : orderMaterialsource.trim();
    }

    public Integer getOrderHurrystatus() {
        return orderHurrystatus;
    }

    public void setOrderHurrystatus(Integer orderHurrystatus) {
        this.orderHurrystatus = orderHurrystatus;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderRemark() {
        return orderRemark;
    }

    public void setOrderRemark(String orderRemark) {
        this.orderRemark = orderRemark == null ? null : orderRemark.trim();
    }

    public String getOrderOperator() {
        return orderOperator;
    }

    public void setOrderOperator(String orderOperator) {
        this.orderOperator = orderOperator == null ? null : orderOperator.trim();
    }

    public Date getOrderOperateTime() {
        return orderOperateTime;
    }

    public void setOrderOperateTime(Date orderOperateTime) {
        this.orderOperateTime = orderOperateTime;
    }

    public String getOrderOperateIp() {
        return orderOperateIp;
    }

    public void setOrderOperateIp(String orderOperateIp) {
        this.orderOperateIp = orderOperateIp == null ? null : orderOperateIp.trim();
    }
}