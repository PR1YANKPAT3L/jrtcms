package com.jrtcms.web.pojo;

public class Activity {
	private String userNo;//用户编号
	private String isKey;//活动的唯一标识
	private String inTime;//参与活动的时间
	private Long reward;//奖励
	private Integer type;//活动类型，1第一次绑定手机赠送彩金
	
	public final static int TYPE_FIRST_REGISTR_GIFT_3=1;//活动 首次绑定手机送3元


	
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getIsKey() {
		return isKey;
	}
	public void setIsKey(String isKey) {
		this.isKey = isKey;
	}
	public String getInTime() {
		return inTime;
	}
	public void setInTime(String inTime) {
		this.inTime = inTime;
	}
	public Long getReward() {
		return reward;
	}
	public void setReward(Long reward) {
		this.reward = reward;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
}
