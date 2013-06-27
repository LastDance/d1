package com.dms.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SystemInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		String uri = request.getRequestURI();

		if (uri.indexOf("login") == -1) {
			Object user = request.getSession().getAttribute("sysuser");
			if (user == null) {
				response.sendRedirect("redirect:/login");
				return false;
			} else {
				return true;
			}
		}
		return true;

	}
}
