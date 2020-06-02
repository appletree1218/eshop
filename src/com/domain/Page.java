package com.domain;

import java.util.List;

public class Page {
	private List records;
	private int startIndex;//每页开始的索引值
	private int pageNum;//当前页码
	private int totalPage;//总页数
	private int pageSize = 10;//每页显示多少
	private int totalRecords;//总数据数
	//private int startPage;//显示的开始页码
	//private int endPage;//显示的结束页码
	
	public Page(int pageNum, int totalRecords) {
		super();
		this.pageNum = pageNum;
		this.totalRecords = totalRecords;
		
		//计算每页开始记录的索引
		startIndex = (pageNum-1)*pageSize;
		//计算总页数
		totalPage = totalRecords%pageSize==0?totalRecords/pageSize:(totalRecords/pageSize+1);
		
		//显示的页码
		/*
		if(totalPage<pageSize){
			startPage = 1;
			endPage = totalPage;
		}else{
			startPage = pageNum-4;
			endPage = pageNum+4;

			if(startPage<1){
				startPage = 1;
				endPage = 9;
			}

			if(endPage>totalPage){
				endPage = totalPage;
				startPage = totalPage-8;
			}
		}
		*/
	}

	public List getRecords() {
		return records;
	}

	public void setRecords(List records) {
		this.records = records;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
}
//	public int getStartPage() {
//		return startPage;
//	}

//	public void setStartPage(int startPage) {
//		this.startPage = startPage;
//	}

//	public int getEndPage() {
//		return endPage;
//	}

//	public void setEndPage(int endPage) {
//		this.endPage = endPage;
//	}

