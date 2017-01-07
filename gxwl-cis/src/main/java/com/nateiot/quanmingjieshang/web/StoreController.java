package com.nateiot.quanmingjieshang.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nateiot.core.common.web.SearchUtil;
import com.nateiot.quanmingjieshang.domain.Store;
import com.nateiot.quanmingjieshang.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@Autowired
	private StoreService service;
	

	
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
		return service.doSearch(
				SearchUtil.getSpecification(Store.class, req, params),
				SearchUtil.getPageableWithOrderBy(req, "createTime_desc"));
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
	public Map<String, Object> save(Store entity) {
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
	
	
	/**
	 * 硬删除记录
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/resetreadstatus/{noticeId}")
	@ResponseBody
	public Map<String, Object> resetReadStatus(
			@PathVariable(value = "noticeId") Integer noticeId){
		return null;
	}

	/**
	 * 加载消息公告彈窗
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/totanchuang")
	public String toTanchuang() {
		return "cis/ad/notice/tanchuang_noticelist";
	}

}
