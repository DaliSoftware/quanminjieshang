package com.nateiot.cis.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.nateiot.base.domain.BaseEntity;

@Entity
@Table(name = "DIANYING")
public class Dianying extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	private Integer id;
	
	/**
	 * 编号
	 */
	@Column(name = "NUMBER")
	private String number;
	
	/**
	 * 电影名称
	 */
	@Column(name = "NAME")
	private String name;
	
	/**
	 * 电影类型
	 */
	@Column(name = "TYPE")
	private String type;
	
	/**
	 * 文件格式
	 */
	@Column(name = "GESHI")
	private String geshi;
	
	/**
	 * 分辨率
	 */
	@Column(name = "FENBIANLV")
	private String fenbianlv;
	
	/**
	 * 本地存放的绝对路径
	 */
	@Column(name = "URL")
	private String url;
	
	/**
	 * 关键字
	 */
	@Column(name = "KEYWORD")
	private String keyword;
	
	/**
	 * 导演
	 */
	@Column(name = "DAOYAN")
	private String daoyan;
	
	/**
	 * 演员表
	 */
	@Column(name = "YANYUAN")
	private String yanyuan;
	
	/**
	 * 摘要
	 */
	@Column(name = "ZHAIYAO")
	private String zhaiyao;
	
	/**
	 * 评分
	 */
	@Column(name = "PINGFEN")
	private String pingfen;
	
	/**
	 * 下载次数
	 */
	@Column(name = "DOWNLOAD_COUNT")
	private Integer downloadCount;
	
	/**
	 * 处理方式
	 */
	@Column(name = "JIAMI_FANSHI")
	private Integer jiamiFanshi;
	
	/**
	 * 碎片文件的名称的集合，用,符号分割
	 */
	@Column(name = "SUIPIANS")
	private String suipians;
	
	/**
	 * 关于本视频的截图的文件的名称的集合，用,符号分割
	 */
	@Column(name = "IMAGES")
	private String images;
	
	/**
	 * 资源状态  1为正常  9为不存在的
	 */
	@Column(name = "STATUS")
	private Integer status;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGeshi() {
		return geshi;
	}
	public void setGeshi(String geshi) {
		this.geshi = geshi;
	}
	public String getFenbianlv() {
		return fenbianlv;
	}
	public void setFenbianlv(String fenbianlv) {
		this.fenbianlv = fenbianlv;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getDaoyan() {
		return daoyan;
	}
	public void setDaoyan(String daoyan) {
		this.daoyan = daoyan;
	}
	public String getYanyuan() {
		return yanyuan;
	}
	public void setYanyuan(String yanyuan) {
		this.yanyuan = yanyuan;
	}
	public String getZhaiyao() {
		return zhaiyao;
	}
	public void setZhaiyao(String zhaiyao) {
		this.zhaiyao = zhaiyao;
	}
	public String getPingfen() {
		return pingfen;
	}
	public void setPingfen(String pingfen) {
		this.pingfen = pingfen;
	}
	public Integer getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(Integer downloadCount) {
		this.downloadCount = downloadCount;
	}
	public Integer getJiamiFanshi() {
		return jiamiFanshi;
	}
	public void setJiamiFanshi(Integer jiamiFanshi) {
		this.jiamiFanshi = jiamiFanshi;
	}
	public String getSuipians() {
		return suipians;
	}
	public void setSuipians(String suipians) {
		this.suipians = suipians;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
}
