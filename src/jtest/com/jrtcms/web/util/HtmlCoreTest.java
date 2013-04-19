package jtest.com.jrtcms.web.util;

import java.util.Map;

import org.junit.Test;

import com.jrtcms.web.pojo.CP_Drawalottery;
import com.jrtcms.web.util.HtmlCore;
public class HtmlCoreTest {
	
	/**
	 * 根据彩种和气候访问500万的wap站获取最新信息
	 */
	@Test
	public void getHtmlCoreMessageTest(){
		try {
			Map map = HtmlCore.getHtmlCoreMessage("http://wap.500wan.com/info/prize/prize_open?", "ssq", "11048");
			System.out.println("map:"+map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 双色球投注
	 */
	@Test
	public void getSSQDrawalotteryTest(){
		try {
			CP_Drawalottery  drawalottery= HtmlCore.getSSQDrawalottery("http://wap.500wan.com/info/prize/prize_open?", "ssq", "11047");
			System.out.println("彩种:"+drawalottery.getLotno()+"\n期号:"+drawalottery.getBatchcode()
					+"\n开奖时间:"+drawalottery.getLotteryTime()+"\n开奖号码:"+drawalottery.getLotteryCode()
					+"\n投注总金额:"+drawalottery.getBetTotalMoney()+"\n奖池累积总金额:"+drawalottery.getProgressive()
					+"\n奖项等级:"+drawalottery.getPrizeInfo());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 大乐透投注
	 */
	@Test
	public void getDLTDrawalotteryTest(){
		try {
			CP_Drawalottery  drawalottery= HtmlCore.getDLTDrawalottery("http://wap.500wan.com/info/prize/prize_open?", "dlt", "11047");
			System.out.println("彩种:"+drawalottery.getLotno()+"\n期号:"+drawalottery.getBatchcode()
					+"\n开奖时间:"+drawalottery.getLotteryTime()+"\n开奖号码:"+drawalottery.getLotteryCode()
					+"\n投注总金额:"+drawalottery.getBetTotalMoney()+"\n奖池累积总金额:"+drawalottery.getProgressive()
					+"\n奖项等级:"+drawalottery.getPrizeInfo());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 3D投注
	 */
	@Test
	public void getSDDrawalotteryTest(){
		try {
			CP_Drawalottery  drawalottery= HtmlCore.getSDDrawalottery("http://wap.500wan.com/info/prize/prize_open?",
					"http://datachart.500wan.com/sd/history/inc/history.php?limit=50", "sd", "2011110");
			System.out.println("彩种:"+drawalottery.getLotno()+"\n期号:"+drawalottery.getBatchcode()
					+"\n开奖时间:"+drawalottery.getLotteryTime()+"\n开奖号码:"+drawalottery.getLotteryCode()
					+"\n投注总金额:"+drawalottery.getBetTotalMoney()+"\n奖池累积总金额:"+drawalottery.getProgressive()
					+"\n奖项等级:"+drawalottery.getPrizeInfo());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 七乐彩投注
	 */
	@Test
	public void getQLCDrawalotteryTest(){
		try {
			CP_Drawalottery  drawalottery= HtmlCore.getQLCDrawalottery("http://wap.500wan.com/info/prize/prize_open?", "qlc", "11052");
			System.out.println("彩种:"+drawalottery.getLotno()+"\n期号:"+drawalottery.getBatchcode()
					+"\n开奖时间:"+drawalottery.getLotteryTime()+"\n开奖号码:"+drawalottery.getLotteryCode()
					+"\n投注总金额:"+drawalottery.getBetTotalMoney()+"\n奖池累积总金额:"+drawalottery.getProgressive()
					+"\n奖项等级:"+drawalottery.getPrizeInfo());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 排列三投注
	 */
	@Test
	public void getPLSDrawalotteryTest(){
		try {
			CP_Drawalottery  drawalottery= HtmlCore.getPLSDrawalottery("http://wap.500wan.com/info/prize/prize_open?",
					"http://datachart.500wan.com/pls/history/inc/history.php?limit=50","pls", "11122");
			System.out.println("彩种:"+drawalottery.getLotno()+"\n期号:"+drawalottery.getBatchcode()
					+"\n开奖时间:"+drawalottery.getLotteryTime()+"\n开奖号码:"+drawalottery.getLotteryCode()
					+"\n投注总金额:"+drawalottery.getBetTotalMoney()+"\n奖池累积总金额:"+drawalottery.getProgressive()
					+"\n奖项等级:"+drawalottery.getPrizeInfo());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 排列五投注
	 */
	@Test
	public void getPLWDrawalotteryTest(){
		try {
			CP_Drawalottery  drawalottery= HtmlCore.getPLWDrawalottery("http://wap.500wan.com/info/prize/prize_open?",
					"http://datachart.500wan.com/plw/history/inc/history.php?limit=50","plw", "11122");
			System.out.println("彩种:"+drawalottery.getLotno()+"\n期号:"+drawalottery.getBatchcode()
					+"\n开奖时间:"+drawalottery.getLotteryTime()+"\n开奖号码:"+drawalottery.getLotteryCode()
					+"\n投注总金额:"+drawalottery.getBetTotalMoney()+"\n奖池累积总金额:"+drawalottery.getProgressive()
					+"\n奖项等级:"+drawalottery.getPrizeInfo());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 七星彩投注
	 */
	@Test
	public void getQXCDrawalotteryTest(){
		try {
			CP_Drawalottery  drawalottery= HtmlCore.getQXCDrawalottery("http://wap.500wan.com/info/prize/prize_open?", "qxc", "11052");
			System.out.println("彩种:"+drawalottery.getLotno()+"\n期号:"+drawalottery.getBatchcode()
					+"\n开奖时间:"+drawalottery.getLotteryTime()+"\n开奖号码:"+drawalottery.getLotteryCode()
					+"\n投注总金额:"+drawalottery.getBetTotalMoney()+"\n奖池累积总金额:"+drawalottery.getProgressive()
					+"\n奖项等级:"+drawalottery.getPrizeInfo());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
