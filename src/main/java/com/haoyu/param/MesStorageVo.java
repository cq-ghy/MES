package com.haoyu.param;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MesStorageVo {

    private Integer id;
    
    @NotBlank(message="库房名称不可以为空")
    @Length(max=10,min=1,message="库房名称长度需要定义在10个字以内")
    private String storageName;

    private String storageRemark;
}
