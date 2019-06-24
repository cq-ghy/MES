package com.haoyu.dto;

import java.util.List;

import org.springframework.beans.BeanUtils;

import com.google.common.collect.Lists;
import com.haoyu.model.SysDept;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author Administrator
 * 部门层级树模型
 * 含义是：该部门dto中包含子部门层级模型集合空集， 用于等待存储即将放入到结构中做页面呈现的dto
 * dto是直接跟数据库交互的数据传输对象
 * Data Transfer Object 
 * 为了减少数据字段的重复书写，采用继承pojo的模式，引用pojo的字段
 */
//每一个deptleveldto都是一个部门类的增强类，包含了同样部门增强类，凡是该部门的下一级部门都在该增强类中显示出来
@Getter
@Setter
@ToString
public class DeptLevelDto extends SysDept {
	//静态方法简化泛型书写，实际上等同于
	//List<T> list=new ArrayList<T>();
    private List<DeptLevelDto> deptList = Lists.newArrayList();
    //将pojo中的字段传递给跟数据层交互的dto
    //多封装静态方法，便于方法重载和使用
    public static DeptLevelDto adapt(SysDept dept) {
        DeptLevelDto dto = new DeptLevelDto();
        BeanUtils.copyProperties(dept, dto);
        return dto;
    }
}
