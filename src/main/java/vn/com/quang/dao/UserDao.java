package vn.com.quang.dao;

import vn.com.quang.entity.User;
import vn.com.quang.entity.UserDetail;

public interface UserDao {
	public User getUserByUserName(String userName);
	
	public void updateUserDetail(UserDetail bean);
	
	public int insertNewUserDetail(UserDetail bean);

	public UserDetail getUserDetailById(int id);
	
	public UserDetail getUserDetailByUserName(String userName);
}
