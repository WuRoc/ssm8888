package edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.dao.ItemDao;
import edu.pojo.Item;
import edu.pojo.QueryVo;
import edu.utils.Page;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemDao itemDao;
	@Override
	public List<Item> getItemList() {
		return itemDao.getItemList();
	}
	@Override
	public Item getItemById(Integer id) {
		return itemDao.getItemById(id);
	}
	
	
	@Override
	public int updateItemById(Item item) {
		return itemDao.updateItemById(item);
	}
	@Override
	public List<Item> queryItems(QueryVo vo) {
		return itemDao.queryItems(vo);
	}
	@Override
	public int delItemById(Integer id) {
		return itemDao.delItemById(id);
	}
	@Override
	public int itemAdd(Item item) {
		return itemDao.itemAdd(item);
	}
	@Override
	public int delSelectedItems(Integer[] ids) {
		return itemDao.delSelectedItems(ids);
	}
	@Override
	public Page<Item> getPagedItemsByQueryVO(QueryVo vo) {
		Page<Item> page=new Page<Item>();   //该对象共4个属性
		if(vo!=null){
			//页大小
			if(vo.getSize()!=null){
				//vo.setSize(10);
				page.setSize(vo.getSize());   //////1.size
			}
			//当前页码
			if(vo.getPage()!=null){
				page.setPage(vo.getPage());    /////2.page
				vo.setStartNum((vo.getPage()-1)*vo.getSize());
			}
			
			//对页面提交的查询条件的处理(如果添加有前端校验，此处可以省略)
			if(vo.getName()!=null&&!"".equals(vo.getName().trim())){
				vo.setName(vo.getName().trim());
			}else{
				vo.setName(null);
			}
			
		}
		//总记录数    /////3.total
		 page.setTotal(itemDao.getTotalByQueryVO(vo));
		//当前页结果集    /////4.rows
		page.setRows(itemDao.getRowsByQueryVO(vo));
		return page;
	}

}
