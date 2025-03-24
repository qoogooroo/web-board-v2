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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = CommonView.getCmd(request);
		String msg = "";

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = CommonView.getCmd(request);
		UserDTO user = new UserDTO();
		try {
			BeanUtils.populate(user, request.getParameterMap()); // BeanUtils 써먹으려고 parameter 와 DTO 변수의 이름을 똑같이 했다
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String msg = "";
		String url = "";

		HttpSession session = request.getSession();
		if ("join".equals(cmd)) {
			int result = userService.join(user);
			msg = "회원가입이 완료되었습니다.";
			url = "/views/user/login";
			if (result == -1) {
				msg = "는 사용하실 수 없는 아이디 입니다.";
				url = "/views/user/login";
			}
		} else if ("login".equals(cmd)) {
			UserDTO loginUser = userService.getUserByIdAndPwd(user);
			msg = "아이디나 비밀번호가 잘못되었습니다.";
			url = "/views/user/login";
			session.setAttribute("user", loginUser);
			msg = loginUser.getUiName() + "님 반갑습니다!";
			url = "/";
		} else if ("update".equals(cmd)) {
			UserDTO loginUser = (UserDTO) session.getAttribute("user");
			int uiNum = loginUser.getUiNum();
			user.setUiNum(uiNum);
			int result = userService.modifyUser(user);
			msg = "수정이 실패하였습니다.";
			url = "/user/view";
			if(result == 1) {
				loginUser = userService.getUser(uiNum);
				session.setAttribute("user", loginUser);
				msg = "회원정보가 수정되었습니다.";
			}
			System.out.println(user);
		} else if ("delete".equals(cmd)) {
			UserDTO loginUser = (UserDTO) session.getAttribute("user");
			msg = "로그인이 필요합니다.";
			url = "/views/user/login";
			int result = userService.removeUser(loginUser.getUiNum());
			msg = "이미 탈퇴된 회원입니다.(존재하지 않는 회원)";
			if (result == 1) {
				msg = "회원 탈퇴가 성공하였습니다.";
				session.invalidate();
			}
		} else if ("logout".equals(cmd)) {
			session.invalidate();
			msg = "로그아웃 되었습니다.";
			url = "/";
		}

		CommonView.forwardMsg(request, response, msg, url);
	}

}
