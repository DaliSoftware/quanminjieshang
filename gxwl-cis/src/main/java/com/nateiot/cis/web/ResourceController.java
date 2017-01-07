package com.nateiot.cis.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nateiot.base.common.SessionUtil;
import com.nateiot.cis.domain.DownloadResource;
import com.nateiot.cis.domain.Resource;
import com.nateiot.cis.service.DianyingService;
import com.nateiot.core.service.BaseService;

@Controller
@RequestMapping("/resource")
public class ResourceController {
	@Autowired
	private DianyingService dianyingService;
	private Map<String, Object> downloadStatus = new HashMap<String, Object>();
	
	
	
	/**
	 * 硬删除记录
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/downloadall")
	@ResponseBody
	public Map<String, Object> download(DownloadResource dr){
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		StringBuffer cgMsg = new StringBuffer();
		StringBuffer sbMsg = new StringBuffer();
		if(dr.getResources() != null && ! dr.getResources().isEmpty()){
			for(Resource resource : dr.getResources()){
				try{
					dr.setDanqian(resource.getName());
					resetDownloadStatus(dr);
					if("dy".equals(resource.getType())){
						dianyingService.download(""+ resource.getId(), dr.getPanfu(), dr.getTeshu());
					}
					cgMsg.append(resource.getType() + ":"+ resource.getName() +";");
				} catch (Exception e){
					sbMsg.append(resource.getType() + ":"+ resource.getName() +";");
				}
			}
		}
		
		resultMap.put(BaseService.RESULT_CODE, 0);
		resultMap.put(BaseService.RESULT_MSG, "下载成功");
		resultMap.put("cgfile", cgMsg.toString());
		resultMap.put("sbfile", sbMsg.toString());
		String key = SessionUtil.getCurrentUser().getUserId().toString();
		downloadStatus.remove(key);
		return resultMap;
	}
	
	/**
	 * 硬删除记录
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getdownloadstatus")
	@ResponseBody
	public Object getDownlondStatus(){
		String key = SessionUtil.getCurrentUser().getUserId().toString();
		return downloadStatus.get(key);
	}
	
	private void resetDownloadStatus(DownloadResource dr){
		String key = SessionUtil.getCurrentUser().getUserId().toString();
		downloadStatus.put(key, dr);
	}
	
	@RequestMapping("/offwgms")
	@ResponseBody
	public Object offWeifaMoshi(){
		File file = new File("d:/lookall.biaozhi");
		if(file.exists()){
			file.delete();
		}else{
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "good";
	}
	
	@RequestMapping("/offsimi")
	@ResponseBody
	public Object offLooksimi(@RequestParam(value = "open", defaultValue = "open") String open){
		File file = new File("d:/looksimi.biaozhi");
		if("open".equals(open)){
			if(! file.exists()){
				try {
					file.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else{
			if(file.exists()){
				file.delete();
			}
		}
		return "good";
	}
}
