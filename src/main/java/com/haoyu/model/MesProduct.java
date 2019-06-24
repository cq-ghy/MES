package com.haoyu.model;

import java.util.Date;

import com.haoyu.model.MesPlan.MesPlanBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MesProduct {
    private Integer id;

    private Integer pId;

    private String productId;

    private Integer productOrderid;

    private Integer productPlanid;

    private Float productTargetweight;

    private Float productRealweight;

    private Float productLeftweight;

    private Float productBakweight;

    private String productIrontype;

    private Float productIrontypeweight;

    private String productMaterialname;

    private String productImgid;

    private String productMaterialsource;

    private Integer productStatus;

    private String productRemark;

    private String productOperator;

    private Date productOperateTime;

    private String productOperateIp;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId == null ? null : productId.trim();
    }

    public Integer getProductOrderid() {
        return productOrderid;
    }

    public void setProductOrderid(Integer productOrderid) {
        this.productOrderid = productOrderid;
    }

    public Integer getProductPlanid() {
        return productPlanid;
    }

    public void setProductPlanid(Integer productPlanid) {
        this.productPlanid = productPlanid;
    }

    public Float getProductTargetweight() {
        return productTargetweight;
    }

    public void setProductTargetweight(Float productTargetweight) {
        this.productTargetweight = productTargetweight;
    }

    public Float getProductRealweight() {
        return productRealweight;
    }

    public void setProductRealweight(Float productRealweight) {
        this.productRealweight = productRealweight;
    }

    public Float getProductLeftweight() {
        return productLeftweight;
    }

    public void setProductLeftweight(Float productLeftweight) {
        this.productLeftweight = productLeftweight;
    }

    public Float getProductBakweight() {
        return productBakweight;
    }

    public void setProductBakweight(Float productBakweight) {
        this.productBakweight = productBakweight;
    }

    public String getProductIrontype() {
        return productIrontype;
    }

    public void setProductIrontype(String productIrontype) {
        this.productIrontype = productIrontype == null ? null : productIrontype.trim();
    }

    public Float getProductIrontypeweight() {
        return productIrontypeweight;
    }

    public void setProductIrontypeweight(Float productIrontypeweight) {
        this.productIrontypeweight = productIrontypeweight;
    }

    public String getProductMaterialname() {
        return productMaterialname;
    }

    public void setProductMaterialname(String productMaterialname) {
        this.productMaterialname = productMaterialname == null ? null : productMaterialname.trim();
    }

    public String getProductImgid() {
        return productImgid;
    }

    public void setProductImgid(String productImgid) {
        this.productImgid = productImgid == null ? null : productImgid.trim();
    }

    public String getProductMaterialsource() {
        return productMaterialsource;
    }

    public void setProductMaterialsource(String productMaterialsource) {
        this.productMaterialsource = productMaterialsource == null ? null : productMaterialsource.trim();
    }

    public Integer getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(Integer productStatus) {
        this.productStatus = productStatus;
    }

    public String getProductRemark() {
        return productRemark;
    }

    public void setProductRemark(String productRemark) {
        this.productRemark = productRemark == null ? null : productRemark.trim();
    }

    public String getProductOperator() {
        return productOperator;
    }

    public void setProductOperator(String productOperator) {
        this.productOperator = productOperator == null ? null : productOperator.trim();
    }

    public Date getProductOperateTime() {
        return productOperateTime;
    }

    public void setProductOperateTime(Date productOperateTime) {
        this.productOperateTime = productOperateTime;
    }

    public String getProductOperateIp() {
        return productOperateIp;
    }

    public void setProductOperateIp(String productOperateIp) {
        this.productOperateIp = productOperateIp == null ? null : productOperateIp.trim();
    }
}