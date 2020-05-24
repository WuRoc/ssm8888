package edu.controller;

import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.pojo.User;
import edu.service.UserService;
import edu.utils.VerifyCode;

@Controller
public class UserController {
	
	@Autowired 
	private UserService service;
   
	//根据用户名查询该名称是否存在
		@RequestMapping("/chkName.action")
		@ResponseBody
		public User chkName(@RequestBody User user){
			System.out.println("用户名："+user.getUsername());
			return service.getByName(user.getUsername());
		}
		
		@Test
		public void tt() throws FileNotFoundException, IOException{
			VerifyCode vc=new VerifyCode();
			BufferedImage image = vc.getImage();
			String text = vc.getText();
			System.out.println(text);
			VerifyCode.output(image, new FileOutputStream("f:/vcode.jpg"));
		}
		
		//创建验证码图片 vcode.action
		@RequestMapping("/vcode.action")
		public void vcode(HttpSession session,HttpServletResponse response) throws IOException{
			VerifyCode vc=new VerifyCode();
			BufferedImage image = vc.getImage();
			String text = vc.getText();
			//1.验证码字符串应该存储到session域对象中
			session.setAttribute("sessionCode", text);
			//2.应该将生成的验证码图片响应给客户端（浏览器，img标签）
			VerifyCode.output(image, response.getOutputStream());
			
		}
		
		//登录方法  /login.action
		@RequestMapping("/login.action")
		public String login(User user,String vcode,HttpSession session,HttpServletRequest request) throws IOException{
			
			
			String sessionCode = session.getAttribute("sessionCode").toString();
			if(!sessionCode.equalsIgnoreCase(vcode)){
				//验证码错误
				request.setAttribute("errorMsg", "验证码错误");
				return "forward:/login.jsp";
			}
			User findUser=service.getByNameAndPwd(user);
			if(findUser!=null){
				//登录成功
				session.setAttribute("loginUser", findUser);
				return "redirect:/pagedItems.action";
			}else{
				//用户名或密码错误
				request.setAttribute("errorMsg", "用户名或密码错误");
				return "forward:/login.jsp";
			}
			
		}
		
}
