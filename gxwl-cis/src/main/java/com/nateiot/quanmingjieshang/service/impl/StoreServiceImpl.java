package com.nateiot.quanmingjieshang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nateiot.core.service.impl.BaseServiceImpl;
import com.nateiot.quanmingjieshang.domain.Store;
import com.nateiot.quanmingjieshang.repository.StoreDao;
import com.nateiot.quanmingjieshang.service.StoreService;
import com.nateiot.quanmingjieshang.util.MapUtil;

@Service("storeService")
public class StoreServiceImpl extends BaseServiceImpl<StoreDao, Store, Long> implements StoreService{
	private static final int DEF_FANWEI = 5000;//默认查找附近5公里
	@Autowired
	private StoreDao dao;
	
	@Autowired
	public StoreServiceImpl(StoreDao d) {
		super(d);
	}

	@Override
	public List<Store> findStoreBy(Double lon, Double lat, Integer fanwei) {
		if(fanwei == null){
			fanwei = DEF_FANWEI;
		}
		List<Store> allStore = dao.findAll();
		for(Store store : allStore){
			if(MapUtil.GetDistance(lon, lat, 
					Double.parseDouble(store.getStoreLongitude()), 
					Double.parseDouble(store.getStoreLatitude())) > fanwei){
				allStore.remove(store);
			}
		}
		return allStore;
	}

	
}
