package vn.com.quang.dao;

import vn.com.quang.entity.User;

public interface UserDao {
	public User getUserByUserName(String userName);
}
