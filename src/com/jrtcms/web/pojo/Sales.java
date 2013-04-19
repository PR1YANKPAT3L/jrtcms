package com.jrtcms.web.pojo;

/**
 * 销售额
 * @author 鞠牧
 *
 */
public class Sales {
	private Long id ; 
	private String userNo;//用户编号
	private String userName;//用户名
	private String creTime;//购买时间
	private Integer amt;//本次交易金额
	private String lotNo;//彩种编号
	private String wanfa;//玩法
	private String memo;//备注
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCreTime() {
		return creTime;
	}
	public void setCreTime(String creTime) {
		this.creTime = creTime;
	}
	public Integer getAmt() {
		return amt;
	}
	public void setAmt(Integer amt) {
		this.amt = amt;
	}
	public String getLotNo() {
		return lotNo;
	}
	public void setLotNo(String lotNo) {
		this.lotNo = lotNo;
	}
	public String getWanfa() {
		return wanfa;
	}
	public void setWanfa(String wanfa) {
		this.wanfa = wanfa;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	

	
}
