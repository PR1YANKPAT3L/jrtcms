package com.jrtcms.web.pojo;


/**
 * 
 * 从500wan wap站抓取开奖数据的实体Bean
 * @author 徐丽
 *
 */
public class CP_Drawalottery {
	/**
	 * 自动增长的id;
	 */
	private Long id;
	/**
	 * 彩种
	 */
	private String lotno;
	/**
	 * 期号
	 */
	private String batchcode;
	
	/**
	 * 开奖日期
	 */
	private String lotteryTime;
	/**
	 * 开奖号码
	 */
	private String lotteryCode;
	
	/**
	 * 投注总金额
	 */
	private String betTotalMoney;
	
	/**
	 * 奖池资金累计总金额
	 */
	private String progressive;
	
	/**
	 * 奖项等级
	 */
	private String prizeInfo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLotno() {
		return lotno;
	}

	public void setLotno(String lotno) {
		this.lotno = lotno;
	}

	public String getBatchcode() {
		return batchcode;
	}

	public void setBatchcode(String batchcode) {
		this.batchcode = batchcode;
	}

	public String getLotteryTime() {
		return lotteryTime;
	}

	public void setLotteryTime(String lotteryTime) {
		this.lotteryTime = lotteryTime;
	}

	public String getLotteryCode() {
		return lotteryCode;
	}

	public void setLotteryCode(String lotteryCode) {
		this.lotteryCode = lotteryCode;
	}

	public String getBetTotalMoney() {
		return betTotalMoney;
	}

	public void setBetTotalMoney(String betTotalMoney) {
		this.betTotalMoney = betTotalMoney;
	}
    

	public String getProgressive() {
		return progressive;
	}

	public void setProgressive(String progressive) {
		this.progressive = progressive;
	}

	public String getPrizeInfo() {
		return prizeInfo;
	}

	public void setPrizeInfo(String prizeInfo) {
		this.prizeInfo = prizeInfo;
	}

	
	
}
