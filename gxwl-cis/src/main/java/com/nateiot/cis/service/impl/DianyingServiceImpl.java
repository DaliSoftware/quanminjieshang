package com.nateiot.cis.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Transient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nateiot.base.domain.GxwlSysDoc;
import com.nateiot.base.repository.GxwlSysDocDao;
import com.nateiot.cis.common.IOUtil;
import com.nateiot.cis.domain.Dianying;
import com.nateiot.cis.repository.DianyingDao;
import com.nateiot.cis.service.DianyingService;
import com.nateiot.core.service.impl.BaseServiceImpl;

@Service("dianyingService")
public class DianyingServiceImpl extends
		BaseServiceImpl<DianyingDao, Dianying, Integer> implements
		DianyingService {

	@Autowired
	private DianyingDao dao;
	
	@Autowired
	private GxwlSysDocDao docDao;
	
	@Autowired
	public DianyingServiceImpl(DianyingDao d) {
		super(d);
	}

	/**
	 * @param panfu 资源所在本机的盘符
	 */
	@Override
	@Transactional
	public Map<String, Object> doSave(Dianying entity, String panfu) {
		resetResultMap();
		String url = panfu + ":/xiaoniu/dianying/"+ entity.getName() +"."+ entity.getGeshi();
		if(new File(url).exists()){
			entity.setUrl(url);
			entity.setStatus(1);
			StringBuffer keyword = new StringBuffer(entity.getName() +" ");
			keyword.append(entity.getDaoyan() +" ");
			keyword.append(entity.getYanyuan());
			entity.setKeyword(keyword.toString());
			if(entity.getId() == null){
				entity.setDownloadCount(0);
			}
			imageFun(entity);
			try {
				//不处理
				if(entity.getJiamiFanshi().intValue() == 0){
					dao.save(entity);
				}
				
				//破坏文件
				else if(entity.getJiamiFanshi().intValue() == 1){
					if(entity.getId() == null){
						IOUtil.pohuai(url);
					}
					dao.save(entity);
				}
				
				//撕裂文件
				else if(entity.getJiamiFanshi().intValue() == 2){
					if(entity.getId() == null){
						String outUrl = panfu + ":/xiaoniu/dianying/data";
						String suipians = IOUtil.silie(url, outUrl);
						entity.setSuipians(suipians);	
					}
					dao.save(entity);
				}
			} catch (Exception e){
				e.printStackTrace();
				resultMap.put(RESULT_CODE, -1);
				resultMap.put(RESULT_MSG, "新增出错！");
			}
			resultMap.put(RESULT_MSG, "保存成功！");
		}else{
			resultMap.put(RESULT_CODE, -1);
			resultMap.put(RESULT_MSG, "新增出错！路径错误："+url);
		}
		return resultMap;
	}

	private void imageFun(Dianying entity){
		List<GxwlSysDoc> newDocs = new ArrayList<GxwlSysDoc>();
		List<GxwlSysDoc> oldDocs = new ArrayList<GxwlSysDoc>();
		if(entity.getId() == null){
			if(entity.getImages() != null){
				String images[] = entity.getImages().split(",");
				for(int i = 0; i < images.length; i ++){
					GxwlSysDoc doc = docDao.findOne(Integer.parseInt(images[i]));
					if(doc != null){
						doc.setIsTemp("N");
						newDocs.add(doc);
					}
				}
				docDao.save(newDocs);
			}
		}else{
			Dianying oldDy = dao.findOne(entity.getId());
			if(oldDy.getImages() != null){
				if(entity.getImages() != null){
					String images[] = entity.getImages().split(",");
					String oldImages[] = oldDy.getImages().split(",");
					
					List<String> list = new ArrayList<String>();
					
					//找出被删除的剧照
					boolean biaozhi = false;
					for(int j = 0; j < oldImages.length; j ++){
						for(int i = 0; i < images.length; i ++){
							if(oldImages[j].equals(images[i])){
								biaozhi = true;
								break;
							}
						}
						if(! biaozhi){
							list.add(oldImages[j]);
						}
						biaozhi = false;
					}
					for(String docId : list){
						GxwlSysDoc doc = docDao.findOne(Integer.parseInt(docId));
						if(doc != null){
							doc.setIsTemp("Y");
							oldDocs.add(doc);
						}
					}
					docDao.save(oldDocs);
/*					
					list.clear();
					
					//找出新增的剧照
					for(int i = 0; i < images.length; i ++){
						for(int j = 0; j < oldImages.length; j ++){
							if(images[i].equals(oldImages[j])){
								biaozhi = true;
								break;
							}
						}
						if(! biaozhi){
							list.add(images[i]);
						}
						biaozhi = false;
					}
					
					for(String docId : list){
						GxwlSysDoc doc = docDao.findOne(Integer.parseInt(docId));
						if(doc != null){
							doc.setIsTemp("N");
							newDocs.add(doc);
						}
					}
					docDao.save(newDocs);*/
					
					
					for(int i = 0; i < images.length; i ++){
						GxwlSysDoc doc = docDao.findOne(Integer.parseInt(images[i]));
						if(doc != null){
							doc.setIsTemp("N");
							newDocs.add(doc);
						}
					}
					docDao.save(newDocs);
				}else{
					String images[] = oldDy.getImages().split(",");
					for(int i = 0; i < images.length; i ++){
						GxwlSysDoc doc = docDao.findOne(Integer.parseInt(images[i]));
						if(doc != null){
							doc.setIsTemp("Y");
							oldDocs.add(doc);
						}
					}
					docDao.save(oldDocs);
				}
			}else{
				if(entity.getImages() != null){
					String images[] = entity.getImages().split(",");
					for(int i = 0; i < images.length; i ++){
						GxwlSysDoc doc = docDao.findOne(Integer.parseInt(images[i]));
						if(doc != null){
							doc.setIsTemp("N");
							newDocs.add(doc);
						}
					}
					docDao.save(newDocs);
				}
			}
		}
	}
	
	
	@Override
	@Transactional
	public Map<String, Object> download(String ids, String sd, String teshu) {
		resetResultMap();
		String idArray[] = ids.split(",");
		StringBuffer shibaiFiles = new StringBuffer("");
		StringBuffer chenggongFiles = new StringBuffer("");
		
		File parentFile = new File(sd + ":/xiaoniu/dianying");
		if(! parentFile.exists()){
			parentFile.mkdirs();
		}
		
		for(int i = 0; i < idArray.length; i ++){
			Dianying dy = dao.findOne(Integer.parseInt(idArray[i]));
			
			if(dy.getJiamiFanshi().intValue() == 0){
				String sdUrl = sd+ ":/xiaoniu/dianying/" + dy.getName() + "."+ dy.getGeshi();
				if(IOUtil.copy(dy.getUrl(), sdUrl)){
					dy.setDownloadCount(dy.getDownloadCount() + 1);
					dao.save(dy);
					chenggongFiles.append(dy.getName() +";");
				}else{
					shibaiFiles.append(dy.getName() +";");
				}
			}else if(dy.getJiamiFanshi().intValue() == 1 && "1".equals(teshu)){
				if(IOUtil.copyToSD(dy, sd)){
					dy.setDownloadCount(dy.getDownloadCount() + 1);
					dao.save(dy);
					chenggongFiles.append(dy.getName() +";");
				}else{
					shibaiFiles.append(dy.getName() +";");
				}
			}else if(dy.getJiamiFanshi().intValue() == 2 && "1".equals(teshu)){
				String parentUrl = dy.getUrl().charAt(0) + ":/xiaoniu/dianying/data";
				if(IOUtil.copyToSD(dy, parentUrl, dy.getSuipians(), sd)){
					dy.setDownloadCount(dy.getDownloadCount() + 1);
					dao.save(dy);
					chenggongFiles.append(dy.getName() +";");
				}else{
					shibaiFiles.append(dy.getName() +";");
				}
			}
		}
		StringBuffer msg = new StringBuffer();
		if(chenggongFiles.toString().length() > 0){
			msg.append("成功下载：“"+chenggongFiles.toString()+"”");
		}
		
		if(shibaiFiles.toString().length() > 0){
			msg.append("   “"+ shibaiFiles.toString() +"”下载失败！");
		}
		resultMap.put(RESULT_MSG, msg.toString());
		
		return resultMap;
	}

	
}
