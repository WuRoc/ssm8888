package edu.dao;

import java.util.List;

import edu.pojo.Item;
import edu.pojo.QueryVo;

public interface ItemDao {
    List<Item> getItemList();

	Item getItemById(Integer id);

	int updateItemById(Item item);


	int delItemById(Integer id);

	int itemAdd(Item item);

	int delSelectedItems(Integer[] ids);

	List<Item> queryItems(QueryVo vo);

	
	int getTotalByQueryVO(QueryVo vo);

	List<Item> getRowsByQueryVO(QueryVo vo);
	

}
