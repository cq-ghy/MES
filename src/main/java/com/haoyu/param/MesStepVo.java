package com.haoyu.param;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class MesStepVo {

    private String id;
    
    @NotBlank(message="工序名称不能为空")
    private String stepName;

    private String stepRemark;

    private String stepOperator;

    private String stepOperateTime;

    private String stepOperateIp;
	
}
