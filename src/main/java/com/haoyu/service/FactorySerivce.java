package com.haoyu.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.dao.MesChistoryCustomerMapper;
import com.haoyu.dao.MesChistoryMapper;
import com.haoyu.dao.MesFactoryCustomerMapper;
import com.haoyu.dao.MesFactoryMapper;
import com.haoyu.dao.MesFhistoryCustomerMapper;
import com.haoyu.dao.MesFhistoryMapper;
import com.haoyu.dao.MesStepCustomerMapper;
import com.haoyu.dao.MesStepMapper;
import com.haoyu.dao.MesStorageMapper;
import com.haoyu.dto.FactoryDto;
import com.haoyu.dto.SearchFactoryDto;
import com.haoyu.exception.ParamException;
import com.haoyu.model.MesChistory;
import com.haoyu.model.MesFactory;
import com.haoyu.model.MesFhistory;
import com.haoyu.model.MesStep;
import com.haoyu.model.MesStorage;
import com.haoyu.param.SearchFactoryParam;
import com.haoyu.util.BeanValidator;

@Service
public class FactorySerivce {
	@Resource
	private MesStorageMapper mesStorageMapper;
	@Resource
	private MesStepMapper mesStepMapper;
	@Resource
	private MesStepCustomerMapper mesStepCustomerMapper;
	@Resource
	private MesFhistoryMapper mesFhistoryMapper;
	@Resource
	private MesFhistoryCustomerMapper mesFhistoryCustomerMapper;
	@Resource
	private MesFactoryMapper mesFactoryMapper;
	@Resource
	private MesFactoryCustomerMapper mesFactoryCustomerMapper;
	@Resource
	private MesChistoryMapper mesChistoryMapper;
	@Resource
	private MesChistoryCustomerMapper mesChistoryCustomerMapper;

