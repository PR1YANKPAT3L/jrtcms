package com.jrtcms.web.dao;


import java.util.List;

import com.jrtcms.web.pojo.CP_Drawalottery;

/**
 * 
 * 从500wan wap站抓取开奖数据的接口
 * @author 徐丽
 *
 */
public interface CP_DrawalotteryDAO {
	//插入彩票开奖表
	void toInsertDrawalottery(CP_Drawalottery cp_drawalottery);
	//根据彩种和期号查询
	CP_Drawalottery selectDrawalottery(String lotno,String batchcode);
	//根据彩种查询所有期号
	List queryAllBatchcodeByLotno(String lotno);
	/**
	 * 根据时间查询所有彩种和期号的拼接
	 * @param nowDate
	 * @return
	 */
	List queryAllByDate(String nowDate);
	/**
	 * 根据时间查询开奖信息
	 * @param nowDate
	 * @return
	 */
	List queryAll();
	/**
	 * 删除 当天开奖信息
	 * @param nowDate 当前时间
	 * @return 删除的行数
	 */
	Integer deleteLottery(String nowDate);
	/**
	 * 删除开奖信息
	 * @param id 开奖信息的id
	 * @return 删除的行数
	 */
	Integer deleteLotteryById(Long id);
}
