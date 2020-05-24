package edu.service;

import edu.pojo.User;

public interface UserService {

	User getByName(String username);

	int regist(User user);

	User checkLogin(User user);

	User getByNameAndPwd(User user);

}
