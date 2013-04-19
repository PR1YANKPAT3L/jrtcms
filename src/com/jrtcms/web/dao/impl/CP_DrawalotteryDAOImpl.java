package com.jrtcms.web.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.jrtcms.web.dao.CP_DrawalotteryDAO;
import com.jrtcms.web.pojo.CP_Drawalottery;

public class CP_DrawalotteryDAOImpl implements CP_DrawalotteryDAO {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	
	@Override
	/**
	 * 插入开奖信息
	 */
	public void toInsertDrawalottery(CP_Drawalottery cpDrawalottery) {
		// TODO Auto-generated method stub
		this.sqlMapClientTemplate.insert("CP_Drawalottery.ibatorgenerated_insertSelective", cpDrawalottery);
	}

	@Override
	/**
	 * 根据彩种和期号查询开奖信息
	 */
	public CP_Drawalottery selectDrawalottery(String lotno, String batchcode) {
		CP_Drawalottery dr = new CP_Drawalottery();
		dr.setLotno(lotno);
		dr.setBatchcode(batchcode);
		CP_Drawalottery drawalottery = (CP_Drawalottery)this.sqlMapClientTemplate.queryForObject("CP_Drawalottery.selectDrawalottery",dr);
		return drawalottery;
	}
	@Override
	/**
	 * 根据彩种和期号查询开奖信息
	 */
	public List queryAllBatchcodeByLotno(String lotno) {
		
		CP_Drawalottery dr = new CP_Drawalottery();
		dr.setLotno(lotno);
		List batchcodeList = (List)this.sqlMapClientTemplate.queryForList("CP_Drawalottery.selectAllBatchcodeByLotno",dr);
		return batchcodeList;
	}

	@Override
	public Integer deleteLottery(String nowDate) {
		CP_Drawalottery dr = new CP_Drawalottery();
		dr.setLotteryTime(nowDate);
		return this.sqlMapClientTemplate.delete("CP_Drawalottery.deleteLottery",dr);
	}

	@Override
	public List queryAllByDate(String nowDate) {
		CP_Drawalottery dr = new CP_Drawalottery();
		dr.setLotteryTime(nowDate);
		List batchcodeList = (List)this.sqlMapClientTemplate.queryForList("CP_Drawalottery.selectByDate",dr);
		return batchcodeList;
	}

	@Override
	public Integer deleteLotteryById(Long id) {
		CP_Drawalottery dr = new CP_Drawalottery();
		dr.setId(id);
		return this.sqlMapClientTemplate.delete("CP_Drawalottery.deleteLotteryByID",dr);
	}

	@Override
	public List queryAll() {
		List batchcodeList = (List)this.sqlMapClientTemplate.queryForList("CP_Drawalottery.selectAllByDate");
		return batchcodeList;
	}

}
