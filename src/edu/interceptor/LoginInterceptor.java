package edu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("inter01.....afterCompletion");

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		System.out.println("inter01.....postHandle");
	}
    //url----handle
	//url----preHandle---放行--handle---------postHandle
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		//如果请求url中包含login，放行
		if(request.getRequestURI().toLowerCase().contains("login")){
			return true;
		}
		//如果session中包含loginUser对象，放行
		Object user = request.getSession().getAttribute("loginUser");
		if(user!=null){
			return true;
		}else{
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
		return false;
	}

}
