package edu.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.pojo.Item;
import edu.pojo.QueryVo;
import edu.service.ItemService;
import edu.utils.Page;

@Controller
public class ItemController {
   
	@Autowired
	private ItemService itemService;
	
	//读取所有商品信息
	@RequestMapping("/itemList.action")
	public ModelAndView itemList(){
		
		List<Item> list = itemService.getItemList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("itemList",list );
		mav.setViewName("itemList");
		return mav;
	}
	
	//读取符合查询条件的分页商品信息
	@RequestMapping("/pagedItems.action")
	public String getPagedItems(QueryVo vo,Model model){
		
		Page<Item> page=itemService.getPagedItemsByQueryVO(vo);
		model.addAttribute("page", page);  //request
		return "itemList2";
	}
	
	
	
	
	//根据id读取被编辑商品的信息
	@RequestMapping("/itemPreEdit.action")
	public ModelAndView itemPreEdit(Integer id){
		
		Item item=itemService.getItemById(id);
		ModelAndView mav=new ModelAndView();
		mav.addObject("item",item );  //request域
		mav.setViewName("editItem");  //转发到editItem.jsp页面
		return mav;
	}
	
	
	
	//根据id修改被编辑的商品信息
	@RequestMapping("/itemUpdate.action")
	public String itemUpdate(Item item){
		itemService.updateItemById(item);
		return "redirect:/itemList.action";
	}
	
	//根据id修改被编辑的商品信息——包括图片上传
		@RequestMapping("/itemUpdate2.action")
		public String itemUpdate2(Item item,MultipartFile pictureFile,HttpServletRequest request) throws Exception{
			
			
			//如果用户选择了要上传的文件
			if(!pictureFile.isEmpty()){
				//获取文件的大小   getSize()
			    //1.给服务器端要保存文件起名，要求任何时候都不重复
				   //uuid   年月日时分秒
				String serverFilename=UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
			    //2.获取用户上传文件的扩展名   timg.jpg   
				String ext=FilenameUtils.getExtension(pictureFile.getOriginalFilename());
			    //3.获取上传文件在服务器端的真实路径 
				String savePath=request.getServletContext().getRealPath("/pic");  //不带  .
			    
				//在上传之前，先判断服务器端保存路径是否存在，如果不存在，创建
				File path=new File(savePath);
				if(path.isDirectory()&& !path.exists()){
					path.mkdirs();
				}
				//4.上传文件到服务器
				pictureFile.transferTo(new File(path,serverFilename+"."+ext));
			     //5.判断item对象是否存在原始图片文件，如果存在，删除
				 if(item.getPic()!=null){
					 File oriFile=new File(path,item.getPic());
					 if(oriFile.isFile()&&oriFile.exists()){
						 oriFile.delete();
					 }
				 }
			     //6.更新item对象中的pic属性（1+2）
				item.setPic(serverFilename+"."+ext);
			}
			itemService.updateItemById(item);
			return "redirect:/itemList.action";
		}
		
		
	//多条件查询 
//	@RequestMapping("/queryItem.action")
//	public String queryItem(QueryVo vo, Model model){
//		System.out.println("查询条件:"+vo.getItem());
//		List<Item> itemList=itemService.queryItems(vo);
//		model.addAttribute("itemList", itemList);
//		return "itemList";
//	}
	
	//删除单条商品
	@RequestMapping("/delItem.action")
	public String delItemById(Integer id){
		itemService.delItemById(id);
		return "redirect:/itemList.action";
	}
	
	
	//restful风格删除单条商品
	@RequestMapping(value="/item/{id}",method=RequestMethod.GET)
	public String delItemById2(@PathVariable(name="id") Integer id){
		itemService.delItemById(id);
		return "redirect:/itemList.action";
	}
	
	//添加商品 /itemAdd.action
	@RequestMapping("/itemAdd.action")
	public String itemAdd(Item item){
		itemService.itemAdd(item);
		return "redirect:itemList.action";
	}
	
	//批量删除  /delSelectedItems.action
	@RequestMapping("/delSelectedItems.action")
	public String delSelectedItems(Integer[] ids){
		itemService.delSelectedItems(ids);
		return "redirect:itemList.action";
	}
	
	//跳转到添加页面 /toAdd.action
	@RequestMapping("/toAdd.action")
	public String toAdd( ){
		return "addItem";
	}
	
	
	@Test
	public void testUUID(){
		//b05e5035-2233-47cc-8f9c-44f9e4d2d803
		//792afa6e-370f-497c-8eaa-dd3413762dbf
		//9bf835cc-7c3a-4126-a36c-ad4a709ddc35
		String uuid=UUID.randomUUID().toString();
		System.out.println(uuid.replaceAll("-", "").toUpperCase());
	}
	
	
	//下载指定的文件  /download.action
	@RequestMapping("/download.action")
	public ResponseEntity<byte[]> download(String picname ,HttpServletRequest request) throws IOException{
		//一、获取文件的真实路径
		String path=request.getServletContext().getRealPath("/pic");
		//创建File对象
		File file=new File(path,picname);
		
		
		//二、创建响应头对象
		HttpHeaders header=new HttpHeaders();
		header.setContentDispositionFormData("attachment", picname);
		header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		/*
		 * 1.将要下载的文件转换为byte[]   FileUtils
		 * 2.响应头，修改浏览器默认的对响应信息的解析方式
		 * 3.设置状态码
		 */
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),header,HttpStatus.OK);
	}
	
}
