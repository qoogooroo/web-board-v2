package com.board2.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.board2.common.CommonView;
import com.board2.dto.UserDTO;
import com.board2.service.UserService;


@WebServlet(urlPatterns = "/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService = new UserService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = CommonView.getCmd(request);
		UserDTO user = new UserDTO();
		try {
			BeanUtils.populate(user, request.getParameterMap());	//BeanUtils 써먹으려고 parameter 와 DTO 변수의 이름을 똑같이 했다
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String msg = "";
		String url = "";
		if("join".equals(cmd)) {
			
		}else if("login".equals(cmd)) {
			UserDTO loginUser = userService.getUserByIdAndPwd(user);
			msg = "아이디나 비밀번호가 잘못되었습니다.";
			url = "/view/user/login";
			if(loginUser!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", loginUser);
				msg = loginUser.getUiName() + "님 반갑습니다!";
				url = "/";
			}
		}else if("update".equals(cmd)) {
			
		}else if("delete".equals(cmd)) {
			
		}

		CommonView.forwardMsg(request, response, msg, url);
	}

}
