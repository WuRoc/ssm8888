package edu.service;

import java.util.List;

import edu.pojo.Item;
import edu.pojo.QueryVo;
import edu.utils.Page;

public interface ItemService {
	 List<Item> getItemList();

	Item getItemById(Integer id);

	int updateItemById(Item item);

	List<Item> queryItems(QueryVo vo);

	int delItemById(Integer id);

	int itemAdd(Item item);

	int delSelectedItems(Integer[] ids);

	Page<Item> getPagedItemsByQueryVO(QueryVo vo);
}
