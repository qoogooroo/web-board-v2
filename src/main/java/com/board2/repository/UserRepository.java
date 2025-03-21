package com.board2.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.board2.common.CommonFactory;
import com.board2.dto.UserDTO;

public class UserRepository {

	public List<UserDTO> selectUsers(UserDTO user){
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectList("UserMapper.selectUsers",user);
		}
	}
	
	public UserDTO selectUser(int uiNum) {
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("UserMapper.selectUser",uiNum);
		}
	}
	
	public UserDTO selectUserById(UserDTO user) {
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("UserMapper.selectUserById",user);
		}
	}
	
	public UserDTO selectUserByIdAndPwd(UserDTO user) {
		try(SqlSession session = CommonFactory.getSSF().openSession()){
			return session.selectOne("UserMapper.selectUserByIdAndPwd",user);
		}
	}
	
	public int insertUser(UserDTO user) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.insert("UserMapper.insertUser",user);
		}
	}
	
	public int updateUser(UserDTO user) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.update("UserMapper.updateUser", user);
		}
	}
	public int deleteUser(int uiNum) {
		try(SqlSession session = CommonFactory.getSSF().openSession(true)){
			return session.delete("UserMapper.deleteUser", uiNum);
		}
	}
	
	public static void main(String[] args) {
		UserRepository ur = new UserRepository();
		UserDTO user = new UserDTO();
		user.setUiName("drinkWater");
		user.setUiId("waterman");
		user.setUiPwd("mizu1");
		user.setUiGrade("1");
		System.out.println(ur.selectUserById(user));
		System.out.println(ur.selectUserByIdAndPwd(user));
		System.out.println(ur.selectUsers(null));
		
	}
}
