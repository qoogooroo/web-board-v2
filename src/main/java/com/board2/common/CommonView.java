package com.board2.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommonView {

	private static final String MSG = "/views/common/msg";

	public static String getCmd(HttpServletRequest req) {
		String uri = req.getRequestURI();
		int idx = uri.lastIndexOf("/") + 1;
		return uri.substring(idx);
	}

	public static void forwardMsg(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(MSG);
		rd.forward(req, res);
	}
	
	public static void forwardMsg(ServletRequest req, ServletResponse res, String msg, String url) 
			throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		forwardMsg(req, res);
	}
	
	public static void forwardView(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uri = req.getRequestURI();
		RequestDispatcher rd = req.getRequestDispatcher("/views" + uri);
		rd.forward(req, res);
	}
}
