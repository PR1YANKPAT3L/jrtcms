package com.jrtcms.web.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;

import com.jrtcms.web.model.PhraseLibraryMD;
import com.jrtcms.web.pojo.PhraseLibrary;
import com.jrtcms.web.service.PhraseLibraryService;
import com.jrtcms.web.service.impl.PhraseLibraryServiceImpl;
import com.jrtcms.web.util.BaseAction;
/***
 * 词组的增删改查方法
 */
public class PhraseLibraryAction extends BaseAction {
	private Logger log = Logger.getLogger(NewsInfoAction.class);
	private static ResourceBundle rbint = ResourceBundle.getBundle("jrtcms");
	private PhraseLibrary pl = new PhraseLibrary();
	private PhraseLibraryMD plMd = new PhraseLibraryMD();
	private PhraseLibraryService phraseLibraryService ;
	public PhraseLibrary getPl() {
		return pl;
	}
	public void setPl(PhraseLibrary pl) {
		this.pl = pl;
	}
	public PhraseLibraryMD getPlMd() {
		return plMd;
	}
	public void setPlMd(PhraseLibraryMD plMd) {
		this.plMd = plMd;
	}
	public PhraseLibraryService getPhraseLibraryService() {
		return phraseLibraryService;
	}
	public void setPhraseLibraryService(PhraseLibraryService phraseLibraryService) {
		this.phraseLibraryService = phraseLibraryService;
	}
	/**
	 * 添加词组信息
	 * @return
	 */
	public String creatPhrase(){
		try{
			String msg = phraseLibraryService.add(pl);
			if("success".equals(msg)){
				Map <String ,String>  map = PhraseLibraryServiceImpl.phraseLibrasy;
				map.clear();
				log.info("添加词组成功！");
				request.setAttribute("msg", "添加词组成功！");
				request.setAttribute("state", "1");
			}else{
				log.info("添加词组失败！");
				request.setAttribute("msg", "添加词组失败！");
			}
			
		}catch(Exception e){
			e.getStackTrace();
			log.info(e.getStackTrace());
			request.setAttribute("msg", "添加词组方法中出现异常！");
			
		}
		return "msg";
	}
	/**
	 * 修改词组
	 * @return
	 */
	public void modifyPhrase(){
		try{
			pl.setPhrase(new String(pl.getPhrase()
					.getBytes("ISO-8859-1"), "utf-8"));
			pl.setPhraseUrl(new String(pl.getPhraseUrl()
				.getBytes("ISO-8859-1"), "utf-8"));
			String msg = phraseLibraryService.updatePhraseLibrary(pl);
			if("success".equals(msg)){
				Map <String ,String>  map = PhraseLibraryServiceImpl.phraseLibrasy;
				map.clear();
				log.info("修改词组成功！");
				out.print("修改词组成功！");
				request.setAttribute("state", "1");
			}else{
				log.info("修改词组失败！");
				out.print("修改词组失败！");
			}
			
		}catch(Exception e){
			e.getStackTrace();
			log.info("修改词组方法中出现异常！");
			out.print("修改词组方法中出现异常！");
			
		}
	}
	/**
	 *查询所有的数组  不带分页的
	 * @return
	 */
	public String SearchAllPhrase(){
		List list  = new ArrayList();
		try{
			 list = phraseLibraryService.selectAll();
			if(list.size()>0){
				log.info("查询词组成功！");
				request.setAttribute("msg", "查询词组成功！");
			}else{
				log.info("暂时没有词组的记录");
				request.setAttribute("msg", "暂时没有词组的记录");
			}
		
		}catch(Exception e){
			e.getStackTrace();
			log.info("查询词组方法中出现异常！");
			request.setAttribute("msg","查询词组方法中出现异常！");
			
		}
		request.setAttribute("list", list);
		return  "selphrase";
	}
	/**
	 *查询所有的数组 分页
	 * @return
	 */
	public String SearchLIst(){
		List list  = new ArrayList();
		
		try{
			String page = request.getParameter("page");
			if(page==null ||"".equals(page)){
				page ="1";
			}
			String state = request.getParameter("state");
			if(state==null ||"".equals(state)){
				state ="1";
			}
			Integer limitCount = Integer.parseInt(rbint.getString("limitCount"));
			plMd.setNowPage((Integer.valueOf(page) - 1) * limitCount);
			plMd.setLimitCount(limitCount);
			plMd.setState(Integer.valueOf(state));
			 list = phraseLibraryService.selectAllFY(plMd);
			if(list.size()>0){
				log.info("查询词组成功！");
				request.setAttribute("msg", "查询词组成功！");
				if(list.size()>limitCount){
					request.setAttribute("pageHtml", getPageToHtml(Integer.valueOf(page), list.size(),
							 limitCount, 3,state));
				}
			}else{
				log.info("暂时没有词组的记录");
				request.setAttribute("msg", "暂时没有词组的记录");
			}
		
		}catch(Exception e){
			e.getStackTrace();
			log.info("查询词组方法中出现异常！");
			request.setAttribute("msg","查询词组方法中出现异常！");
			
		}
		request.setAttribute("list", list);
		return  "selphrase";
	}
	
	
	/**
	 * 返回对应的页数
	 * 
	 * @param page
	 *            当前选择页数
	 * @param maxLine
	 *            当前条件下的
	 * @param limitCount
	 *            每页显示记录数
	 * @param omission
	 *            设置前后间隔几页进行省略
	 * @return
	 */
	private String getPageToHtml(Integer page, Integer maxLine,
			Integer limitCount, Integer omission,String state) {
		String html = "";
		Integer maxPage = (maxLine + limitCount - 1) / limitCount;

		if (page != null && page > 1) {
			html += "<a href='/web/phraseLibrary!SearchLIst?page=1&state="+state+"'>第一页</a>";
			html += "<a href='/web/phraseLibrary!SearchLIst?page=" + (page - 1)
					+ "&state="+state+"'>上一页</a>";
		}
		for (int i = 0; i < maxPage; i++) {
			if ((i + 1) == page) {
				html += "[-" + (i + 1) + "-]";
			} else if ((i + omission + 1) == page || (i - omission + 1) == page) {
				html += "<a href='/web/phraseLibrary!SearchLIst?page="
						+ (i + 1) + "&state="+state+"'>[...]</a>";
			} else if (page != null && (page - omission - 1) < i
					&& (page + omission - 1) > i) {
				html += "<a href='/web/phraseLibrary!SearchLIst??page="
						+ (i + 1) + "&state="+state+"'>[-" + (i + 1) + "-]</a>";
			}
		}
		if (page == null || page < maxPage) {
			html += "<a href='/web/phraseLibrary!SearchLIst?page=" + (page + 1)
					+ "&state="+state+"'>下一页</a>";
			html += "<a href='/web/phraseLibrary!SearchLIst?page=" + maxPage
					+ "&state="+state+"'>尾页</a>";
		}

		html += "共" + maxPage + "页　" + maxLine + "行";
		return html;
	}
	}

