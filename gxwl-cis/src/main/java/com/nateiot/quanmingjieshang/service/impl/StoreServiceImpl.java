package com.nateiot.quanmingjieshang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nateiot.core.service.impl.BaseServiceImpl;
import com.nateiot.quanmingjieshang.domain.Store;
import com.nateiot.quanmingjieshang.repository.StoreDao;
import com.nateiot.quanmingjieshang.service.StoreService;

@Service("storeService")
public class StoreServiceImpl extends BaseServiceImpl<StoreDao, Store, Long> implements StoreService{

	@Autowired
	public StoreServiceImpl(StoreDao d) {
		super(d);
	}

}
