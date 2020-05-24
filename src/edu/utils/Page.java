package edu.utils;

import java.util.List;

public class Page<T> {
    
	private int total;   //总记录数
	private int page;     //当前页码
	private int size;     //页大小
    private List<T> rows;   //当前页结果集
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
    
	
    
}