	public PageResult<FactoryDto> searchPageList(SearchFactoryParam param, PageQuery page) {
		// 验证页码是否为空
				BeanValidator.check(page);
				// 将param中的字段传入dto进行数据层的交互
				// 自定义的数据模型，用来与数据库进行交互操作
				// searchDto 用于分页的where语句后面
				SearchFactoryDto dto = new SearchFactoryDto();
				// copyparam中的值进入dto
				if (StringUtils.isNotBlank(param.getKeyword())) {
					dto.setKeyword("%" + param.getKeyword() + "%");
				}
				if (StringUtils.isNotBlank(param.getSearch_prostatus())) {
					dto.setSearch_prostatus(param.getSearch_prostatus());
				}
				if (StringUtils.isNotBlank(param.getStorageid())) {
					dto.setStorageid(Integer.parseInt(param.getStorageid()));
				}
				try {
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					if (StringUtils.isNotBlank(param.getFromTime())) {
						dto.setFromTime(dateFormat.parse(param.getFromTime()));
					}
					if (StringUtils.isNotBlank(param.getToTime())) {
						dto.setToTime(dateFormat.parse(param.getToTime()));
					}
				} catch (Exception e) {
					throw new ParamException("传入的日期格式有问题，正确格式为：yyyy-MM-dd");
				}

				int count = mesFactoryCustomerMapper.countBySearchDto(dto);
				if (count > 0) {
					List<FactoryDto> orderList = mesFactoryCustomerMapper.getPageListBySearchDto(dto, page);
					return PageResult.<FactoryDto>builder().total(count).data(orderList).build();
				}

				return PageResult.<FactoryDto>builder().build();
	}
	//根据id查询factory 带成员变量
	public FactoryDto selectFactoryDtoById(String idTemp) {
		if(StringUtils.isNoneBlank(idTemp)) {
			Integer id=Integer.parseInt(idTemp);
			return mesFactoryCustomerMapper.selectFactoryDtoById(id);
		}
		return null;
	}
	//派工
	public void stepStart(String id, String step,String fhistoryRemark) {
		if(StringUtils.isNoneBlank(id)&&StringUtils.isNoneBlank(step)) {
			//factory
			MesFactory factory=mesFactoryMapper.selectByPrimaryKey(Integer.parseInt(id));
			//待派工  派工中  待质检   质检中   生产结束
			factory.setFactoryProstatus("派工中");
			Integer stepid=mesStepCustomerMapper.selectIdByStep(step);
			factory.setFactoryPreid(stepid);
			//add-fhistory
			MesFhistory mf=MesFhistory.builder()//
					.fhistoryFactoryid(factory.getId()).fhistoryStep(step)//
					.fhistoryStarttime(new Date()).fhistoryRemark(fhistoryRemark).build();
			
			mesFhistoryMapper.insertSelective(mf);
			mesFactoryMapper.updateByPrimaryKeySelective(factory);
		}
	}
	//具体工序过程的派工细节
	public List<MesFhistory> fhistorysInfoById(String id) {
		if(StringUtils.isNoneBlank(id)) {
			List<MesFhistory> mfs=mesFhistoryCustomerMapper.selectFhistorysInfoById(Integer.parseInt(id));
			return mfs;
		}
		return null;
	}
	//待质检
	public void preCheck(String id) {
		if(StringUtils.isNoneBlank(id)) {
			//factory 的状态改变
			MesFactory mf=mesFactoryMapper.selectByPrimaryKey(Integer.parseInt(id));
			mf.setFactoryProstatus("待质检");
			Integer stepid=mf.getFactoryPreid();
			MesStep ms=mesStepMapper.selectByPrimaryKey(stepid);
			MesFhistory mfh=mesFhistoryCustomerMapper.selectFhistoryByFidAndStep(mf.getId(),ms.getStepName());
			mfh.setFhistoryEndtime(new Date());
			//更新操作
			mesFactoryMapper.updateByPrimaryKeySelective(mf);
			mesFhistoryMapper.updateByPrimaryKeySelective(mfh);
		}
	}
	//质检环节
	public void stepCheck(String id, String chistoryStep, String checkgoal, String checkresult,String chistoryRemark) {
		if(StringUtils.isNotBlank(checkresult)) {
			//通过环节
			//insert
			if(checkresult.equals("通过")) {
				MesChistory mc=MesChistory.builder().chistoryFactoryid(Integer.parseInt(id))//
						.chistoryStep(chistoryStep).chistoryTime(new Date())//
						.chistoryGoal(checkgoal).chistoryResult(checkresult).chistoryRemark(chistoryRemark).chistoryStatus(1).build();
				//factory-prostatus
				MesFactory factory=mesFactoryMapper.selectByPrimaryKey(Integer.parseInt(id));
				factory.setFactoryProstatus("待派工");
				/////
				mesFactoryMapper.updateByPrimaryKeySelective(factory);
				mesChistoryMapper.insertSelective(mc);
			}
		}
	}
	//质检环节-需返工
	public void stepCheck(String id, String storageid, String chistoryStep, String checkgoal, String checkresult,
			String chistoryRemark) {
		if(StringUtils.isNotBlank(checkresult)&&StringUtils.isNotBlank(storageid)) {
			//通过环节
			//insert
			if(checkresult.equals("需返工")) {//后端再做一点健壮性判断
				//返工车间名称
				MesStorage storage=mesStorageMapper.selectByPrimaryKey(Integer.parseInt(storageid));
				
				MesChistory mc=MesChistory.builder().chistoryFactoryid(Integer.parseInt(id))//
						.chistoryStep(chistoryStep).chistoryTime(new Date())//
						.chistoryGoal(checkgoal).chistoryStorageid(Integer.parseInt(storageid)).chistoryResult(checkresult).chistoryRemark(chistoryRemark+"-返工车间:"+storage.getStorageName()).chistoryStatus(1).build();
				//factory-prostatus
				MesFactory factory=mesFactoryMapper.selectByPrimaryKey(Integer.parseInt(id));
				factory.setFactoryProstatus("待派工");
				factory.setFactoryStorageid(Integer.parseInt(storageid));
				/////
				mesFactoryMapper.updateByPrimaryKeySelective(factory);
				mesChistoryMapper.insertSelective(mc);
			}
		}
	}
	//质检过程细节--质检info list
	public List<MesChistory> chistorysInfoById(String id) {
		if(StringUtils.isNoneBlank(id)) {
			List<MesChistory> mcs=mesChistoryCustomerMapper.selectFhistorysInfoById(Integer.parseInt(id));
			return mcs;
		}
		return null;
	}

}
