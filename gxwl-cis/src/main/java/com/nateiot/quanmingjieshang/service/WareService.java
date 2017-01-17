package com.nateiot.quanmingjieshang.service;

import java.util.List;

import com.nateiot.core.service.BaseService;
import com.nateiot.quanmingjieshang.domain.Ware;
import com.nateiot.quanmingjieshang.repository.WareDao;

public interface WareService extends BaseService<WareDao, Ware, Long>{
	public List<Ware> findByWareName(String wareName, List<Long> fujinStoreIds);
}
