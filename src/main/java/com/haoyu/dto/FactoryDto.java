package com.haoyu.dto;

import java.util.Date;

import com.haoyu.model.MesOrder;
import com.haoyu.model.MesProduct;
import com.haoyu.model.MesStep;
import com.haoyu.model.MesStorage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class FactoryDto {
	private MesStorage storage;
	private MesProduct product;
	private MesOrder order;
	private MesStep step;
	//TODO   排产关联类
	//
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

}