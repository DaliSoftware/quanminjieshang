package com.nateiot.cis.domain;

import java.io.Serializable;
import java.util.List;

public class DownloadResource  implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Resource> resources;
	private String panfu;
	private String teshu;
	private String danqian;//当前下载的文件的名称
	private Long danqianLength;//当前下载文件的大小
	private Long zondaxiao;//任务总大小
	
	
	
	
	public String getDanqian() {
		return danqian;
	}
	public void setDanqian(String danqian) {
		this.danqian = danqian;
	}
	public Long getDanqianLength() {
		return danqianLength;
	}
	public void setDanqianLength(Long danqianLength) {
		this.danqianLength = danqianLength;
	}
	public Long getZondaxiao() {
		return zondaxiao;
	}
	public void setZondaxiao(Long zondaxiao) {
		this.zondaxiao = zondaxiao;
	}
	public List<Resource> getResources() {
		return resources;
	}
	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}
	public String getPanfu() {
		return panfu;
	}
	public void setPanfu(String panfu) {
		this.panfu = panfu;
	}
	public String getTeshu() {
		return teshu;
	}
	public void setTeshu(String teshu) {
		this.teshu = teshu;
	}
	
}
