package com.haoyu.param;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MesStockVo {
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
