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
public class MesStorage {
    private Integer id;

    private String storageName;

    private String storageRemark;

    private String storageOperator;

    private Date storageOperateTime;

    private String storageOperateIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStorageName() {
        return storageName;
    }

    public void setStorageName(String storageName) {
        this.storageName = storageName == null ? null : storageName.trim();
    }

    public String getStorageRemark() {
        return storageRemark;
    }

    public void setStorageRemark(String storageRemark) {
        this.storageRemark = storageRemark == null ? null : storageRemark.trim();
    }

    public String getStorageOperator() {
        return storageOperator;
    }

    public void setStorageOperator(String storageOperator) {
        this.storageOperator = storageOperator == null ? null : storageOperator.trim();
    }

    public Date getStorageOperateTime() {
        return storageOperateTime;
    }

    public void setStorageOperateTime(Date storageOperateTime) {
        this.storageOperateTime = storageOperateTime;
    }

    public String getStorageOperateIp() {
        return storageOperateIp;
    }

    public void setStorageOperateIp(String storageOperateIp) {
        this.storageOperateIp = storageOperateIp == null ? null : storageOperateIp.trim();
    }
}