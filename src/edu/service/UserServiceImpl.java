package edu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.dao.UserDao;
import edu.pojo.User;

@Service
public class UserServiceImpl implements UserService {
   @Autowired UserDao dao;

	@Override
	public User getByName(String username) {
		return dao.getByName(username);
	}

	@Override
	public int regist(User user) {
		return dao.regist(user);
	}

	@Override
	public User checkLogin(User user) {
		return dao.getUserByNameAndPwd(user);
	}

	@Override
	public User getByNameAndPwd(User user) {
		
		return dao.getUserByNameAndPwd(user);
	}
}
