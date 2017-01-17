package com.nateiot.quanmingjieshang.service;

import java.util.List;

import com.nateiot.core.service.BaseService;
import com.nateiot.quanmingjieshang.domain.Store;
import com.nateiot.quanmingjieshang.repository.StoreDao;

public interface StoreService extends BaseService<StoreDao, Store, Long>{

	/**
	 * 根据给定的坐标查找小于fanwei参数限定范围的店铺
	 * @param lon
	 * @param lat
	 * @param fanwei
	 * @return
	 */
	public List<Store> findStoreBy(Double lon, Double lat, Integer fanwei);
}
