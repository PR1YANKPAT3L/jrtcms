package com.jrtcms.web.util;

import java.util.ArrayList;
import java.util.List;

public class Page {
	private int rowCount;//代表要查询信息的总的数目(从数据库中查询而得)
	private int size;//每页显示的条目数
	private int num;//用户选择的页号
	
	private int pageCount;//总页数 根据rowCount和size算出  (int)Math.ceil(double(rowCount/size))
	private int startRow;//指的是分页查询开始的行数 即limit后面的第一个参数 (num-1)*size
	private int first = 1;//代表首页
	private int last;//末页  即等于pageCount
	private int prev;//前一页 num-1
	private int next;//下一页 num+1
	private int start;//导航栏的起始位置 根据当前用户选择的页号决定 
	private int end;//导航栏的结束位置
	private int numCount = 10;//代表导航栏显示的数目为numCount+1
	private List result= new ArrayList();//将查询的一页信息放到result里面
	

	public List getResult() {
		return result;
	}

	public void setResult(List result) {
		this.result = result;
	}

	/**
	 * @param rowCount 从数据库中查询中选择信息的总数
	 * @param size 分页的条目数
	 * @param str_num 指的用户选择的页号
	 * @function 分页导航栏
	 */
	public Page(int rowCount,int size,String str_num){
		this.num = 1;
		//可以首先去判断str_num的值是否为数值类型  如果不是 则默认用户访问的第一页
		if(str_num != null&&!"".equals(str_num)){
			this.num = Integer.parseInt(str_num);
		}
		this.rowCount = rowCount;
		this.size = size;
		this.pageCount = (int) Math.ceil((double)this.rowCount/this.size);
		this.num = Math.min(this.num, this.pageCount);
		this.num = Math.max(this.num, 1);
		
		this.startRow = (this.num-1)*this.size;
		this.last = this.pageCount;
		this.prev = Math.max(this.num-1, 1);
		this.next = Math.min(this.num+1, pageCount);
		
		this.start = Math.max(this.num-(this.numCount/2),this.first);
		
		this.end = Math.min(this.start +this.numCount,this.pageCount);
		
		if(this.end-this.start < this.numCount){
			this.start = Math.max(this.end-this.numCount, 1);
		}
	}
	
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getNumCount() {
		return numCount;
	}
	public void setNumCount(int numCount) {
		this.numCount = numCount;
	}

}
