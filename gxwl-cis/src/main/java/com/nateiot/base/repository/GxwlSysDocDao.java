package com.nateiot.base.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.nateiot.base.domain.GxwlSysDoc;
import com.nateiot.core.repository.BaseDao;

/**
 * @author Will WM. Zhang
 *
 */
public interface GxwlSysDocDao extends BaseDao<GxwlSysDoc, Integer>,
		GxwlSysDocDaoPlus {

	public GxwlSysDoc findByDocIdAndIsTemp(Integer docId, String isTemp);

	@Query("select c from  GxwlSysDoc c where c.docId in (:ids) " )
	public List<GxwlSysDoc> queryListById(@Param("ids")List<Integer> ids);

}
