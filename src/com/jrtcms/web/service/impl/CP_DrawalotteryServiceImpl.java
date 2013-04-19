package com.jrtcms.web.service.impl;

import java.util.List;

import com.jrtcms.web.dao.CP_DrawalotteryDAO;
import com.jrtcms.web.pojo.CP_Drawalottery;
import com.jrtcms.web.service.CP_DrawalotteryService;

/**
 * 
 * 抓取外网开奖查询存入数据库
 * @author 徐丽
 *
 */
public class CP_DrawalotteryServiceImpl implements CP_DrawalotteryService {
	private CP_DrawalotteryDAO cp_drawalotteryDAO = null;
	public CP_DrawalotteryDAO getCp_drawalotteryDAO() {
		return cp_drawalotteryDAO;
	}
	public void setCp_drawalotteryDAO(CP_DrawalotteryDAO cpDrawalotteryDAO) {
		cp_drawalotteryDAO = cpDrawalotteryDAO;
	}
	/**
	 * 插入开奖信息
	 */
	@Override
	public void toAddDrawalottery(CP_Drawalottery cpDrawalottery) {
		// 调用查询开奖信息的功能查询开奖内容并返回
		CP_Drawalottery drawalottery = cp_drawalotteryDAO.selectDrawalottery(cpDrawalottery.getLotno(),
				cpDrawalottery.getBatchcode());
		if(drawalottery==null){
			cp_drawalotteryDAO.toInsertDrawalottery(cpDrawalottery);
		}
	}
	
	/**
	 * 根据彩种和期号查询开奖信息
	 */
	@Override
	public CP_Drawalottery selectDrawalottery(String lotno, String batchcode) {
		return cp_drawalotteryDAO.selectDrawalottery(lotno, batchcode);
	}
	
	/**
	 * 根据彩种和期号查询开奖信息
	 */
	@Override
	public List selectAllBatchcodeByLotno(String lotno) {
		return cp_drawalotteryDAO.queryAllBatchcodeByLotno(lotno);
	}
	@Override
	public Integer removeLottery(String nowDate) {
		// TODO Auto-generated method stub
		return cp_drawalotteryDAO.deleteLottery(nowDate);
	}
	@Override
	public List selectAllByDate(String nowDate) {
		// TODO Auto-generated method stub
		return cp_drawalotteryDAO.queryAllByDate(nowDate);
	}
	@Override
	public Integer removeLotteryById(Long id) {
		// TODO Auto-generated method stub
		return cp_drawalotteryDAO.deleteLotteryById(id);
	}
	@Override
	public List selectByDate() {
		// TODO Auto-generated method stub
		return cp_drawalotteryDAO.queryAll();
	}

}
