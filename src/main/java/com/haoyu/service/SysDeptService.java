package com.haoyu.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Preconditions;
import com.haoyu.common.RequestHolder;
import com.haoyu.dao.SysDeptMapper;
import com.haoyu.dao.SysUserMapper;
import com.haoyu.exception.ParamException;
import com.haoyu.model.SysDept;
import com.haoyu.param.DeptParam;
import com.haoyu.util.BeanValidator;
import com.haoyu.util.IpUtil;
import com.haoyu.util.LevelUtil;

/**
 * @author Administrator
 * 部门service
 */

@Service
public class SysDeptService {

    @Resource
    private SysDeptMapper sysDeptMapper;
    @Resource
    private SysUserMapper sysUserMapper;
//    @Resource
//    private SysLogService sysLogService;
    
    //通过部门上层id，部门名称，和部门编号查询部门重复
    private boolean checkExist(Integer parentId, String deptName, Integer deptId) {
        return sysDeptMapper.countByNameAndParentId(parentId, deptName, deptId) > 0;
    }

    //创建部门
    public void save(DeptParam param) {
        //如果部门数据为空，则无法通过校验
    	BeanValidator.check(param);
        //如果部门已经重复，则无法进行部门创建
        if(checkExist(param.getParentId(), param.getName(), param.getId())) {
            throw new ParamException("同一层级下存在相同名称的部门");
        }
        //使用构建器灵活创建需要需要增加的部门内容
        SysDept dept = SysDept.builder().name(param.getName()).parentId(param.getParentId())
                .seq(param.getSeq()).remark(param.getRemark()).build();
        //根据父级id进行层级计算
        dept.setLevel(LevelUtil.calculateLevel(getLevel(param.getParentId()), param.getParentId()));
        //创建用户姓名，用户ip和用户操作时间
        dept.setOperator(RequestHolder.getCurrentUser().getUsername());
        dept.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        dept.setOperateTime(new Date());
        //service根据部门已经准备好的字段进行部门内容创建
        sysDeptMapper.insertSelective(dept);
        //日志记录
//        sysLogService.saveDeptLog(null, dept);
    }
    //更新部门信息
    public void update(DeptParam param) {
    	//数据校验
        BeanValidator.check(param);
        //部门去重
        if(checkExist(param.getParentId(), param.getName(), param.getId())) {
            throw new ParamException("同一层级下存在相同名称的部门");
        }
        //根据id取出部门数据，准备修改
        SysDept before = sysDeptMapper.selectByPrimaryKey(param.getId());
        //检查待修改部门是否为空值
        Preconditions.checkNotNull(before, "待更新的部门不存在");
        //部门去重
        if(checkExist(param.getParentId(), param.getName(), param.getId())) {
            throw new ParamException("同一层级下存在相同名称的部门");
        }
        //根据修改字段修改部门信息
        SysDept after = SysDept.builder().id(param.getId()).name(param.getName()).parentId(param.getParentId())
                .seq(param.getSeq()).remark(param.getRemark()).build();
        //设置部门层级
        after.setLevel(LevelUtil.calculateLevel(getLevel(param.getParentId()), param.getParentId()));
        after.setOperator(RequestHolder.getCurrentUser().getUsername());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        after.setOperateTime(new Date());
        //更改部门自己部门
        updateWithChild(before, after);
//        sysLogService.saveDeptLog(before, after);
    }
    //TODO 批量更新部门，后面来研究
    @Transactional
    private void updateWithChild(SysDept before, SysDept after) {
    	//更新之后的部门层级
        String newLevelPrefix = after.getLevel();
        //更新之前的部门层级
        String oldLevelPrefix = before.getLevel();
        //如果层级不同则进行部门操作
        if (!after.getLevel().equals(before.getLevel())) {
            //根据层级把部门的子集部门全部取出来放入一个list集合
        	List<SysDept> deptList = sysDeptMapper.getChildDeptListByLevel(before.getLevel());
        	//如果子部门不为空集
        	if (CollectionUtils.isNotEmpty(deptList)) {
                for (SysDept dept : deptList) {
                	//拿到每个部门的层级
                    String level = dept.getLevel();
                    //如果前缀是以
                    if (level.indexOf(oldLevelPrefix) == 0) {
                    	//TODO //部门层级算法简单实现
                        level = newLevelPrefix + level.substring(oldLevelPrefix.length());
                        dept.setLevel(level);
                    }
                }
                sysDeptMapper.batchUpdateLevel(deptList);
            }
        }
        sysDeptMapper.updateByPrimaryKey(after);
    }

    private String getLevel(Integer deptId) {
        SysDept dept = sysDeptMapper.selectByPrimaryKey(deptId);
        if (dept == null) {
            return null;
        }
        return dept.getLevel();
    }

    public void delete(int deptId) {
        SysDept dept = sysDeptMapper.selectByPrimaryKey(deptId);
        Preconditions.checkNotNull(dept, "待删除的部门不存在，无法删除");
        if (sysDeptMapper.countByParentId(dept.getId()) > 0) {
            throw new ParamException("当前部门下面有子部门，无法删除");
        }
        if(sysUserMapper.countByDeptId(dept.getId()) > 0) {
            throw new ParamException("当前部门下面有用户，无法删除");
        }
        sysDeptMapper.deleteByPrimaryKey(deptId);
    }
}
