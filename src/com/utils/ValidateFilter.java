package com.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ValidateFilter implements Filter{
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("--------------------log:过滤器destroy-----------------------");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		String path = uri.substring(uri.indexOf("eshop/")+6) ;
		
		if("".equals(path) || path.toLowerCase().contains("index") || path.toLowerCase().contains("login")
				|| path.toLowerCase().contains("register")){
			chain.doFilter(request, response);
		}else{
			String username = (String) session.getAttribute("username");
			
			if(username!=null && !"".equals(username)){
				chain.doFilter(request, response);
			}else{
				response.sendRedirect("foreForwardAction_login.action");
			}
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("--------------------log:过滤器init-----------------------");
	}
}
