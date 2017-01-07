package com.nateiot.cis.service;

import java.util.Map;

import com.nateiot.cis.domain.Dianying;
import com.nateiot.cis.repository.DianyingDao;
import com.nateiot.core.service.BaseService;

public interface DianyingService extends BaseService<DianyingDao, Dianying, Integer>{
	public Map<String, Object> doSave(Dianying entity, String panfu);
	
	public Map<String, Object> download(String ids, String sd, String teshu);
}
