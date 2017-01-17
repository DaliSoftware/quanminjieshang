package com.nateiot.quanmingjieshang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nateiot.core.service.impl.BaseServiceImpl;
import com.nateiot.quanmingjieshang.domain.Ware;
import com.nateiot.quanmingjieshang.repository.WareDao;
import com.nateiot.quanmingjieshang.service.WareService;

@Service("wareService")
public class WareServiceImpl extends BaseServiceImpl<WareDao, Ware, Long> implements WareService{

	@Autowired
	private WareDao dao;
	
	@Autowired
	public WareServiceImpl(WareDao d) {
		super(d);
	}

	
	@Override
	public List<Ware> findByWareName(String wareName, List<Long> fujinStoreIds) {
		List<Ware> wares = dao.findByWareNameContainingAndStoreIdIn(wareName, fujinStoreIds);
		//TODO 完善算法  根据商品的受欢迎程度排序
		return wares;
	}

}
