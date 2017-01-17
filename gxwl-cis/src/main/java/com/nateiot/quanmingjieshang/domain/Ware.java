package com.nateiot.quanmingjieshang.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.nateiot.base.domain.BaseEntity;

@Entity
@Table(name = "WARE")
public class Ware extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "WARE_ID")
	private Long wareId;
	
	/**
	 * 商铺id
	 */
	@Column(name = "STORE_ID")
	private Long storeId;
	
	/**
	 * 商品名称
	 */
	@Column(name = "WARE_NAME")
	private String wareName;
	
	/**
	 * 商品类型（农产品、农副产品）
	 */
	@Column(name = "WARE_TYPE")
	private String wareType;
	
	/**
	 * 是否有货
	 */
	@Column(name = "WARE_EXISTS")
	private String wareExists;
	
	/**
	 * 商品状态（在售、已下架）
	 */
	@Column(name = "WARE_STATUS")
	private String wareStatus;
	
	/**
	 * 商品库存
	 */
	@Column(name = "WARE_KUCUN")
	private Double wareKucun;
	
	/**
	 * 商品单位
	 */
	@Column(name = "WARE_UNIT")
	private String wareUnit;
	
	/**
	 * 商品是否被预定
	 */
	@Column(name = "WARE_IS_YUDING")
	private String wareIsYuding;
	
	/**
	 * 商品描述
	 */
	@Column(name = "WARE_REMARK")
	private String wareRemark;

	public Long getWareId() {
		return wareId;
	}

	public void setWareId(Long wareId) {
		this.wareId = wareId;
	}

	public Long getStoreId() {
		return storeId;
	}

	public void setStoreId(Long storeId) {
		this.storeId = storeId;
	}

	public String getWareName() {
		return wareName;
	}

	public void setWareName(String wareName) {
		this.wareName = wareName;
	}

	public String getWareType() {
		return wareType;
	}

	public void setWareType(String wareType) {
		this.wareType = wareType;
	}

	public String getWareExists() {
		return wareExists;
	}

	public void setWareExists(String wareExists) {
		this.wareExists = wareExists;
	}

	public String getWareStatus() {
		return wareStatus;
	}

	public void setWareStatus(String wareStatus) {
		this.wareStatus = wareStatus;
	}

	public Double getWareKucun() {
		return wareKucun;
	}

	public void setWareKucun(Double wareKucun) {
		this.wareKucun = wareKucun;
	}

	public String getWareUnit() {
		return wareUnit;
	}

	public void setWareUnit(String wareUnit) {
		this.wareUnit = wareUnit;
	}

	public String getWareIsYuding() {
		return wareIsYuding;
	}

	public void setWareIsYuding(String wareIsYuding) {
		this.wareIsYuding = wareIsYuding;
	}

	public String getWareRemark() {
		return wareRemark;
	}

	public void setWareRemark(String wareRemark) {
		this.wareRemark = wareRemark;
	}
	
}
