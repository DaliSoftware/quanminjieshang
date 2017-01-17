package com.nateiot.quanmingjieshang.repository;

import java.util.List;

import com.nateiot.core.repository.BaseDao;
import com.nateiot.quanmingjieshang.domain.Ware;

public interface WareDao extends BaseDao<Ware, Long>, WareDaoPlus{
	
	/**
	 * 根据附近店铺的id已经查找的商品的名称查找商品
	 * @param wareName 商品名称
	 * @param fujinStoreIds 附近店铺的id
	 * @return 匹配的商品的信息
	 */
	public List<Ware> findByWareNameContainingAndStoreIdIn(String wareName, List<Long> fujinStoreIds);
}
