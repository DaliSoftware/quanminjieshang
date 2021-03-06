package com.nateiot.base.service;

import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.nateiot.base.domain.GxwlSysOperatelog;
import com.nateiot.base.repository.GxwlSysOperatelogDao;
import com.nateiot.core.service.BaseService;

public interface GxwlSysOperatelogService extends
		BaseService<GxwlSysOperatelogDao, GxwlSysOperatelog, Integer> {

	/**
	 * 处理Excel导出业务逻辑
	 * 
	 * @param logs
	 * @param workbook
	 */
	public void doExcelExport(List<GxwlSysOperatelog> logs,
			HSSFWorkbook workbook);
	
	/**
	 * 清除六个月以前的日志
	 * 
	 * @return
	 */
	public Map<String, Object> clearSixMonthsAgoLogs();
	
}
