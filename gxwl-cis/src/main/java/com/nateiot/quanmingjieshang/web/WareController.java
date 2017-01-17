package com.nateiot.quanmingjieshang.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nateiot.base.common.StringUtil;
import com.nateiot.core.common.web.SearchUtil;
import com.nateiot.quanmingjieshang.domain.Store;
import com.nateiot.quanmingjieshang.domain.Ware;
import com.nateiot.quanmingjieshang.service.WareService;

@Controller
@RequestMapping("/ware")
public class WareController {
	
	@Autowired
	private WareService service;
	
	/**
	 * 加载视图
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String list() {
		return "cis/bm/dianying/dianying";
	}
	
	
	/**
	 * 下载界面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/downloadpage")
	public String downloadpage() {
		return "cis/bm/dianying/downloadpage";
	}
	
	/**
	 * 查询
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/search")
	@ResponseBody
	public Map<String, Object> search(HttpServletRequest req) {
		
		
		Map<String ,Object> params = new HashMap<String, Object>();
		List<Long> fujinStoreIds = new ArrayList<Long>();
		fujinStoreIds.add(1l);
		fujinStoreIds.add(2l);
		fujinStoreIds.add(3l);

		//String ids = req.getParameter("fujinStoreIds");
		//fujinStoreIds = StringUtil.splitStrToLongList(ids, ",");
		
		String wareName = "青椒";
		params.put("findResults", service.findByWareName(wareName, fujinStoreIds));
		return params;
	}
	
	
	/**
	 * 保存
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public Map<String, Object> save(Ware entity) {
		return service.doSave(entity); 
	}
	
	/**
	 * 详细
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/get/{id}")
	@ResponseBody
	public Map<String, Object> get(@PathVariable(value = "id") Long id){
		return service.doSelect(id);
	}
	
	/**
	 * 硬删除记录
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/del/{id}")
	@ResponseBody
	public Map<String, Object> del(@PathVariable(value = "id") Long id){
		return service.doDelete(id);
	}
}
