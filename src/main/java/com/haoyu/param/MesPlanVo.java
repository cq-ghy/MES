package com.haoyu.param;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class MesPlanVo {

	private Integer id;// 这个不需要校验，自定auto生成

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
    
    private String planCometime;

    private String planCommittime;

    private String planWorkstarttime;

    private String planWorkendtime;

    private Integer planInventorystatus;

    private String planRemark;
//	private String oid;// 不需要校验，自动生成的不要校验
//
//	@NotBlank(message = "产品名称不可以为空")
//	@Length(max = 40, min = 1, message = "产品名称长度需要定义在1-40个字以内")
//	private String productname;
//
//	@NotBlank(message = "合同编号不可以为空")
//	@Length(max = 40, min = 1, message = "合同编号长度需要定义在1-40个字以内")
//	private String contractid;
//
//	@NotBlank(message = "图号不可以为空")
//	@Length(max = 40, min = 1, message = "图号长度需要定义在1-40个字以内")
//	private String imgid;
//
//	@NotBlank(message = "材料名称不可以为空")
//	@Length(max = 40, min = 1, message = "材料名称长度需要定义在1-40个字以内")
//	private String materialname;
//	
//	@NotBlank(message = "材料情况不可以为空")
//	@Length(max = 40, min = 1, message = "材料情况长度需要定义在1-40个字以内")
//	private String materialdesc;
//	
//	@NotBlank(message = "当前环节不可以为空")
//	@Length(max = 2, min = 1, message = "当前环节2个字符")
//	private String currentstep;
//	
//	@NotBlank(message = "当前环节描述不可以为空")
//	@Length(max = 40, min = 1, message = "环节描述需要定义在1-40个字以内")
//	private String currentremark;
//	
//	@NotBlank(message = "来料日期不可以为空")
//	private String comeTime;
//
//	@NotBlank(message = "提交日期不可以为空")
//	private String commitTime;
//	
//	@NotBlank(message = "启动日期不可以为空")
//	private String startTime;
//
//	@NotBlank(message = "结束日期不可以为空")
//	private String endTime;
//
//	@NotNull(message = "库存状态不能为空")
//	private Integer isinventory;
//
//	@NotBlank(message = "交货状态不可以为空")
//	private String isout;
//
//	@NotBlank(message = "材料来源不可以为空")
//	private String msource;
//
//	@NotNull(message = "加急状态不能为空")
//	private Integer ishurry;
//
//	@NotNull(message = "订单状态不能为空")
//	private Integer status;
//
//	@Length(max = 150, message = "备注的长度必须要在150个字以内")
//	private String remark;
	
}
