package com.jrtcms.web.service;

import java.util.List;

import com.jrtcms.web.pojo.CP_Drawalottery;

/**
 * 
 * 抓取彩票开奖信息的service
 * @author 徐丽
 *
 */
public interface CP_DrawalotteryService {
	/**
	 * 插入开奖信息
	 */
	public void toAddDrawalottery(CP_Drawalottery cpDrawalottery);
	
	/**
	 * 根据彩种和期号查询开奖信息
	 */
	public CP_Drawalottery selectDrawalottery(String lotno, String batchcode);
	/**
	 * 根据彩种查询所有期号
	 */
	public List selectAllBatchcodeByLotno(String lotno);
	
	/**
	 * 根据时间查询所有彩种和期号的拼接
	 */
	public List selectAllByDate(String nowDate);
	/**
	 * 根据时间查询所有开奖
	 */
	public List selectByDate();
	/**
	 * 删除 当天开奖信息
	 * @param nowDate 当前时间
	 * @return 删除的行数
	 */
	public Integer removeLottery(String nowDate);
	/**
	 * 根据id删除记录
	 * @param id 记录的id值
	 * @return 删除的行数
	 */

	public Integer removeLotteryById(Long id);
	
}
