package com.board2.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board2.dto.UserDTO;


@WebServlet(urlPatterns = "/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); 
		String cmd = uri.substring(uri.lastIndexOf("/")+1);
		if("join".equals(cmd)) {
			
		}else if("login".equals(cmd)) {
			UserDTO user = new UserDTO();
		}else if("update".equals(cmd)) {
			
		}else if("delete".equals(cmd)) {
			
		}
	}

}
