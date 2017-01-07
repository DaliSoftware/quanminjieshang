package com.nateiot.cis.web;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nateiot.cis.domain.Dianying;
import com.nateiot.cis.domain.DownloadResource;
import com.nateiot.cis.service.DianyingService;
import com.nateiot.core.common.web.SearchUtil;

@Controller
@RequestMapping("/dianying")
public class DianyingController {
	@Autowired
	private DianyingService dianyingService;
	

	
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
	public Map<String, Object> search(HttpServletRequest req, @RequestParam(value = "teshu", defaultValue = "0") String teshu) {
		Map<String ,Object> params = new HashMap<String, Object>();
		if("0".equals(teshu)){
			params.put("jiamiFanshi_EQ", 0);
		}
		return dianyingService.doSearch(
				SearchUtil.getSpecification(Dianying.class, req, params),
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
	public Map<String, Object> save(Dianying entity , @RequestParam(value = "panfu", defaultValue="E") String panfu) {
		return dianyingService.doSave(entity, panfu); 
	}
	
	/**
	 * 详细
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "/get/{noticeId}")
	@ResponseBody
	public Map<String, Object> get(
			@PathVariable(value = "noticeId") Integer noticeId){
		return dianyingService.doSelect(noticeId);
	}
	
	/**
	 * 硬删除记录
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/del/{noticeId}")
	@ResponseBody
	public Map<String, Object> del(
			@PathVariable(value = "noticeId") Integer noticeId){
		return dianyingService.doDelete(noticeId);
	}
	
	/**
	 * 硬删除记录
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/download")
	@ResponseBody
	public Map<String, Object> download(
			@RequestParam(value = "ids") String ids, @RequestParam(value = "sd", defaultValue= "G") String sd,
			@RequestParam(value = "teshu", defaultValue = "0") String teshu){
		return dianyingService.download(ids, sd, teshu);
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
