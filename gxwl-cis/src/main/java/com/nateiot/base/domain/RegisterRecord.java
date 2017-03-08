package com.nateiot.base.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;

import com.nateiot.core.common.json.JsonDateTimeSerializer;

@Entity
@Table(name = "REGISTER_RECORD")
public class RegisterRecord extends BaseEntity{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID", nullable = false)
	private Integer id;

	/**
	 * 注册日期
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonSerialize(using = JsonDateTimeSerializer.class)
	@Column(name = "REGISTER_DATE")
	private Date registerDate;
	
	/**
	 * 模块ID
	 */
	@Column(name = "REMOTE_IP")
	private String remoteIp;
	


	/**
	 * 模块ID
	 */
	@Column(name = "REGISTER_PHONE")
	private String registerPhone;

	/**
	 * 模块ID
	 */
	@Transient
	private Integer phoneVerifyCode;
	
	/**
	 * 模块ID
	 */
	@Column(name = "PHONE_ERROR_COUNT")
	private Integer phoneErrorCount;

	/**
	 * 模块ID
	 */
	@Column(name = "PHONE_VERIFY_RESULT")
	private Integer phoneVerifyResult;

	/**
	 * 模块ID
	 */
	@Column(name = "IMAGE_VALUE")
	private String imageValue;

	/**
	 * 模块ID
	 */
	@Column(name = "IMAGE_VERIFY_RESULT")
	private Integer imageVerifyResult;

	/**
	 * 模块ID
	 */
	@Column(name = "IMAGE_ERROR_COUNT")
	private Integer imageErrorCount;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getRemoteIp() {
		return remoteIp;
	}

	public void setRemoteIp(String remoteIp) {
		this.remoteIp = remoteIp;
	}

	public String getRegisterPhone() {
		return registerPhone;
	}

	public void setRegisterPhone(String registerPhone) {
		this.registerPhone = registerPhone;
	}

	public Integer getPhoneErrorCount() {
		return phoneErrorCount;
	}

	public void setPhoneErrorCount(Integer phoneErrorCount) {
		this.phoneErrorCount = phoneErrorCount;
	}

	public Integer getPhoneVerifyResult() {
		return phoneVerifyResult;
	}

	public void setPhoneVerifyResult(Integer phoneVerifyResult) {
		this.phoneVerifyResult = phoneVerifyResult;
	}

	public String getImageValue() {
		return imageValue;
	}

	public void setImageValue(String imageValue) {
		this.imageValue = imageValue;
	}

	public Integer getImageVerifyResult() {
		return imageVerifyResult;
	}

	public void setImageVerifyResult(Integer imageVerifyResult) {
		this.imageVerifyResult = imageVerifyResult;
	}

	public Integer getImageErrorCount() {
		return imageErrorCount;
	}

	public void setImageErrorCount(Integer imageErrorCount) {
		this.imageErrorCount = imageErrorCount;
	}

	public Integer getPhoneVerifyCode() {
		return phoneVerifyCode;
	}

	public void setPhoneVerifyCode(Integer phoneVerifyCode) {
		this.phoneVerifyCode = phoneVerifyCode;
	}
	
	
}
