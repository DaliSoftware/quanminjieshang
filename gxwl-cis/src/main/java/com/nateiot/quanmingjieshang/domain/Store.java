package com.nateiot.quanmingjieshang.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.nateiot.base.domain.BaseEntity;

@Table
@Entity(name = "STORE")
public class Store extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "STORE_ID")
	private Long storeId;
	
	/**
	 * 店铺名称
	 */
	@Column(name = "STORE_NAME")
	private String storeName;
	
	
	/**
	 * 店铺名称
	 */
	@Column(name = "STORE_XINGZHI")
	private String storeXingzhi;
	
	/**
	 * 店铺业务范围
	 */
	@Column(name = "STORE_YEWU_FANWEI")
	private String storeYewuFanwei;
	
	/**
	 * 店铺欢迎词
	 */
	@Column(name = "STORE_HUANYINGCI")
	private String storeHuanyingci;
	
	/**
	 * 店铺负责人
	 */
	@Column(name = "STORE_FUZEREN")
	private String storeFuzeren;
	
	/**
	 * 店铺负责人身份证号
	 */
	@Column(name = "STORE_FUZEREN_ID")
	private String storeFuzerenId;
	
	/**
	 * 店铺负责人性别
	 */
	@Column(name = "STORE_FUZEREN_SEX")
	private String storeFuzerenSex;
	
	/**
	 * 负责人角色（农户、收购商）
	 */
	@Column(name = "STORE_FUZEREN_ROLE")
	private String storeFuzerenRole;
	
	/**
	 * 店铺负责人头像
	 */
	@Column(name = "STORE_FUZEREN_IMAGE")
	private String storeFuzerenImage;
	
	/**
	 * 店铺负责人所在地址
	 */
	@Column(name = "STORE_FUZEREN_ADDRESS")
	private String storeFuzerenAddress;
	
	/**
	 * 店铺负责人电话
	 */
	@Column(name = "STORE_FUZEREN_PHONE")
	private String storeFuzerenPhone;

	
	/**
	 * 店铺负责人邮箱
	 */
	@Column(name = "STORE_FUZEREN_EMAIL")
	private String storeFuzerenEmail;
	
	/**
	 * 店铺所在地址
	 */
	@Column(name = "STORE_ADDRESS")
	private String storeAddress;
	
	/**
	 * 店铺所在经度
	 */
	@Column(name = "STORE_LONGITUDE")
	private String storeLongitude;
	
	/**
	 * 店铺所在纬度
	 */
	@Column(name = "STORE_LATITUDE")
	private String storeLatitude;
	
	/**
	 * 店铺经营状态（正常经营、非法经营、暂停经营、停止经营）
	 */
	@Column(name = "STORE_STATUS")
	private String storeStatus;

	public Long getStoreId() {
		return storeId;
	}

	public void setStoreId(Long storeId) {
		this.storeId = storeId;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreXingzhi() {
		return storeXingzhi;
	}

	public void setStoreXingzhi(String storeXingzhi) {
		this.storeXingzhi = storeXingzhi;
	}

	public String getStoreYewuFanwei() {
		return storeYewuFanwei;
	}

	public void setStoreYewuFanwei(String storeYewuFanwei) {
		this.storeYewuFanwei = storeYewuFanwei;
	}

	public String getStoreHuanyingci() {
		return storeHuanyingci;
	}

	public void setStoreHuanyingci(String storeHuanyingci) {
		this.storeHuanyingci = storeHuanyingci;
	}

	public String getStoreFuzeren() {
		return storeFuzeren;
	}

	public void setStoreFuzeren(String storeFuzeren) {
		this.storeFuzeren = storeFuzeren;
	}

	public String getStoreFuzerenId() {
		return storeFuzerenId;
	}

	public void setStoreFuzerenId(String storeFuzerenId) {
		this.storeFuzerenId = storeFuzerenId;
	}

	public String getStoreFuzerenSex() {
		return storeFuzerenSex;
	}

	public void setStoreFuzerenSex(String storeFuzerenSex) {
		this.storeFuzerenSex = storeFuzerenSex;
	}

	public String getStoreFuzerenRole() {
		return storeFuzerenRole;
	}

	public void setStoreFuzerenRole(String storeFuzerenRole) {
		this.storeFuzerenRole = storeFuzerenRole;
	}

	public String getStoreFuzerenImage() {
		return storeFuzerenImage;
	}

	public void setStoreFuzerenImage(String storeFuzerenImage) {
		this.storeFuzerenImage = storeFuzerenImage;
	}

	public String getStoreFuzerenAddress() {
		return storeFuzerenAddress;
	}

	public void setStoreFuzerenAddress(String storeFuzerenAddress) {
		this.storeFuzerenAddress = storeFuzerenAddress;
	}

	public String getStoreFuzerenPhone() {
		return storeFuzerenPhone;
	}

	public void setStoreFuzerenPhone(String storeFuzerenPhone) {
		this.storeFuzerenPhone = storeFuzerenPhone;
	}

	public String getStoreFuzerenEmail() {
		return storeFuzerenEmail;
	}

	public void setStoreFuzerenEmail(String storeFuzerenEmail) {
		this.storeFuzerenEmail = storeFuzerenEmail;
	}

	public String getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	public String getStoreLongitude() {
		return storeLongitude;
	}

	public void setStoreLongitude(String storeLongitude) {
		this.storeLongitude = storeLongitude;
	}

	public String getStoreLatitude() {
		return storeLatitude;
	}

	public void setStoreLatitude(String storeLatitude) {
		this.storeLatitude = storeLatitude;
	}

	public String getStoreStatus() {
		return storeStatus;
	}

	public void setStoreStatus(String storeStatus) {
		this.storeStatus = storeStatus;
	}
	
	
}
