package com.board2.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.board2.common.CommonView;
import com.board2.dto.BoardDTO;
import com.board2.dto.UserDTO;
import com.board2.service.BoardService;


@WebServlet(urlPatterns = "/board/*")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = CommonView.getCmd(request);
		BoardDTO board = new BoardDTO();
		try {
			BeanUtils.populate(board, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		if("board-list".equals(cmd)) {
			List<BoardDTO> boards = boardService.getBoards(board);
			request.setAttribute("boards", boards);
		} else if("board-view".equals(cmd) || "board-update".equals(cmd)) {
			BoardDTO dbBoard = boardService.getBoard(board);
			request.setAttribute("board", dbBoard);
		}
		CommonView.forwardView(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = CommonView.getCmd(request);
		BoardDTO board = new BoardDTO();
		try {
			BeanUtils.populate(board, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		UserDTO loginUser = (UserDTO)session.getAttribute("user");
		board.setUiNum(loginUser.getUiNum());
		String msg = "";
		String url = "";
		if("insert".equals(cmd)) {
			int result = boardService.addBoard(null);
			msg = "게시물등록이 실패하였습니다.";
			url = "/board/board-insert";
			if(result == 1) {
				msg = "게시물이 등록되었습니다.";
				url = "/board/board-list";
			}
		}else if("update".equals(cmd)) {
			int result = boardService.modifyBoard(board);
			msg = "게시물수정이 실패하였습니다.";
			url = "/board/board-update?biNum=" + board.getBiNum();
			if(result ==1) {
				msg = "게시물이 수정되었습니다.";
				url = "/board/board-list";
			}
		}else if("delete".equals(cmd)) {
			int result = boardService.removeBoard(board);
			msg = "게시물삭제를 실패하였습니다.";
			url = "/board/board-list";
			if(result ==1) {
				msg = "게시물이 삭제되었습니다.";
				url = "/board/board-list";
			}
		}
		CommonView.forwardMsg(request, response, msg, url);
	}

}
