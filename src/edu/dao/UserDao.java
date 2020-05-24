package edu.dao;

import edu.pojo.User;


public interface UserDao {

	User getByName(String username);

	int regist(User user);

	User getUserByNameAndPwd(User user);
    

}
