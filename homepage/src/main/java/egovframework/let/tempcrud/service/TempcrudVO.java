package egovframework.let.tempcrud.service;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;

import egovframework.com.cmm.ComDefaultVO;


public class TempcrudVO extends ComDefaultVO implements Serializable {
	
	private String crudId;
	
	
	private String crudSj;
	
	private String crudCn;
	
	private String userNm;
	
	private String frstRegist;

	public String getCrudId() {
		return crudId;
	}

	public void setCrudId(String crudId) {
		this.crudId = crudId;
	}

	public String getCrudSj() {
		return crudSj;
	}

	public void setCrudSj(String crudSj) {
		this.crudSj = crudSj;
	}

	public String getCrudCn() {
		return crudCn;
	}

	public void setCrudCn(String crudCn) {
		this.crudCn = crudCn;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getFrstRegist() {
		return frstRegist;
	}

	public void setFrstRegist(String frstRegist) {
		this.frstRegist = frstRegist;
	}
	
	


	
}
