package com.board2.service;

import java.util.List;
import java.util.Map;

import com.board2.dto.BoardDTO;
import com.board2.repository.BoardRepository;

public class BoardService {
private BoardRepository boardRepo = new BoardRepository();
	
	public List<BoardDTO> getBoards(BoardDTO board){
		return boardRepo.selectBoards(board);
	}
	
	public BoardDTO getBoard(BoardDTO board) {
		return boardRepo.selectBoard(board);
	}
	
	public int addBoard(BoardDTO board) {
		return boardRepo.insertBoard(board);
	}
	
	public int modifyBoard(BoardDTO board) {
		return boardRepo.updateBoard(board);
	}
	
	public int removeBoard(BoardDTO board) {
		return boardRepo.deleteBoard(board);
	}
}
