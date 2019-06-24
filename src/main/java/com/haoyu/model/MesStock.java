package com.haoyu.model;

import java.util.Date;

import com.haoyu.model.MesProduct.MesProductBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MesStock {
    private Integer id;

    private Integer stockStorageid;

    private Integer stockProductid;

    private Integer stockOrderid;

    private String stockOrdername;

    private String stockImgid;

    private String stockProductname;

    private String stockProductsource;

    private Integer stockStoragestatus;

    private String stockCheckremark;

    private String stockRemark;

    private Integer stockParentid;

    private String stockOutobj;

    private Date stockIntime;

    private Date stockOuttime;

    private Integer stockStatus;

    private String stockOperator;

    private Date stockOperateTime;

    private String stockOperateIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStockStorageid() {
        return stockStorageid;
    }

    public void setStockStorageid(Integer stockStorageid) {
        this.stockStorageid = stockStorageid;
    }

    public Integer getStockProductid() {
        return stockProductid;
    }

    public void setStockProductid(Integer stockProductid) {
        this.stockProductid = stockProductid;
    }

    public Integer getStockOrderid() {
        return stockOrderid;
    }

    public void setStockOrderid(Integer stockOrderid) {
        this.stockOrderid = stockOrderid;
    }

    public String getStockOrdername() {
        return stockOrdername;
    }

    public void setStockOrdername(String stockOrdername) {
        this.stockOrdername = stockOrdername == null ? null : stockOrdername.trim();
    }

    public String getStockImgid() {
        return stockImgid;
    }

    public void setStockImgid(String stockImgid) {
        this.stockImgid = stockImgid == null ? null : stockImgid.trim();
    }

    public String getStockProductname() {
        return stockProductname;
    }

    public void setStockProductname(String stockProductname) {
        this.stockProductname = stockProductname == null ? null : stockProductname.trim();
    }

    public String getStockProductsource() {
        return stockProductsource;
    }

    public void setStockProductsource(String stockProductsource) {
        this.stockProductsource = stockProductsource == null ? null : stockProductsource.trim();
    }

    public Integer getStockStoragestatus() {
        return stockStoragestatus;
    }

    public void setStockStoragestatus(Integer stockStoragestatus) {
        this.stockStoragestatus = stockStoragestatus;
    }

    public String getStockCheckremark() {
        return stockCheckremark;
    }

    public void setStockCheckremark(String stockCheckremark) {
        this.stockCheckremark = stockCheckremark == null ? null : stockCheckremark.trim();
    }

    public String getStockRemark() {
        return stockRemark;
    }

    public void setStockRemark(String stockRemark) {
        this.stockRemark = stockRemark == null ? null : stockRemark.trim();
    }

    public Integer getStockParentid() {
        return stockParentid;
    }

    public void setStockParentid(Integer stockParentid) {
        this.stockParentid = stockParentid;
    }

    public String getStockOutobj() {
        return stockOutobj;
    }

    public void setStockOutobj(String stockOutobj) {
        this.stockOutobj = stockOutobj == null ? null : stockOutobj.trim();
    }

    public Date getStockIntime() {
        return stockIntime;
    }

    public void setStockIntime(Date stockIntime) {
        this.stockIntime = stockIntime;
    }

    public Date getStockOuttime() {
        return stockOuttime;
    }

    public void setStockOuttime(Date stockOuttime) {
        this.stockOuttime = stockOuttime;
    }

    public Integer getStockStatus() {
        return stockStatus;
    }

    public void setStockStatus(Integer stockStatus) {
        this.stockStatus = stockStatus;
    }

    public String getStockOperator() {
        return stockOperator;
    }

    public void setStockOperator(String stockOperator) {
        this.stockOperator = stockOperator == null ? null : stockOperator.trim();
    }

    public Date getStockOperateTime() {
        return stockOperateTime;
    }

    public void setStockOperateTime(Date stockOperateTime) {
        this.stockOperateTime = stockOperateTime;
    }

    public String getStockOperateIp() {
        return stockOperateIp;
    }

    public void setStockOperateIp(String stockOperateIp) {
        this.stockOperateIp = stockOperateIp == null ? null : stockOperateIp.trim();
    }
}