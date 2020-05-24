package edu.pojo;

public class QueryVo {
//	private Item item;
//
//	public Item getItem() {
//		return item;
//	}
//
//	public void setItem(Item item) {
//		this.item = item;
//	}
	
	//////////////////////////////////////
	//存储分页查询所需要的条件
	private Integer id;     //多条件查询中的查询条件
	private String name;    //多条件查询中的查询条件
	
	private Integer page=1;  //当前页码
	private Integer size=5;   //页大小
	private Integer startNum=0;  //每一页第一条记录的编号

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getStartNum() {
		return startNum;
	}

	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}
	
	
	
}
