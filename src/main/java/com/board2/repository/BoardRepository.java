package com.board2.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.board2.common.CommonFactory;
import com.board2.dto.BoardDTO;

public class BoardRepository {

	public List<BoardDTO> selectBoards(BoardDTO board){
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectList("BoardMapper.selectBoards", board);
		}
	}
	
	public BoardDTO selectBoard(BoardDTO board) {
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("BoardMapper.selectBoard", board);
		}
	}
	
	public int insertBoard(BoardDTO board) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.insert("BoardMapper.insertBoard", board);
		}
	}
	
	public int updateBoard(BoardDTO board) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.update("BoardMapper.updateBoard", board);
		}
	}
	
	public int deleteBoard(BoardDTO board) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.delete("BoardMapper.deleteBoard", board);
		}
	}
}
