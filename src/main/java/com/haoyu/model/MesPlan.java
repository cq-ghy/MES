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
public class MesPlan {
    private Integer id;

    private String planOrderid;

    private String planProductname;

    private String planClientname;

    private String planContractid;

    private String planImgid;

    private String planMaterialname;

    private String planMaterialdesc;

    private String planCurrentstatus;

    private String planCurrentremark;

    private String planSalestatus;

    private String planMaterialsource;

    private Integer planHurrystatus;

    private Integer planStatus;

    private Date planCometime;

    private Date planCommittime;

    private Date planWorkstarttime;

    private Date planWorkendtime;

    private Integer planInventorystatus;

    private String planRemark;

    private String planOperator;

    private Date planOperateTime;

    private String planOperateIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPlanOrderid() {
        return planOrderid;
    }

    public void setPlanOrderid(String planOrderid) {
        this.planOrderid = planOrderid == null ? null : planOrderid.trim();
    }

    public String getPlanProductname() {
        return planProductname;
    }

    public void setPlanProductname(String planProductname) {
        this.planProductname = planProductname == null ? null : planProductname.trim();
    }

    public String getPlanClientname() {
        return planClientname;
    }

    public void setPlanClientname(String planClientname) {
        this.planClientname = planClientname == null ? null : planClientname.trim();
    }

    public String getPlanContractid() {
        return planContractid;
    }

    public void setPlanContractid(String planContractid) {
        this.planContractid = planContractid == null ? null : planContractid.trim();
    }

    public String getPlanImgid() {
        return planImgid;
    }

    public void setPlanImgid(String planImgid) {
        this.planImgid = planImgid == null ? null : planImgid.trim();
    }

    public String getPlanMaterialname() {
        return planMaterialname;
    }

    public void setPlanMaterialname(String planMaterialname) {
        this.planMaterialname = planMaterialname == null ? null : planMaterialname.trim();
    }

    public String getPlanMaterialdesc() {
        return planMaterialdesc;
    }

    public void setPlanMaterialdesc(String planMaterialdesc) {
        this.planMaterialdesc = planMaterialdesc == null ? null : planMaterialdesc.trim();
    }

    public String getPlanCurrentstatus() {
        return planCurrentstatus;
    }

    public void setPlanCurrentstatus(String planCurrentstatus) {
        this.planCurrentstatus = planCurrentstatus == null ? null : planCurrentstatus.trim();
    }

    public String getPlanCurrentremark() {
        return planCurrentremark;
    }

    public void setPlanCurrentremark(String planCurrentremark) {
        this.planCurrentremark = planCurrentremark == null ? null : planCurrentremark.trim();
    }

    public String getPlanSalestatus() {
        return planSalestatus;
    }

    public void setPlanSalestatus(String planSalestatus) {
        this.planSalestatus = planSalestatus == null ? null : planSalestatus.trim();
    }

    public String getPlanMaterialsource() {
        return planMaterialsource;
    }

    public void setPlanMaterialsource(String planMaterialsource) {
        this.planMaterialsource = planMaterialsource == null ? null : planMaterialsource.trim();
    }

    public Integer getPlanHurrystatus() {
        return planHurrystatus;
    }

    public void setPlanHurrystatus(Integer planHurrystatus) {
        this.planHurrystatus = planHurrystatus;
    }

    public Integer getPlanStatus() {
        return planStatus;
    }

    public void setPlanStatus(Integer planStatus) {
        this.planStatus = planStatus;
    }

    public Date getPlanCometime() {
        return planCometime;
    }

    public void setPlanCometime(Date planCometime) {
        this.planCometime = planCometime;
    }

    public Date getPlanCommittime() {
        return planCommittime;
    }

    public void setPlanCommittime(Date planCommittime) {
        this.planCommittime = planCommittime;
    }

    public Date getPlanWorkstarttime() {
        return planWorkstarttime;
    }

    public void setPlanWorkstarttime(Date planWorkstarttime) {
        this.planWorkstarttime = planWorkstarttime;
    }

    public Date getPlanWorkendtime() {
        return planWorkendtime;
    }

    public void setPlanWorkendtime(Date planWorkendtime) {
        this.planWorkendtime = planWorkendtime;
    }

    public Integer getPlanInventorystatus() {
        return planInventorystatus;
    }

    public void setPlanInventorystatus(Integer planInventorystatus) {
        this.planInventorystatus = planInventorystatus;
    }

    public String getPlanRemark() {
        return planRemark;
    }

    public void setPlanRemark(String planRemark) {
        this.planRemark = planRemark == null ? null : planRemark.trim();
    }

    public String getPlanOperator() {
        return planOperator;
    }

    public void setPlanOperator(String planOperator) {
        this.planOperator = planOperator == null ? null : planOperator.trim();
    }

    public Date getPlanOperateTime() {
        return planOperateTime;
    }

    public void setPlanOperateTime(Date planOperateTime) {
        this.planOperateTime = planOperateTime;
    }

    public String getPlanOperateIp() {
        return planOperateIp;
    }

    public void setPlanOperateIp(String planOperateIp) {
        this.planOperateIp = planOperateIp == null ? null : planOperateIp.trim();
    }
}