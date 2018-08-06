package com.chinxk.flight.bean;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class InterMessageBean {

	// id
	private String id;
	// 到达城市Name
	private String toCityName;
	// 到达城市Code
	private String toCityCode;
	// 出发城市Name
	private String fromCityName;
	// 出发城市Code
	private String fromCityCode;
	// 开始日期
	private String startDate;
	// 结束日期
	private String endDate;
	// E-mail
	private String mailAdd;
	// 目标价格
	private Integer targetPrice;
	// 去哪儿价格
	private Integer qunarPrice;
	// 飞猪价格
	private Integer fliggyPrice;
	// 携程价格
	private Integer ctripPrice;
	// 天巡价格
	private Integer skyPrice;
	// 创建时间
	private String createDate;
	// 状态
	private Integer status;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getToCityName() {
		return toCityName;
	}

	public void setToCityName(String toCityName) {
		this.toCityName = toCityName;
	}

	public String getToCityCode() {
		return toCityCode;
	}

	public void setToCityCode(String toCityCode) {
		this.toCityCode = toCityCode;
	}

	public String getFromCityName() {
		return fromCityName;
	}

	public void setFromCityName(String fromCityName) {
		this.fromCityName = fromCityName;
	}

	public String getFromCityCode() {
		return fromCityCode;
	}

	public void setFromCityCode(String fromCityCode) {
		this.fromCityCode = fromCityCode;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getMailAdd() {
		return mailAdd;
	}

	public void setMailAdd(String mailAdd) {
		this.mailAdd = mailAdd;
	}

	public Integer getTargetPrice() {
		return targetPrice;
	}

	public void setTargetPrice(Integer targetPrice) {
		this.targetPrice = targetPrice;
	}

	public Integer getQunarPrice() {
		return qunarPrice;
	}

	public void setQunarPrice(Integer qunarPrice) {
		this.qunarPrice = qunarPrice;
	}

	public Integer getFliggyPrice() {
		return fliggyPrice;
	}

	public void setFliggyPrice(Integer fliggyPrice) {
		this.fliggyPrice = fliggyPrice;
	}

	public Integer getCtripPrice() {
		return ctripPrice;
	}

	public void setCtripPrice(Integer ctripPrice) {
		this.ctripPrice = ctripPrice;
	}

	public Integer getSkyPrice() {
		return skyPrice;
	}

	public void setSkyPrice(Integer skyPrice) {
		this.skyPrice = skyPrice;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Override
	public String toString() {
		String rStr = "";
		for(Method m : this.getClass().getMethods()) {
			String methodName =m.getName();
			if(methodName.startsWith("get")&&!methodName.contains("Class")) {
				StringBuilder stringBuilder = new StringBuilder();
				stringBuilder.append(methodName.replaceFirst("get", ""));
				stringBuilder.append(":");
				try {
					stringBuilder.append(m.invoke(this, null));
					stringBuilder.append(",");
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				rStr += (stringBuilder.toString());
			}
		}
		return rStr;
	}
}
