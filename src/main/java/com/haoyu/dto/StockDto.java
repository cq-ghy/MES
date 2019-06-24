package com.haoyu.dto;

import java.util.Date;

import com.haoyu.model.MesOrder;
import com.haoyu.model.MesProduct;
import com.haoyu.model.MesStorage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class StockDto {
	private MesStorage storage;
	
	private MesProduct product;
	
	private MesOrder order;
	
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
}