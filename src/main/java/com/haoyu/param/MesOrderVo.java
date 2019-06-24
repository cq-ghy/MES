package com.haoyu.param;

import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.haoyu.model.MesOrder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class MesOrderVo{
	//接收批量生成的order个数
	@Min(1)
	private Integer count=1;//这个数字就算是没有值，默认是1
	
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
    
    @NotBlank(message="来料日期不可以为空")
    private String comeTime;
    
    @NotBlank(message="提交日期不可以为空")
    private String commitTime;
    
}
