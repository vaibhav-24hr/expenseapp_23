package com.expenses.project.LoginCheckFilter;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

//@Component
public class LoginCheckFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = ((HttpServletRequest)request).getSession(); // Casting in ((HttpServletRequest)request)
		
		System.out.println("-----Login Check Failed");
		
		String url = ((HttpServletRequest)request).getRequestURI();
		if(!url.contains("/assets"))
		System.out.println(url);
	
		if(url.contains("/assets") || url.contains("/login") || url.contains("saveuser") ||  url.contains("/logout") || url.contains("/signup") || url.contains("/forgetpassword")
				|| url.contains("/authentication") || url.contains("/updatepasswordjspopen") || url.contains("/updatemypassword") || url.contains("/sendotpforforgetpassword")) {
			chain.doFilter(request, response);
		}else {
			if(session.getAttribute("user")==null) {
				System.out.println("=========");
				request.setAttribute("error", "please Login before trying to Access the website");
				RequestDispatcher rd =  request.getRequestDispatcher("login");
				rd.forward(request, response);
			}else {
				chain.doFilter(request, response);
			}
		}
	}
}
