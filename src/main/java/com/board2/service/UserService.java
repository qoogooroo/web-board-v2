package com.board2.service;

import java.util.List;

import com.board2.dto.UserDTO;
import com.board2.repository.UserRepository;

public class UserService {

	private UserRepository userRepo = new UserRepository();

	public List<UserDTO> getUsers(UserDTO user){
		return userRepo.selectUsers(user);
	}
	
	public UserDTO getUser(int uiNum) {
		return userRepo.selectUser(uiNum);
	}
	
	public UserDTO getUserByIdAndPwd(UserDTO user) {
		return userRepo.selectUserByIdAndPwd(user);
	}
	
	public int join(UserDTO user) {
		return userRepo.insertUser(user);
	}
	
	public int modifyUser(UserDTO user) {
		return userRepo.updateUser(user);
	}
	
	public int removeUser(int uiNum) {
		return userRepo.deleteUser(uiNum);
	}
}
