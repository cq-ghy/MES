package com.haoyu.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.dao.MesStorageCustomerMapper;
import com.haoyu.dao.MesStorageMapper;
import com.haoyu.model.MesStorage;
import com.haoyu.param.MesStorageVo;
import com.haoyu.util.BeanValidator;

@Service
public class StorageService {
	@Resource
	private MesStorageMapper mesStorageMapper;
	@Resource
	private MesStorageCustomerMapper mesStorageCustomerMapper;
	@Resource
	private SqlSession sqlSession;
	
	// 增加一个钢材或者废料一对多材料
	public void insert(MesStorageVo mesStorageVo) {
		BeanValidator.check(mesStorageVo);
		MesStorage mesStorage=MesStorage.builder().storageName(mesStorageVo.getStorageName())//
				.storageRemark(mesStorageVo.getStorageRemark()).build();
		mesStorage.setStorageOperateIp("127.0.0.1");
		mesStorage.setStorageOperateTime(new Date());
		mesStorage.setStorageOperator("user01");
		mesStorageMapper.insertSelective(mesStorage);
	}
	
	//库房列表
	public PageResult<MesStorage> searchPageList(PageQuery page) {
		BeanValidator.check(page);
		int count = mesStorageCustomerMapper.counts();
		List<MesStorage> storageList = mesStorageCustomerMapper.getPageList(page);
		return PageResult.<MesStorage>builder().total(count).data(storageList).build();
	}
	
	//更新库房信息
	public void update(MesStorageVo mesStorageVo) {
		BeanValidator.check(mesStorageVo);
		MesStorage mesStorage=MesStorage.builder().id(mesStorageVo.getId()).storageName(mesStorageVo.getStorageName())//
				.storageRemark(mesStorageVo.getStorageRemark()).build();
		mesStorage.setStorageOperateIp("127.0.0.1");
		mesStorage.setStorageOperateTime(new Date());
		mesStorage.setStorageOperator("user01");
		mesStorageMapper.updateByPrimaryKeySelective(mesStorage);
	}
}
